package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.iservice.IRepairService;
import java.io.IOException;

/**
 * PublicPagesServlet - Handles public informational pages.
 */
@WebServlet(urlPatterns = { "/about" })
public class PublicPagesServlet extends HttpServlet {

    private static final String ABOUT_VIEW = "/WEB-INF/views/about/about.jsp";
    private final IRepairService repairService = new RepairService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/about".equals(path)) {
            try {
                int itemsSaved = repairService.getPlatformTotalSaved();
                request.setAttribute("itemsSaved", String.format("%,d", itemsSaved));
            } catch (Exception e) {
                request.setAttribute("itemsSaved", String.format("%,d", IRepairService.LANDFILL_BASE_SEED));
            }
            request.getRequestDispatcher(ABOUT_VIEW).forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
