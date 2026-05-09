package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nearfix.nearfix.dao.idao.ICategoryDAO;
import nearfix.nearfix.dao.impl.CategoryDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

@WebServlet({ "/register", "/signup" })
public class RegisterServlet extends HttpServlet {

    private IUserService userService = new UserService();
    private ICategoryDAO categoryDAO = new CategoryDAO();

    private static final String SIGNUP_VIEW = "/WEB-INF/views/auth/register.jsp";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            request.setAttribute("categories", categoryDAO.getAllCategories());
        } catch (Exception e) {
            // Log error but proceed to show the form
        }
        request.getRequestDispatcher(SIGNUP_VIEW).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            boolean success = false;

            if ("REPAIRER".equalsIgnoreCase(role)) {
                String fullName = request.getParameter("fullName");
                String phone = request.getParameter("repairerPhone");
                String category = request.getParameter("category");
                int experience = 0;
                try {
                    experience = Integer.parseInt(request.getParameter("experience"));
                } catch (Exception e) {
                }
                String bio = request.getParameter("bio");

                success = userService.registerRepairer(fullName, email, phone, password, category, experience, bio);
            } else {
                // Regular User
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String name = (firstName + " " + lastName).trim();
                String phone = request.getParameter("userPhone");

                success = userService.registerUser(name, email, phone, password, "USER");
            }

            if (success) {
                request.setAttribute("successMessage", "Registration successful! Please login.");
                response.sendRedirect(request.getContextPath() + "/login?registered=true");
            } else {
                throw new ValidationException("Registration failed. Please check your details.");
            }

        } catch (ValidationException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher(SIGNUP_VIEW).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher(SIGNUP_VIEW).forward(request, response);
        }
    }
}
