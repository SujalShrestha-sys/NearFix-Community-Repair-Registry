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
import java.util.List;

@WebServlet("/admin/repairers")
public class AdminRepairerApprovalServlet extends HttpServlet {
    private final IRepairerService repairerService = new RepairerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            List<Repairer> pendingRepairers = repairerService.getPendingRepairers();
            request.setAttribute("pendingRepairers", pendingRepairers);
            request.setAttribute("pendingCount", pendingRepairers.size());
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"ADMIN".equals(session.getAttribute("userRole"))) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String action = request.getParameter("action");
        String repairerIdStr = request.getParameter("repairerId");

        if (action == null || repairerIdStr == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            int repairerId = Integer.parseInt(repairerIdStr);
            boolean success = false;

            if ("approve".equals(action)) {
                success = repairerService.approveRepairer(repairerId);
            } else if ("reject".equals(action)) {
                success = repairerService.rejectRepairer(repairerId);
            }

            if (success) {
                response.getWriter().write("success");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("error: " + e.getMessage());
        }
    }
}
