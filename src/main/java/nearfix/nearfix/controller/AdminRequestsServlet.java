package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.RepairService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/requests")
public class AdminRequestsServlet extends HttpServlet {

    private final RepairService repairService = new RepairService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            int page = 1;
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }

            int pageSize = 10;
            List<RepairRequest> requests = repairService.getAllRequests(page, pageSize);
            int totalRequests = repairService.getTotalRequests();
            int totalPages = (totalRequests + pageSize - 1) / pageSize;

            request.setAttribute("requests", requests);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalRequests", totalRequests);

            request.getRequestDispatcher("/WEB-INF/views/admin/requests.jsp").forward(request, response);
        } catch (SQLException | NumberFormatException e) {
            request.setAttribute("errorMessage", "Error loading requests: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/admin/requests.jsp").forward(request, response);
        }
    }
}
