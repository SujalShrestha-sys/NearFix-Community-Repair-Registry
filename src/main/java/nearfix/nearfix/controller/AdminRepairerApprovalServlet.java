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

@WebServlet("/admin/repairers")
public class AdminRepairerApprovalServlet extends HttpServlet {
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
            // Fetch unverified repairers - simplified to fetching all repairers for now
            List<User> repairers = userService.searchUsers("", "REPAIRER", 1, 50);
            request.setAttribute("repairers", repairers);
            request.setAttribute("activeTab", "repairers");
            request.setAttribute("pageTitle", "Approve Repairers");
            request.getRequestDispatcher("/WEB-INF/views/admin/repairers.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error loading repairers: " + e.getMessage());
            request.setAttribute("activeTab", "repairers");
            request.setAttribute("pageTitle", "Approve Repairers");
            request.getRequestDispatcher("/WEB-INF/views/admin/repairers.jsp").forward(request, response);
        }
    }
}
