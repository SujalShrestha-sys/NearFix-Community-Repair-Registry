package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.impl.RepairerService;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/repairer-directory")
public class RepairerDirectoryServlet extends HttpServlet {

    private IRepairerService repairerService = new RepairerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"USER".equals(session.getAttribute("userRole"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String search = request.getParameter("search");
            if (search == null)
                search = "";

            List<Repairer> repairers = repairerService.searchRepairers(search);
            request.setAttribute("repairers", repairers);
            request.setAttribute("search", search);

            request.getRequestDispatcher("/WEB-INF/views/user/repairer-directory.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/user/dashboard");
        }
    }
}
