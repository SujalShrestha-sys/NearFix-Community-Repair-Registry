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
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IRepairerService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private final IUserService userService = new UserService();
    private final IRepairService repairService = new RepairService();
    private final ICategoryService categoryService = new CategoryService();
    private final IRepairerService repairerService = new RepairerService();

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
            int pendingRepairers = repairerService.getPendingRepairersCount();

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRequests", totalRequests);
            request.setAttribute("completedRepairs", completedRepairs);
            request.setAttribute("totalCategories", totalCategories);
            request.setAttribute("pendingRepairers", pendingRepairers);
            request.setAttribute("jobsByCategory", repairService.getJobsByCategoryCount());
            request.setAttribute("topRepairers", repairerService.getTopRepairers(5));

            request.setAttribute("activeTab", "dashboard");
            request.setAttribute("pageTitle", "Overview");
            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading dashboard data: " + e.getMessage());
            request.setAttribute("activeTab", "dashboard");
            request.setAttribute("pageTitle", "Overview");
            request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(request, response);
        }
    }
}
