package nearfix.nearfix.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthorizationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        System.out.println("✓ AuthorizationFilter started");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest  = (HttpServletRequest) request;
        HttpServletResponse httpResponse  = (HttpServletResponse) response;

        String requestURI = httpRequest.getRequestURI();
        HttpSession session = httpRequest.getSession(false);

        if(session != null) {
            String userRole = (String) session.getAttribute("userRole");

            if(requestURI.contains("/admin/")) {
                if(!"ADMIN".equals(userRole)) {
                    System.out.println("Not Admin - Access Denied");
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied.jsp");
                }
            } else if (requestURI.contains("/repairer/")) {
                if (!"REPAIRER".equals(userRole)) {
                    System.out.println("Not REPAIRER - Access Denied");
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied.jsp");
                }
            } else if (requestURI.contains("/user/")) {
                if (!"USER".equals(userRole)) {
                    System.out.println("Not USER - Access Denied");
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied.jsp");
                }
            }
        }

        System.out.println("Role check Passed - Access Granted");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
