package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IUserService;

import java.sql.SQLException;
import java.util.Map;

@WebServlet("/admin/reports")
public class AdminReportsServlet extends HttpServlet {

    private final IRepairService repairService = new RepairService();
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // General Metrics
            int totalUsers = userService.getTotalUsers();
            int totalRequests = repairService.getTotalRequests();
            int completedRepairs = repairService.getTotalCompletedRepairs();
            double avgRepairTime = repairService.getAverageRepairTime();
            int newUsers = userService.getNewUsersCount(30); // Last 30 days
            
            // Distributions
            Map<String, Integer> statusCounts = repairService.getRequestsByStatusCount();
            Map<String, Integer> categoryCounts = repairService.getJobsByCategoryCount();
            Map<String, Integer> monthlyTrend = repairService.getMonthlyRequestsTrend();

            // Calculate Completion Rate
            double completionRate = totalRequests > 0 ? (completedRepairs * 100.0 / totalRequests) : 0;

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalRequests", totalRequests);
            request.setAttribute("completedRepairs", completedRepairs);
            request.setAttribute("avgRepairTime", String.format("%.1f", avgRepairTime));
            request.setAttribute("newUsers", newUsers);
            request.setAttribute("completionRate", Math.round(completionRate));
            request.setAttribute("statusCounts", statusCounts);
            request.setAttribute("categoryCounts", categoryCounts);
            request.setAttribute("monthlyTrend", monthlyTrend);
            
            request.setAttribute("activeTab", "reports");
            request.setAttribute("pageTitle", "Reports & Analytics");
            request.getRequestDispatcher("/WEB-INF/views/admin/reports.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching analytics data.");
        }
    }
}
