package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

/**
 * HomeServlet - Handles the landing page (/).
 * Fetches dynamic statistics for the impact counter.
 */
@WebServlet(urlPatterns = { "/home", "" })
public class HomeServlet extends HttpServlet {

    private final IRepairService repairService = new RepairService();
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch real statistics
            int itemsSaved = repairService.getTotalCompletedRepairs();
            int totalFixers = userService.getTotalUsersCount("", "REPAIRER");

            // Set as attributes for the JSP
            request.setAttribute("itemsSaved", itemsSaved);
            request.setAttribute("totalFixers", totalFixers);

            // Forward to the secure index view
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        } catch (Exception e) {
            // Fallback to static view if DB fails
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
        }
    }
}
