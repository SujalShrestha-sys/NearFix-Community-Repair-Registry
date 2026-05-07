package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

@WebServlet("/user/profile")
public class UserProfileServlet extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int userId = (Integer) session.getAttribute("userId");
            User user = userService.getUserById(userId);
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            request.setAttribute("user", user);
            PageResponse.showMessage(response, "User Profile", "Profile for " + user.getName() + ".");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading profile: " + e.getMessage());
            PageResponse.showMessage(response, "Profile Error", "Error loading profile: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        try {
            User user = userService.getUserById(userId);
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            userService.updateProfile(userId, name, user.getEmail(), phone);
            session.setAttribute("successMessage", "Profile updated successfully!");
            response.sendRedirect(request.getContextPath() + "/user/profile");

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
            doGet(request, response);
        }
    }
}
