package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * UserRegisterServlet - Handles user registration:
 * GET /register → Show the registration form
 * POST /register → Process the registration form
 *
 * After successful registration:
 * - USER role → Redirected to login page with success message
 * - REPAIRER role → Auto-logged in and redirected to repairer dashboard
 */
@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(UserRegisterServlet.class.getName());

    private final IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        try {
            if (name == null || email == null || phone == null || password == null || role == null) {
                throw new ValidationException("All fields are required.");
            }

            if (!password.equals(confirmPassword)) {
                throw new ValidationException("Passwords do not match.");
            }

            boolean success = userService.registerUser(name, email, phone, password, role);
            if (!success) {
                throw new ValidationException("Registration failed. Please try again.");
            }

            if ("REPAIRER".equalsIgnoreCase(role)) {
                User repairer = userService.login(email, password);
                HttpSession session = request.getSession(true);
                session.setAttribute("userId", repairer.getUserId());
                session.setAttribute("userName", repairer.getName());
                session.setAttribute("userEmail", repairer.getEmail());
                session.setAttribute("userRole", repairer.getRole());
                response.sendRedirect(request.getContextPath() + "/repairer/dashboard");
            } else {
                request.setAttribute("successMessage", "Registration successful! Please log in.");
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
            }

        } catch (ValidationException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Registration error", e);
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
        }
    }
}
