package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.UserService;

import java.io.IOException;

/**
 * AdminServlet - Handles the admin portal.
 */
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final UserService userService = new UserService();
    private final RepairService repairService = new RepairService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Get statistics
            int totalUsers = userService.getAllUsers(1, 10).size();
            int totalRequests = repairService.getTotalRequests();
            int completedRepairs = repairService.getTotalCompletedRepairs();
            int totalCategories = categoryService.getTotalCategories();

            // Set attributes
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRequests", totalRequests);
            request.setAttribute("completedRepairs", completedRepairs);
            request.setAttribute("totalCategories", totalCategories);

            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading dashboard data: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        }
    }
}
