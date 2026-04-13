package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nearfix.nearfix.service.UserService;
import nearfix.nearfix.util.exception.DatabaseException;
import nearfix.nearfix.util.exception.ValidationException;

import java.io.IOException;


@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String role = request.getParameter("role");

            if (password == null || !password.equals(confirmPassword)) {
                throw new ValidationException("Passwords do not match");
            }

            boolean isRegistered = userService.registerUser(name, email, phone, password, role);

            if (isRegistered) {
                request.setAttribute("successMessage", "Registration successful! Please login.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } else {
                throw new DatabaseException("Failed to create user account");
            }

        } catch (ValidationException | DatabaseException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
