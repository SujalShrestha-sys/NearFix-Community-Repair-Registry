package nearfix.nearfix.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/repair-request")
public class RepairRequestServlet extends HttpServlet {

    private IRepairService repairService = new RepairService();
    private ICategoryService categoryService = new CategoryService();


    private boolean isUserLoggedIn(HttpSession session) {
        return session != null && session.getAttribute("userId") != null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(false);

        String action = request.getParameter("action");

        try {
            switch (action) {

                case "post":
                    request.setAttribute("categories", categoryService.getAllCategories());
                    request.getRequestDispatcher("/user/post-request.jsp").forward(request, response);
                    break;

                case "view":
                    int requestId = Integer.parseInt(request.getParameter("id"));
                    RepairRequest repairReq = repairService.getRepairRequest(requestId);
                    request.setAttribute("repairRequest", repairReq);
                    request.getRequestDispatcher("/user/request-detail.jsp").forward(request, response);
                    break;

                case "myRequests":
                    int userId = (Integer) session.getAttribute("userId");
                    List<RepairRequest> requests = repairService.getUserRequests(userId);
                    request.setAttribute("requests", requests);
                    request.getRequestDispatcher("/user/my-requests.jsp").forward(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading repair requests: " + e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Critical error");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(false);

        if (!isUserLoggedIn(session)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");

        try {
            switch (action) {

                case "create":
                    createRequest(request, response, session);
                    break;

                case "update":
                    updateRequest(request, response);
                    break;

                case "cancel":
                    cancelRequest(request, response);
                    break;

                default:
                    response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error processing request: " + e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Critical error");
            }
        }
    }

    private void createRequest(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, SQLException, ValidationException {

        int userId = (Integer) session.getAttribute("userId");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        String urgency = request.getParameter("urgency");

        int requestId = repairService.postRepairRequest(userId, categoryId, itemName, description, urgency);

        response.sendRedirect(request.getContextPath() + "/repair-request?action=view&id=" + requestId);
    }

    private void updateRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ValidationException {

        int requestId = Integer.parseInt(request.getParameter("requestId"));

        RepairRequest req = new RepairRequest();
        req.setRequestId(requestId);
        req.setItemName(request.getParameter("itemName"));
        req.setDescription(request.getParameter("description"));
        req.setUrgency(request.getParameter("urgency"));

        repairService.updateRequest(req);

        response.sendRedirect(request.getContextPath() + "/repair-request?action=view&id=" + requestId);
    }

    private void cancelRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ValidationException {

        int requestId = Integer.parseInt(request.getParameter("requestId"));
        repairService.cancelRequest(requestId);

        response.sendRedirect(request.getContextPath() + "/repair-request?action=myRequests");
    }
}