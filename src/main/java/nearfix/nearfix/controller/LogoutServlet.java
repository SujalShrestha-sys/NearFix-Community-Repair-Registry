package nearfix.nearfix.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * LogoutServlet - Handles user logout.
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        Cookie logoutMessage = new Cookie("nf_logout_message", "You have been logged out successfully.");
        logoutMessage.setHttpOnly(true);
        logoutMessage.setSecure(request.isSecure());
        logoutMessage.setMaxAge(30);
        logoutMessage.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
        response.addCookie(logoutMessage);

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
