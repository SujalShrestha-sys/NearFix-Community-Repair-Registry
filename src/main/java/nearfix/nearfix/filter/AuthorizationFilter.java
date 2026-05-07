package nearfix.nearfix.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = { "/admin/*", "/repairer/*", "/user/*" })
public class AuthorizationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();

        if (session == null) {
            chain.doFilter(request, response);
            return;
        }

        String userRole = (String) session.getAttribute("userRole");
        boolean adminPage = requestURI.contains("/admin/");
        boolean repairerPage = requestURI.contains("/repairer/");
        boolean userPage = requestURI.contains("/user/");

        // Role-based Access Control
        if (adminPage && !"ADMIN".equals(userRole)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return;
        }

        if (repairerPage && !"REPAIRER".equals(userRole)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return;
        }

        if (userPage && !"USER".equals(userRole)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/error?message=Access Denied");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
