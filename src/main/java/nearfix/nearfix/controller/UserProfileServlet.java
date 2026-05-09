package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.impl.UserService;
import nearfix.nearfix.service.iservice.IRepairerService;
import nearfix.nearfix.service.iservice.IUserService;

import java.io.IOException;

@WebServlet({ "/user/profile", "/repairer/profile", "/profile" })
public class UserProfileServlet extends HttpServlet {

    private IUserService userService = new UserService();
    private IRepairerService repairerService = new RepairerService();

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

            // If the user is a repairer, also fetch their repairer profile for the sidebar
            if ("REPAIRER".equals(user.getRole())) {
                try {
                    nearfix.nearfix.model.Repairer repairer = repairerService.getRepairerProfile(userId);
                    request.setAttribute("repairer", repairer);
                } catch (Exception e) {
                    System.err.println("Error loading repairer profile: " + e.getMessage());
                }
            }

            // Get stats and set attributes simply
            request.setAttribute("user", user);
            request.setAttribute("stats", userService.getUserStats(userId));

            request.getRequestDispatcher("/WEB-INF/views/user/profile.jsp").forward(request, response);

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
        String action = request.getParameter("action");

        try {
            if ("update_profile".equals(action)) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");

                userService.updateProfile(userId, name, email, phone, address);
                session.setAttribute("successMessage", "Profile updated successfully!");

                // Update session attributes if name changed
                session.setAttribute("userName", name);

            } else if ("change_password".equals(action)) {
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                if (!newPassword.equals(confirmPassword)) {
                    throw new Exception("New passwords do not match.");
                }

                userService.changePassword(userId, oldPassword, newPassword);
                session.setAttribute("successMessage", "Password changed successfully!");
            }

            response.sendRedirect(request.getContextPath() + "/user/profile");

        } catch (Exception e) {
            session.setAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/user/profile");
        }
    }
}
