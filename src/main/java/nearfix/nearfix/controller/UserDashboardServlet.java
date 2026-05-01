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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * UserDashboardServlet - Loads data and displays the user's dashboard.
 * GET /user/dashboard → Fetch user info, repair requests, and stats → forward
 * to dashboard.jsp
 */
@WebServlet("/user/dashboard")
public class UserDashboardServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(UserDashboardServlet.class.getName());

    private final IUserService userService = new UserService();
    private final IRepairService repairService = new RepairService();

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
            int totalCompleted = repairService.getTotalCompletedRepairs();

            request.setAttribute("user", user);
            request.setAttribute("requests", requests);
            request.setAttribute("totalCompleted", totalCompleted);
            request.setAttribute("totalRequests", requests.size());

            request.getRequestDispatcher("/WEB-INF/views/user/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error loading dashboard", e);
            request.setAttribute("errorMessage", "Error loading dashboard: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/user/dashboard.jsp").forward(request, response);
        }
    }
}
