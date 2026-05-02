package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * RepairerServlet - Handles all repairer-related actions.
 */
@WebServlet("/repairer/*")
public class RepairerServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RepairerServlet.class.getName());

    private final IRepairService repairService = new RepairService();
    private final IRepairerService repairerService = new RepairerService();

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

            switch (pathInfo) {
                case "/dashboard":
                    Repairer repairer = repairerService.getRepairerProfile(repairerId);
                    request.setAttribute("repairer", repairer);
                    request.getRequestDispatcher("/WEB-INF/views/repairer/dashboard.jsp").forward(request, response);
                    break;

                case "/profile":
                    Repairer profile = repairerService.getRepairerProfile(repairerId);
                    request.setAttribute("repairer", profile);
                    request.getRequestDispatcher("/WEB-INF/views/repairer/profile.jsp").forward(request, response);
                    break;

                case "/available-requests":
                    String search = request.getParameter("search");
                    String categoryIdStr = request.getParameter("categoryId");
                    Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr) : null;
                    
                    List<RepairRequest> pending = repairService.searchPendingRequests(search, categoryId, 1, 100);
                    request.setAttribute("requests", pending);
                    request.setAttribute("search", search);
                    request.setAttribute("selectedCategoryId", categoryId);
                    request.setAttribute("categories", new nearfix.nearfix.service.impl.CategoryService().getAllCategories());
                    
                    request.getRequestDispatcher("/WEB-INF/views/repairer/available-requests.jsp").forward(request,
                            response);
                    break;

                case "/my-requests":
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
            logger.log(Level.SEVERE, "RepairerServlet doGet error", e);
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/repairer/dashboard.jsp").forward(request, response);
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
                    String name = request.getParameter("name");
                    String phone = request.getParameter("phone");
                    String specialization = request.getParameter("specialization");
                    String expertise = request.getParameter("expertise");

                    Repairer repairer = repairerService.getRepairerProfile(repairerId);
                    if (repairer != null) {
                        repairer.setName(name);
                        repairer.setPhone(phone);
                        repairer.setSpecialization(specialization);
                        repairer.setExpertise(expertise);
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

                default:
                    response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
                    return;
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "RepairerServlet doPost error", e);
            error = e.getMessage();
        }

        if (!message.isEmpty())
            session.setAttribute("successMessage", message);
        if (!error.isEmpty())
            session.setAttribute("errorMessage", error);

        response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
    }
}
