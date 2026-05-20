package nearfix.nearfix.controller;

// added comment
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
 * HomeServlet - Handles the landing page (/ and /home).
 *
 * <p>
 * Fetches dynamic statistics from the service layer and passes
 * them as request attributes to the landing page JSP.
 * </p>
 *
 * <p>
 * Attributes set for the view:
 * <ul>
 * <li>{@code itemsSaved} - total number of completed repairs</li>
 * <li>{@code totalFixers} - total number of registered repairers</li>
 * </ul>
 * </p>
 *
 * <p>
 * Route: GET / or GET /home
 * </p>
 * <p>
 * View: /WEB-INF/views/landing/index.jsp
 * </p>
 */
@WebServlet(urlPatterns = { "/home", "" })
public class HomeServlet extends HttpServlet {

    // Path to the landing page JSP (assembled from component includes)
    private static final String LANDING_PAGE = "/WEB-INF/views/landing/index.jsp";

    private final IRepairService repairService = new RepairService();
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Fetch live statistics from the database
            int itemsSaved = repairService.getPlatformTotalSaved();
            int totalFixers = userService.getTotalUsersCount("", "REPAIRER");

            // Pass stats to the JSP view via request attributes
            request.setAttribute("itemsSaved", String.format("%,d", itemsSaved));
            request.setAttribute("totalFixers", totalFixers);

        } catch (Exception e) {
            // If the DB is unavailable, show fallback dynamic seed so the page still loads cleanly
            request.setAttribute("itemsSaved", String.format("%,d", IRepairService.LANDFILL_BASE_SEED));
            request.setAttribute("totalFixers", 0);
        }

        // Forward to the landing page view
        request.getRequestDispatcher(LANDING_PAGE).forward(request, response);
    }
}
