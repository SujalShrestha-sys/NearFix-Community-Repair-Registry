package nearfix.nearfix.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * ExceptionFilter - A global safety net that catches any unhandled exceptions
 * from servlets and forwards the user to a friendly error page.
 *
 * HOW IT WORKS:
 * 1. Wraps ALL requests in a try-catch.
 * 2. If any servlet throws an unhandled exception, this filter catches it.
 * 3. Logs the error and forwards to error.jsp.
 */
@WebFilter(urlPatterns = "/*")
public class ExceptionFilter implements Filter {

    private static final Logger logger = Logger.getLogger(ExceptionFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) {
        logger.info("ExceptionFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            chain.doFilter(request, response);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Unhandled exception caught by ExceptionFilter", e);

            request.setAttribute("error", e.getMessage());
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (Exception ex) {
                logger.log(Level.SEVERE, "Failed to forward to error page", ex);
            }
        }
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}
