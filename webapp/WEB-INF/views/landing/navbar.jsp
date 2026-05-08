<%-- ============================================================
     Component: Navbar
     Description: Top navigation bar with links and CTA button.
                  Shows login/logout based on session.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="fixed top-0 left-0 right-0 z-50 bg-white border-b border-gray-100 shadow-sm">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">

            <%-- ---- Logo ---- --%>
            <a href="${pageContext.request.contextPath}/home"
               class="flex items-center gap-2 font-bold text-xl text-gray-900 no-underline">
                <%-- Wrench-in-circle SVG logo - represents fixing/repair --%>
                <span class="inline-flex items-center justify-center w-8 h-8 rounded-lg bg-green-600">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-white" viewBox="0 0 24 24"
                         fill="none" stroke="currentColor" stroke-width="2.2"
                         stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77
                                 a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91
                                 a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
                    </svg>
                </span>
                NearFix
            </a>

            <%-- ---- Desktop Navigation Links ---- --%>
            <div class="hidden md:flex items-center gap-8">
                <a href="#how-it-works"
                   class="nf-nav-link text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors duration-200">
                    How it works
                </a>
                <a href="#portals"
                   class="nf-nav-link text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors duration-200">
                    For Repairers
                </a>
                <a href="#stats"
                   class="nf-nav-link text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors duration-200">
                    Impact
                </a>
            </div>

            <%-- ---- Auth Buttons (conditional on session) ---- --%>
            <div class="hidden md:flex items-center gap-3">
                <%
                    /* Check if user is already logged in */
                    String userRole = (String) session.getAttribute("userRole");
                    String userName = (String) session.getAttribute("userName");
                    boolean isLoggedIn = (userRole != null);
                %>
                <% if (isLoggedIn) { %>
                    <%-- Show dashboard link when logged in --%>
                    <a href="${pageContext.request.contextPath}/<%= userRole.toLowerCase() %>/dashboard"
                       class="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors duration-200">
                        Dashboard
                    </a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="nf-btn-dark text-sm font-semibold text-white px-4 py-2 rounded-lg transition-colors duration-200">
                        Sign out
                    </a>
                <% } else { %>
                    <%-- Show sign in + get started when not logged in --%>
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors duration-200">
                        Sign in
                    </a>
                    <a href="${pageContext.request.contextPath}/register"
                       class="nf-btn-green text-sm font-semibold text-white px-4 py-2 rounded-lg transition-colors duration-200">
                        Get started
                    </a>
                <% } %>
            </div>

            <%-- ---- Mobile Hamburger Button ---- --%>
            <button id="mobile-menu-btn" type="button"
                    class="md:hidden inline-flex items-center justify-center p-2 rounded-lg
                           text-gray-600 hover:text-gray-900 hover:bg-gray-100 transition-colors duration-200"
                    aria-label="Toggle mobile menu">
                <svg id="icon-hamburger" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
                <svg id="icon-close" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 hidden"
                     fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </button>

        </div>
    </div>

    <%-- ---- Mobile Menu (hidden by default) ---- --%>
    <div id="mobile-menu" class="hidden md:hidden border-t border-gray-100 bg-white">
        <div class="px-4 pt-3 pb-4 flex flex-col gap-3">
            <a href="#how-it-works"
               class="text-sm font-medium text-gray-700 hover:text-green-600 transition-colors py-1">
                How it works
            </a>
            <a href="#portals"
               class="text-sm font-medium text-gray-700 hover:text-green-600 transition-colors py-1">
                For Repairers
            </a>
            <a href="#stats"
               class="text-sm font-medium text-gray-700 hover:text-green-600 transition-colors py-1">
                Impact
            </a>
            <hr class="border-gray-100">
            <% if (isLoggedIn) { %>
                <a href="${pageContext.request.contextPath}/<%= userRole.toLowerCase() %>/dashboard"
                   class="text-sm font-medium text-gray-700 py-1">Dashboard</a>
                <a href="${pageContext.request.contextPath}/logout"
                   class="text-sm font-semibold bg-gray-900 text-white px-4 py-2 rounded-lg text-center">
                    Sign out
                </a>
            <% } else { %>
                <a href="${pageContext.request.contextPath}/login"
                   class="text-sm font-medium text-gray-700 py-1">Sign in</a>
                <a href="${pageContext.request.contextPath}/register"
                   class="text-sm font-semibold bg-green-600 text-white px-4 py-2 rounded-lg text-center
                          hover:bg-green-700 transition-colors duration-200">
                    Get started
                </a>
            <% } %>
        </div>
    </div>
</nav>

<%-- Toggle mobile menu open/close --%>
<script>
    (function () {
        var btn  = document.getElementById('mobile-menu-btn');
        var menu = document.getElementById('mobile-menu');
        var ham  = document.getElementById('icon-hamburger');
        var cls  = document.getElementById('icon-close');

        btn.addEventListener('click', function () {
            var isOpen = !menu.classList.contains('hidden');
            menu.classList.toggle('hidden', isOpen);
            ham.classList.toggle('hidden', !isOpen);
            cls.classList.toggle('hidden', isOpen);
        });
    })();
</script>
