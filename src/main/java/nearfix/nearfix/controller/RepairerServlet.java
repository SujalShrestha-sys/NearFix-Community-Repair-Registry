package nearfix.nearfix.controller;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.dao.impl.RepairRequestDAO;
import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.model.RepairRequest;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/repairer/*")
public class RepairerServlet extends HttpServlet {

    private RepairerDAO repairerDAO = new RepairerDAO();
    private RepairRequestDAO repairRequestDAO = new RepairRequestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        String pathInfo = request.getPathInfo();

        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                response.sendRedirect(request.getContextPath() + "/repairer/dashboard.jsp");
                return;
            }

            switch (pathInfo) {
                case "/dashboard":
                    handleDashboard(request, response, session);
                    break;
                case "/profile":
                    handleViewProfile(request, response, session);
                    break;
                case "/available-requests":
                    handleAvailableRequests(request, response);
                    break;
                case "/my-requests":
                    handleMyRequests(request, response, session);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/repairer/dashboard.jsp");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);

        if (!isRepairerLoggedIn(session)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "update-profile":
                    updateProfile(request, response, session);
                    break;
                case "accept-request":
                    acceptRequest(request, response, session);
                    break;
                case "complete-request":
                    completeRequest(request, response, session);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/repairer/dashboard.jsp");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

    private void handleDashboard(HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session) throws Exception {
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int repairerId = (Integer) session.getAttribute("userId");
        Repairer repairer = repairerDAO.getRepairerById(repairerId);

        if (repairer == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        request.setAttribute("repairer", repairer);
        request.getRequestDispatcher("/repairer/dashboard.jsp").forward(request, response);
    }

    private void handleViewProfile(HttpServletRequest request, HttpServletResponse response,
                                   HttpSession session) throws Exception {
        int repairerId = (Integer) session.getAttribute("userId");
        Repairer repairer = repairerDAO.getRepairerById(repairerId);

        request.setAttribute("repairer", repairer);
        request.getRequestDispatcher("/repairer/profile.jsp").forward(request, response);
    }

    private void handleAvailableRequests(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RepairRequestDAO repairRequestDAO = new RepairRequestDAO();
        java.util.List<RepairRequest> pendingRequests = repairRequestDAO.getPendingRequests(1, 100);
        
        request.setAttribute("requests", pendingRequests);
        request.getRequestDispatcher("/repairer/available-requests.jsp").forward(request, response);
    }

    private void handleMyRequests(HttpServletRequest request, HttpServletResponse response,
                                  HttpSession session) throws Exception {
        int repairerId = (Integer) session.getAttribute("userId");
        List<RepairRequest> assignedRequests = repairRequestDAO.getRequestsByRepairerId(repairerId);

        request.setAttribute("requests", assignedRequests);
        request.getRequestDispatcher("/repairer/my-requests.jsp").forward(request, response);
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response,
                               HttpSession session) throws Exception {
        int repairerId = (Integer) session.getAttribute("userId");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String specialization = request.getParameter("specialization");
        String expertise = request.getParameter("expertise");

        Repairer repairer = repairerDAO.getRepairerById(repairerId);
        if (repairer != null) {
            repairer.setName(name);
            repairer.setPhone(phone);
            repairer.setSpecialization(specialization);
            repairer.setExpertise(expertise);
            repairerDAO.updateRepairer(repairer);
        }
        response.sendRedirect(request.getContextPath() + "/repairer/profile");
    }

    private void acceptRequest(HttpServletRequest request, HttpServletResponse response,
                               HttpSession session) throws Exception {
        int repairerId = (Integer) session.getAttribute("userId");
        int requestId = Integer.parseInt(request.getParameter("requestId"));

        repairRequestDAO.acceptRequest(requestId, repairerId);
        response.sendRedirect(request.getContextPath() + "/repairer/my-requests");
    }

    private void completeRequest(HttpServletRequest request, HttpServletResponse response,
                                 HttpSession session) throws Exception {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        double cost = Double.parseDouble(request.getParameter("cost"));

        repairRequestDAO.updateStatus(requestId, "COMPLETED");
        RepairRequest requestObj = repairRequestDAO.getRequestById(requestId);
        if (requestObj != null && requestObj.getRepairerId() != null) {
            repairerDAO.updateJobsCompleted(requestObj.getRepairerId(), 1);
        }
        response.sendRedirect(request.getContextPath() + "/repairer/my-requests");
    }

    private boolean isRepairerLoggedIn(HttpSession session) {
        return session != null && session.getAttribute("userId") != null &&
                "REPAIRER".equals(session.getAttribute("userRole"));
    }
}
