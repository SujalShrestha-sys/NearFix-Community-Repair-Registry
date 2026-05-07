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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PageResponse.showMessage(response, "Register", "The registration UI will be built next.");
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
                PageResponse.showMessage(response, "Registration Successful", "Please log in.");
            }

        } catch (ValidationException e) {
            request.setAttribute("errorMessage", e.getMessage());
            PageResponse.showMessage(response, "Registration Error", e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            PageResponse.showMessage(response, "Registration Error", "An unexpected error occurred: " + e.getMessage());
        }
    }
}
