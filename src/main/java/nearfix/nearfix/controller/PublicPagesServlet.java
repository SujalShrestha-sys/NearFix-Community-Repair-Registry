package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * PublicPagesServlet - Handles public informational pages.
 */
@WebServlet(urlPatterns = { "/about", "/contact" })
public class PublicPagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/about".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/public/about.jsp").forward(request, response);
        } else if ("/contact".equals(path)) {
            request.getRequestDispatcher("/WEB-INF/views/public/contact.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
