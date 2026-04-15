package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;


@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {

            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.setAttribute("errorMessage", "An error occurred");
            try {
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            }
        }
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

            if (name == null || email == null || phone == null ||
                    password == null || role == null) {
                throw new ValidationException("All fields are required.");
            }


            if (!password.equals(confirmPassword)) {
                throw new ValidationException("Passwords do not match.");
            }

            boolean success = userService.registerUser(name, email, phone, password, role);


            if (success) {
                // Set success message
                request.setAttribute("successMessage",
                        "Registration successful! Please log in.");

                // Forward to login page
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                throw new ValidationException("Registration failed. Please try again.");
            }

        } catch (ValidationException e) {

            request.setAttribute("errorMessage", e.getMessage());

            try {
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            }

        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");

            try {
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            }
        }
    }
}
