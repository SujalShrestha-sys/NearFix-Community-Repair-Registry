package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("nf_last_email".equals(cookie.getName())) {
                    request.setAttribute("prefillEmail", cookie.getValue());
                } else if ("nf_logout_message".equals(cookie.getName())) {
                    request.setAttribute("successMessage", cookie.getValue());

                    Cookie clearMessage = new Cookie("nf_logout_message", "");
                    clearMessage.setMaxAge(0);
                    clearMessage.setHttpOnly(true);
                    clearMessage.setSecure(request.isSecure());
                    clearMessage.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                    response.addCookie(clearMessage);
                }
            }
        }

        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            if (email != null && !email.trim().isEmpty()) {
                Cookie rememberEmail = new Cookie("nf_last_email", email.trim());
                rememberEmail.setHttpOnly(true);
                rememberEmail.setSecure(request.isSecure());
                rememberEmail.setMaxAge(30 * 24 * 60 * 60); // 30 days
                rememberEmail.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
                response.addCookie(rememberEmail);
            }

            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                throw new ValidationException("Email and password are required.");
            }

            User user = userService.login(email, password);
            if (user == null) {
                throw new ValidationException("Authentication failed.");
            }

            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getName());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            String redirectURL = switch (user.getRole()) {
                case "ADMIN" -> "/admin/dashboard";
                case "REPAIRER" -> "/repairer/dashboard";
                default -> "/user/dashboard";
            };

            response.sendRedirect(request.getContextPath() + redirectURL);

        } catch (ValidationException e) {
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
}
