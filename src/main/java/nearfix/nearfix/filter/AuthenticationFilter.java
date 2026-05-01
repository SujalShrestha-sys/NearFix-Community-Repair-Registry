package nearfix.nearfix.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * AuthenticationFilter - Checks if a user is logged in before
 * allowing access to protected pages.
 *
 * HOW IT WORKS:
 * 1. Intercepts requests to /user/*, /repairer/*, /admin/*, etc.
 * 2. Checks if there is a valid session with a userId.
 * 3. If not logged in → redirects to login.jsp.
 * 4. If logged in → allows the request to continue.
 */
@WebFilter(urlPatterns = {
        "/user/*",
        "/repairer/*",
        "/admin/*",
        "/repair-request",
        "/profile"
})
public class AuthenticationFilter implements Filter {

    private static final Logger logger = Logger.getLogger(AuthenticationFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) {
        logger.info("AuthenticationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);

        // Check: Is the user logged in?
        if (session == null || session.getAttribute("userId") == null) {
            logger.info("No active session — redirecting to login page");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }

        // User is logged in — allow request through
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}
