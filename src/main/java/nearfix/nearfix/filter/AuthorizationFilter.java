package nearfix.nearfix.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * AuthorizationFilter - Checks if a logged-in user has the correct ROLE
 * to access certain URL paths (e.g., /admin/*, /repairer/*, /user/*).
 *
 * HOW IT WORKS:
 * 1. Gets the user's role from the session.
 * 2. Checks if the URL they are trying to access matches their role.
 * 3. If the role doesn't match, redirects to an access-denied page.
 * 4. If the role matches, allows the request to continue.
 */
@WebFilter(urlPatterns = { "/admin/*", "/repairer/*", "/user/*" })
public class AuthorizationFilter implements Filter {

    private static final Logger logger = Logger.getLogger(AuthorizationFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) {
        logger.info("AuthorizationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();

        // If no session, let AuthenticationFilter handle it (it runs first)
        if (session == null) {
            chain.doFilter(request, response);
            return;
        }

        String userRole = (String) session.getAttribute("userRole");

        // Check: Does the user's role match the URL they are accessing?
        if (requestURI.contains("/admin/") && !"ADMIN".equals(userRole)) {
            logger.warning("Access denied: User role '" + userRole + "' tried to access admin area");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return; // IMPORTANT: Stop processing after redirect
        }

        if (requestURI.contains("/repairer/") && !"REPAIRER".equals(userRole)) {
            logger.warning("Access denied: User role '" + userRole + "' tried to access repairer area");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return; // IMPORTANT: Stop processing after redirect
        }

        if (requestURI.contains("/user/") && !"USER".equals(userRole)) {
            logger.warning("Access denied: User role '" + userRole + "' tried to access user area");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return; // IMPORTANT: Stop processing after redirect
        }

        // Role matches — allow the request through
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Nothing to clean up
    }
}
