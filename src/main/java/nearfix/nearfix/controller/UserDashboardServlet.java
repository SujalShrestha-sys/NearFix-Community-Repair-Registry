package nearfix.nearfix.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.dao.impl.CategoryDAO;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.impl.RepairService;

import java.util.List;

@WebServlet("/user/dashboard")
public class UserDashboardServlet {

    private RepairService repairService = new RepairService();
    private CategoryDAO categoryDAO = new CategoryDAO();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        // Get user's repair requests
        List<RepairRequest> requests = repairService.getUserRequests(userId);

        // Get total completed repairs (for impact counter)
        int completedRepairs = repairService.getTotalCompletedRepairs();

        // Set attributes
        request.setAttribute("requests", requests);
        request.setAttribute("completedRepairs", completedRepairs);
        request.setAttribute("categories", categoryDAO.getAllCategories());

        // Forward to JSP
        request.getRequestDispatcher("/user/dashboard.jsp").forward(request, response);
    }

}
