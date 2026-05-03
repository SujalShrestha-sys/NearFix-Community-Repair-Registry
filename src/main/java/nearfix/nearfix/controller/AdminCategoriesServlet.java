package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Category;
import nearfix.nearfix.service.impl.CategoryService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/categories")
public class AdminCategoriesServlet extends HttpServlet {

    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            List<Category> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/WEB-INF/views/admin/categories.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error fetching categories: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/admin/categories.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String message = "";
        String error = "";

        try {
            if ("create".equals(action)) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                categoryService.createCategory(name, description);
                message = "Category created successfully";
            } else if ("update".equals(action)) {
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                categoryService.updateCategory(categoryId, name, description);
                message = "Category updated successfully";
            } else if ("delete".equals(action)) {
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                categoryService.deleteCategory(categoryId);
                message = "Category deleted successfully";
            }
        } catch (ValidationException | SQLException | NumberFormatException e) {
            error = e.getMessage();
        }

        if (!message.isEmpty()) {
            session.setAttribute("successMessage", message);
        }
        if (!error.isEmpty()) {
            session.setAttribute("errorMessage", error);
        }

        response.sendRedirect(request.getContextPath() + "/admin/categories");
    }
}
