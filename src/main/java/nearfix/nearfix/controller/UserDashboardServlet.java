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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("userId") == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            int userId = (Integer) session.getAttribute("userId");
            User user = userService.getUserById(userId);

            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            // Get user's repair requests
            List<RepairRequest> requests = repairService.getUserRequests(userId);

            // Get total completed repairs
            int totalCompleted = repairService.getTotalCompletedRepairs();

            // Set data for JSP
            request.setAttribute("user", user);
            request.setAttribute("requests", requests);
            request.setAttribute("totalCompleted", totalCompleted);
            request.setAttribute("totalRequests", requests.size());

            // Forward to JSP
            request.getRequestDispatcher("/user/dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading dashboard: " + e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                // Catastrophic
            }
        }
    }
}
