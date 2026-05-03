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

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private UserService userService = new UserService();
    private RepairService repairService = new RepairService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int totalUsers = userService.getTotalUsers();
            int totalRequests = repairService.getTotalRequests();
            int completedRepairs = repairService.getTotalCompletedRepairs();
            int totalCategories = categoryService.getTotalCategories();

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRequests", totalRequests);
            request.setAttribute("completedRepairs", completedRepairs);
            request.setAttribute("totalCategories", totalCategories);

            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading dashboard data: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        }
    }
}
