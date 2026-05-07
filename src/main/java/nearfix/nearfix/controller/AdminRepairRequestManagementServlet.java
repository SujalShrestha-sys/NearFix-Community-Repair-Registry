package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/requests")
public class AdminRepairRequestManagementServlet extends HttpServlet {

    private final IRepairService repairService = new RepairService();
    private final ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int page = 1;
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }

            String search = request.getParameter("search");
            String categoryIdStr = request.getParameter("categoryId");
            Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty()) ? Integer.parseInt(categoryIdStr)
                    : null;
            String status = request.getParameter("status");

            int pageSize = 10;
            // For admin, we want to search all requests, not just pending
            // I'll need a more generic search method for all requests
            List<RepairRequest> requests = repairService.searchAllRequests(search, categoryId, status, page, pageSize);
            int totalRequests = repairService.getTotalRequestsCount(search, categoryId, status);
            int totalPages = (totalRequests + pageSize - 1) / pageSize;

            request.setAttribute("requests", requests);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalRequests", totalRequests);
            request.setAttribute("search", search);
            request.setAttribute("selectedCategoryId", categoryId);
            request.setAttribute("selectedStatus", status);
            request.setAttribute("categories", categoryService.getAllCategories());

            PageResponse.showMessage(response, "Manage Repair Requests",
                    "Loaded " + requests.size() + " request(s). Page " + page + " of " + totalPages + ".");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading requests: " + e.getMessage());
            PageResponse.showMessage(response, "Repair Request Error", "Error loading requests: " + e.getMessage());
        }
    }
}
