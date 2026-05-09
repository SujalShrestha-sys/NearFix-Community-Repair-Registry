package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.Category;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.impl.CategoryService;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.ICategoryService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/repairers")
public class FindRepairerServlet extends HttpServlet {

    private IRepairerService repairerService = new RepairerService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String keyword = request.getParameter("keyword");
        String categoryIdStr = request.getParameter("categoryId");
        String area = request.getParameter("area");

        Integer categoryId = null;
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                // Ignore invalid category ID
            }
        }

        try {
            // Fetch filtered repairers
            List<Repairer> repairers = repairerService.searchRepairers(keyword, categoryId, area);
            request.setAttribute("repairers", repairers);

            // Fetch categories for the filter dropdown
            List<Category> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);

            // Keep track of current filters in the UI
            request.setAttribute("currentKeyword", keyword);
            request.setAttribute("currentCategoryId", categoryId);
            request.setAttribute("currentArea", area);

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/views/user/find-repairers.jsp").forward(request, response);
    }
}
