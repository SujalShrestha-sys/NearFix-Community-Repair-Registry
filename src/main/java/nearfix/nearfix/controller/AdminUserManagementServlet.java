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
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserManagementServlet extends HttpServlet {

    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int page = 1;
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }

            String search = request.getParameter("search");
            String role = request.getParameter("role");
            int pageSize = 10;

            List<User> users = userService.searchUsers(search, role, page, pageSize);
            int totalUsers = userService.getTotalUsersCount(search, role);
            int totalPages = (totalUsers + pageSize - 1) / pageSize;

            request.setAttribute("users", users);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("search", search);
            request.setAttribute("selectedRole", role);

            PageResponse.showMessage(response, "Manage Users",
                    "Loaded " + users.size() + " user(s). Page " + page + " of " + totalPages + ".");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading users: " + e.getMessage());
            PageResponse.showMessage(response, "User Management Error", "Error loading users: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String message = "";
        String error = "";

        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            if ("deactivate".equals(action)) {
                userService.deactivateUser(userId);
                message = "User deactivated";
            } else if ("activate".equals(action)) {
                userService.activateUser(userId);
                message = "User activated";
            } else if ("verify".equals(action)) {
                userService.verifyRepairer(userId);
                message = "Repairer verified successfully";
            }
        } catch (Exception e) {
            error = e.getMessage();
        }

        if (!message.isEmpty()) {
            session.setAttribute("successMessage", message);
        }
        if (!error.isEmpty()) {
            session.setAttribute("errorMessage", error);
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
