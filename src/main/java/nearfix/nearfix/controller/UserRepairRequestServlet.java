package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;

import java.io.IOException;
import java.util.List;

@WebServlet("/repair-request/*")
public class UserRepairRequestServlet extends HttpServlet {

    private IRepairService repairService = new RepairService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/user/dashboard");
            return;
        }

        try {
            switch (action) {
                case "post":
                    request.setAttribute("categories", categoryService.getAllCategories());
                    PageResponse.showMessage(response, "Post Repair Request", "The post request UI will be built next.");
                    break;

                case "view":
                    int requestId = Integer.parseInt(request.getParameter("id"));
                    RepairRequest repairReq = repairService.getRepairRequest(requestId);
                    request.setAttribute("repairRequest", repairReq);
                    PageResponse.showMessage(response, "Repair Request Detail", "Loaded request #" + requestId + ".");
                    break;

                case "myRequests":
                    int userId = (Integer) session.getAttribute("userId");
                    String search = request.getParameter("search");
                    String status = request.getParameter("status");

                    List<RepairRequest> requests = repairService.searchUserRequests(userId, search, status);
                    request.setAttribute("requests", requests);
                    request.setAttribute("search", search);
                    request.setAttribute("selectedStatus", status);

                    PageResponse.showMessage(response, "My Repair Requests", "Loaded " + requests.size() + " request(s).");
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

        String action = request.getParameter("action");
        String message = "";
        String error = "";

        try {
            switch (action) {
                case "create":
                    int userId = (Integer) session.getAttribute("userId");
                    int categoryId = Integer.parseInt(request.getParameter("category"));
                    String itemName = request.getParameter("itemName");
                    String description = request.getParameter("description");
                    String urgency = request.getParameter("urgency");
                    int requestId = repairService.postRepairRequest(userId, categoryId, itemName, description, urgency);
                    message = "Repair request created successfully!";
                    response.sendRedirect(request.getContextPath() + "/repair-request?action=view&id=" + requestId);
                    return;

                case "update":
                    int reqId = Integer.parseInt(request.getParameter("requestId"));
                    RepairRequest req = new RepairRequest();
                    req.setRequestId(reqId);
                    req.setItemName(request.getParameter("itemName"));
                    req.setDescription(request.getParameter("description"));
                    req.setUrgency(request.getParameter("urgency"));
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

        response.sendRedirect(request.getContextPath() + "/repair-request?action=myRequests");
    }
}
