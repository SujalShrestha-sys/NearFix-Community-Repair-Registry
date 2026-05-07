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
            PageResponse.showMessage(response, "About NearFix", "The about page UI will be built next.");
        } else if ("/contact".equals(path)) {
            PageResponse.showMessage(response, "Contact NearFix", "The contact page UI will be built next.");
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
