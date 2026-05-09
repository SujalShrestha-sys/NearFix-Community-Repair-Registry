package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;
import java.util.List;

@WebServlet({ "/user/repair-request", "/user/repair-request/*", "/user/my-requests", "/user/post-request" })
public class UserRepairRequestServlet extends HttpServlet {

    private IRepairService repairService = new RepairService();
    private ICategoryService categoryService = new CategoryService();
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int currentUserId = (Integer) session.getAttribute("userId");
            User user = userService.getUserById(currentUserId);
            request.setAttribute("user", user);
        } catch (Exception e) {
        }

        String action = request.getParameter("action");
        String pathInfo = request.getServletPath() + (request.getPathInfo() != null ? request.getPathInfo() : "");

        if (action == null || action.isEmpty()) {
            if (pathInfo.equals("/user/my-requests"))
                action = "myRequests";
            else if (pathInfo.equals("/user/post-request"))
                action = "post";
            else if (pathInfo.contains("/edit"))
                action = "edit";
            else if (pathInfo.contains("/view"))
                action = "view";
        }

        if (action == null || action.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/user/dashboard");
            return;
        }

        try {
            switch (action) {
                case "post":
                    request.setAttribute("categories", categoryService.getAllCategories());
                    request.getRequestDispatcher("/WEB-INF/views/user/post-request.jsp").forward(request, response);
                    break;

                case "view":
                    int requestId = Integer.parseInt(request.getParameter("id"));
                    RepairRequest repairReq = repairService.getRepairRequest(requestId);
                    request.setAttribute("repairRequest", repairReq);
                    request.getRequestDispatcher("/WEB-INF/views/user/request-detail.jsp").forward(request, response);
                    break;
                
                case "edit":
                    int editId = Integer.parseInt(request.getParameter("id"));
                    RepairRequest editReq = repairService.getRepairRequest(editId);
                    request.setAttribute("req", editReq);
                    request.setAttribute("categories", categoryService.getAllCategories());
                    request.getRequestDispatcher("/WEB-INF/views/user/edit-request.jsp").forward(request, response);
                    break;

                case "myRequests":
                    int userId = (Integer) session.getAttribute("userId");
                    String search = request.getParameter("search");
                    String status = request.getParameter("status");

                    List<RepairRequest> requests = repairService.searchUserRequests(userId, search, status);
                    request.setAttribute("requests", requests);
                    request.setAttribute("search", search);
                    request.setAttribute("selectedStatus", status);

                    request.getRequestDispatcher("/WEB-INF/views/user/my-requests.jsp").forward(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/user/dashboard");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            PageResponse.showMessage(response, "Repair Request Error", "Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // --- Fetch User for Sidebar ---
        try {
            int currentUserId = (Integer) session.getAttribute("userId");
            User user = userService.getUserById(currentUserId);
            request.setAttribute("user", user);
        } catch (Exception e) {}

        String action = request.getParameter("action");
        String message = "";
        String error = "";

        try {
            switch (action) {
                case "create":
                    try {
                        int userId = (Integer) session.getAttribute("userId");
                        int categoryId = Integer.parseInt(request.getParameter("category"));
                        String itemName = request.getParameter("itemName");
                        String description = request.getParameter("description");
                        String urgency = request.getParameter("urgency");
                        if (urgency != null)
                            urgency = urgency.trim().toUpperCase();
                        String locationStr = request.getParameter("location");

                        repairService.postRepairRequest(userId, categoryId, itemName, description, urgency,
                                locationStr);
                        session.setAttribute("successMessage", "Repair request created successfully!");
                        response.sendRedirect(request.getContextPath() + "/user/my-requests");
                        return;
                    } catch (Exception e) {
                        session.setAttribute("errorMessage", "Post failed: " + e.getMessage());
                        response.sendRedirect(request.getContextPath() + "/user/post-request");
                        return;
                    }

                case "update":
                    int reqId = Integer.parseInt(request.getParameter("requestId"));
                    RepairRequest req = new RepairRequest();
                    req.setRequestId(reqId);
                    req.setItemName(request.getParameter("itemName"));
                    req.setCategoryId(Integer.parseInt(request.getParameter("category")));
                    req.setDescription(request.getParameter("description"));
                    req.setLocation(request.getParameter("location"));
                    String updateUrgency = request.getParameter("urgency");
                    if (updateUrgency != null)
                        req.setUrgency(updateUrgency.trim().toUpperCase());
                    repairService.updateRequest(req);
                    message = "Repair request updated successfully!";
                    break;

                case "cancel":
                    int cancelId = Integer.parseInt(request.getParameter("requestId"));
                    repairService.cancelRequest(cancelId);
                    message = "Repair request cancelled.";
                    break;

                case "rate":
                    int rateReqId = Integer.parseInt(request.getParameter("requestId"));
                    int rScore = Integer.parseInt(request.getParameter("rating"));
                    String rComment = request.getParameter("comment");
                    int rUserId = (Integer) session.getAttribute("userId");
                    repairService.addRating(rateReqId, rUserId, rScore, rComment);
                    message = "Thank you for your feedback!";
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/user/dashboard");
                    return;
            }
        } catch (Exception e) {
            error = e.getMessage();
        }

        if (!message.isEmpty())
            session.setAttribute("successMessage", message);
        if (!error.isEmpty())
            session.setAttribute("errorMessage", error);

        response.sendRedirect(request.getContextPath() + "/user/my-requests");
    }
}
