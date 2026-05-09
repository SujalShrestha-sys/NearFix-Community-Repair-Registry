package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/repairer-directory")
public class BrowseRepairersServlet extends HttpServlet {

    private IRepairerService repairerService = new RepairerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"USER".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String search = request.getParameter("search");
            String categoryIdParam = request.getParameter("category");
            String area = request.getParameter("area");

            Integer categoryId = null;
            if (categoryIdParam != null && !categoryIdParam.trim().isEmpty()) {
                try {
                    categoryId = Integer.parseInt(categoryIdParam);
                } catch (NumberFormatException e) {
                    // Handle invalid number format
                    categoryId = null;
                }
            }

            List<Repairer> repairers = repairerService.searchRepairers(search, categoryId, area);
            request.setAttribute("repairers", repairers);
            request.setAttribute("search", search);
            request.setAttribute("selectedCategory", categoryId != null ? categoryId : "");
            request.setAttribute("selectedArea", area != null ? area : "");

            PageResponse.showMessage(response, "Browse Repairers", "Found " + repairers.size() + " repairer(s).");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/user/dashboard");
        }
    }
}
