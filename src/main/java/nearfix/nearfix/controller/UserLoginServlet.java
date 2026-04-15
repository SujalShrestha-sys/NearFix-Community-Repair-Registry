package nearfix.nearfix.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.UserService;
import nearfix.nearfix.util.exception.ValidationException;

import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private final UserService userService = new UserService();

    /**
     * GET: Display login form
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * POST: Handle login form submission
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            // STEP 1: Extract parameters
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // STEP 2: Validate inputs
            if (email == null || password == null) {
                throw new ValidationException("Email and password are required.");
            }

            // STEP 3: Call service to authenticate
            User user = userService.login(email, password);

            // STEP 4: Create session
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // STEP 5: Redirect based on role
            String redirectURL = switch (user.getRole()) {
                case "ADMIN" -> request.getContextPath() + "/admin/dashboard.jsp";
                case "REPAIRER" -> request.getContextPath() + "/repairer/dashboard.jsp";
                default -> request.getContextPath() + "/user/dashboard.jsp";
            };

            response.sendRedirect(redirectURL);

        } catch (ValidationException e) {
            // STEP 6: Handle validation errors
            request.setAttribute("errorMessage", e.getMessage());
            try {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } catch (Exception ex) {
                System.out.println("Error: " + e.getMessage());
//                ex.printStackTrace();
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
//            e.printStackTrace();
        }
    }
}
