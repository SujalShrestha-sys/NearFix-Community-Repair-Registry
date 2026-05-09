package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/repairer-profile")
public class RepairerProfileServlet extends HttpServlet {

    private IRepairerService repairerService = new RepairerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idStr = request.getParameter("id");
        
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/repairers");
            return;
        }

        try {
            int repairerId = Integer.parseInt(idStr);
            Repairer repairer = repairerService.getRepairerProfile(repairerId);

            if (repairer == null) {
                request.setAttribute("errorMessage", "Repairer not found.");
                request.getRequestDispatcher("/WEB-INF/views/user/find-repairers.jsp").forward(request, response);
                return;
            }

            request.setAttribute("repairer", repairer);
            request.getRequestDispatcher("/WEB-INF/views/user/repairer-profile.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            response.sendRedirect(request.getContextPath() + "/repairers");
        }
    }
}
