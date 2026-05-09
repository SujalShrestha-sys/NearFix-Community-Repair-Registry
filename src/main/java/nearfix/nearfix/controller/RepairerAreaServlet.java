package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.*;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.util.List;

@WebServlet("/repairer/*")
public class RepairerAreaServlet extends HttpServlet {

    private final IRepairService repairService = new RepairService();
    private final IRepairerService repairerService = new RepairerService();
    private final ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || !"REPAIRER".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String pathInfo = request.getPathInfo();
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
            return;
        }

        try {
            int repairerId = (Integer) session.getAttribute("userId");
            Repairer repairer = repairerService.getRepairerProfile(repairerId);
            request.setAttribute("repairer", repairer);

            switch (pathInfo) {
                case "/dashboard":
                    request.setAttribute("pageTitle", "Dashboard");
                    // Add stats and active jobs to request
                    List<RepairRequest> myActive = repairService.searchRepairerRequests(repairerId, null,
                            "IN_PROGRESS");
                    request.setAttribute("activeJobs", myActive);
                    // For now, let's just forward to the main dashboard
                    request.getRequestDispatcher("/WEB-INF/views/repairer/dashboard/index.jsp").forward(request,
                            response);
                    break;

                case "/profile":
                    request.setAttribute("pageTitle", "My Profile");
                    request.getRequestDispatcher("/WEB-INF/views/repairer/profile.jsp").forward(request, response);
                    break;

                case "/available-requests":
                    request.setAttribute("pageTitle", "Browse Jobs");
                    String search = request.getParameter("search");
                    String categoryIdStr = request.getParameter("categoryId");
                    Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty())
                            ? Integer.parseInt(categoryIdStr)
                            : null;

                    List<RepairRequest> pending = repairService.searchPendingRequests(search, categoryId, 1, 100);
                    request.setAttribute("requests", pending);
                    request.setAttribute("search", search);
                    request.setAttribute("selectedCategoryId", categoryId);
                    request.setAttribute("categories", categoryService.getAllCategories());

                    request.getRequestDispatcher("/WEB-INF/views/repairer/available-requests.jsp").forward(request,
                            response);
                    break;

                case "/my-requests":
                    request.setAttribute("pageTitle", "My Jobs");
                    String mySearch = request.getParameter("search");
                    String myStatus = request.getParameter("status");

                    List<RepairRequest> assigned = repairService.searchRepairerRequests(repairerId, mySearch, myStatus);
                    request.setAttribute("requests", assigned);
                    request.setAttribute("search", mySearch);
                    request.setAttribute("selectedStatus", myStatus);

                    request.getRequestDispatcher("/WEB-INF/views/repairer/my-requests.jsp").forward(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/repairer/dashboard/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || !"REPAIRER".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        int repairerId = (Integer) session.getAttribute("userId");
        String message = "";
        String error = "";

        try {
            switch (action) {
                case "update-profile":
                    String name = request.getParameter("fullName");
                    String phone = request.getParameter("repairerPhone");
                    String category = request.getParameter("category");
                    String bio = request.getParameter("bio");
                    String serviceArea = request.getParameter("serviceArea");
                    String experienceStr = request.getParameter("experience");
                    int experience = 0;
                    if (experienceStr != null && !experienceStr.isEmpty()) {
                        experience = Integer.parseInt(experienceStr);
                    }

                    Repairer repairer = repairerService.getRepairerProfile(repairerId);
                    if (repairer != null) {
                        repairer.setName(name);
                        repairer.setPhone(phone);
                        repairer.setSpecialization(category);
                        repairer.setExpertise(bio);
                        repairer.setServiceArea(serviceArea);
                        repairer.setYearsOfExperience(experience);
                        repairerService.updateProfile(repairer);
                        message = "Profile updated successfully!";
                    }
                    break;

                case "accept-request":
                    int acceptId = Integer.parseInt(request.getParameter("requestId"));
                    repairService.acceptRequest(acceptId, repairerId);
                    message = "Request accepted!";
                    break;

                case "complete-request":
                    int completeId = Integer.parseInt(request.getParameter("requestId"));
                    repairService.markRequestAsCompleted(completeId);
                    message = "Request marked as completed!";
                    break;

                case "toggle-save":
                    int saveReqId = Integer.parseInt(request.getParameter("requestId"));
                    repairService.toggleSaveJob(repairerId, saveReqId);
                    message = "Wishlist updated!";
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
                    return;
            }
        } catch (Exception e) {
            error = e.getMessage();
        }

        if (!message.isEmpty())
            session.setAttribute("successMessage", message);
        if (!error.isEmpty())
            session.setAttribute("errorMessage", error);

        String redirectPath = "/repairer/dashboard";
        if ("update-profile".equals(action)) {
            redirectPath = "/repairer/profile";
        } else if ("accept-request".equals(action)) {
            redirectPath = "/repairer/my-requests";
        } else if ("complete-request".equals(action)) {
            redirectPath = "/repairer/my-requests";
        }

        response.sendRedirect(request.getContextPath() + redirectPath);
    }
}
