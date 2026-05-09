package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/dashboard")
public class UserDashboardServlet extends HttpServlet {

    private IUserService userService = new UserService();
    private IRepairService repairService = new RepairService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int userId = (Integer) session.getAttribute("userId");
            User user = userService.getUserById(userId);
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            List<RepairRequest> requests = repairService.getUserRequests(userId);
            
            long pendingCount = requests.stream().filter(r -> "PENDING".equals(r.getStatus())).count();
            long inProgressCount = requests.stream().filter(r -> "IN_PROGRESS".equals(r.getStatus())).count();
            long completedCount = requests.stream().filter(r -> "COMPLETED".equals(r.getStatus())).count();
            
            // Platform wide stat for the impact card
            int platformTotalSaved = repairService.getTotalCompletedRepairs() + 8000; // 8000 as base seed

            // Get last completed job that might need rating
            RepairRequest lastCompleted = requests.stream()
                .filter(r -> "COMPLETED".equals(r.getStatus()))
                .sorted((r1, r2) -> r2.getCreatedAt().compareTo(r1.getCreatedAt()))
                .findFirst().orElse(null);

            request.setAttribute("user", user);
            request.setAttribute("requests", requests);
            request.setAttribute("pendingCount", pendingCount);
            request.setAttribute("inProgressCount", inProgressCount);
            request.setAttribute("completedCount", completedCount);
            request.setAttribute("totalRequests", requests.size());
            request.setAttribute("platformTotalSaved", platformTotalSaved);
            request.setAttribute("lastCompleted", lastCompleted);

            request.getRequestDispatcher("/WEB-INF/views/user/dashboard/index.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading dashboard: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/user/dashboard/index.jsp").forward(request, response);
        }
    }
}
