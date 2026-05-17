<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- SIDEBAR -->
<!-- Sidebar Overlay -->
<div id="sidebar-overlay" class="fixed inset-0 bg-dark/40 backdrop-blur-[2px] z-[15] hidden transition-opacity duration-300"></div>

<aside id="app-sidebar" class="w-[260px] min-w-[260px] bg-white flex flex-col p-0 border-r border-border fixed top-0 left-0 bottom-0 z-20 transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out overflow-y-auto">
    <div class="flex items-center gap-[10px] pt-[26px] pr-6 pb-[22px] pl-6">
        <div class="w-9 h-9 bg-primary rounded-[12px] flex items-center justify-center shadow-lg shadow-primary/20">
            <!-- wrench icon -->
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
            </svg>
        </div>
        <span class="text-lg font-bold text-dark tracking-[-0.3px]">NearFix</span>
    </div>

    <c:set var="activePath" value="${requestScope['jakarta.servlet.forward.servlet_path']}" />

    <div class="text-[10.5px] font-bold text-muted tracking-[0.08em] uppercase pt-3.5 pr-6 pb-1.5 pl-6">Main Menu</div>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold ${activePath == '/user/dashboard' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-all" href="${pageContext.request.contextPath}/user/dashboard">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="3" width="7" height="7" rx="1" />
            <rect x="14" y="3" width="7" height="7" rx="1" />
            <rect x="3" y="14" width="7" height="7" rx="1" />
            <rect x="14" y="14" width="7" height="7" rx="1" />
        </svg>
        Dashboard
        <c:if test="${activePath == '/user/dashboard'}">
            <span class="absolute left-[-10px] top-1/4 bottom-1/4 w-[4px] bg-primary rounded-r-full shadow-[2px_0_10px_rgba(11,122,83,0.3)]"></span>
        </c:if>
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold ${activePath == '/user/my-requests' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-all" href="${pageContext.request.contextPath}/user/my-requests">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
        </svg>
        My Requests
        <c:if test="${not empty requests && requests.size() > 0}">
            <span class="ml-auto bg-primary text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full min-w-[18px] text-center">${requests.size()}</span>
        </c:if>
        <c:if test="${activePath == '/user/my-requests'}">
            <span class="absolute left-[-10px] top-1/4 bottom-1/4 w-[4px] bg-primary rounded-r-full shadow-[2px_0_10px_rgba(11,122,83,0.3)]"></span>
        </c:if>
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold ${activePath == '/user/post-request' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-all" href="${pageContext.request.contextPath}/user/post-request">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="12" y1="8" x2="12" y2="16"></line>
            <line x1="8" y1="12" x2="16" y2="12"></line>
        </svg>
        Post Request
        <c:if test="${activePath == '/user/post-request'}">
            <span class="absolute left-[-10px] top-1/4 bottom-1/4 w-[4px] bg-primary rounded-r-full shadow-[2px_0_10px_rgba(11,122,83,0.3)]"></span>
        </c:if>
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold ${activePath == '/repairers' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-all" href="${pageContext.request.contextPath}/repairers">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
            <circle cx="9" cy="7" r="4"></circle>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
        </svg>
        Find Repairers
        <c:if test="${activePath == '/repairers'}">
            <span class="absolute left-[-10px] top-1/4 bottom-1/4 w-[4px] bg-primary rounded-r-full shadow-[2px_0_10px_rgba(11,122,83,0.3)]"></span>
        </c:if>
    </a>

    <div class="text-[10.5px] font-bold text-muted tracking-[0.08em] uppercase pt-3.5 pr-6 pb-1.5 pl-6 mt-1.5">Account Settings</div>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold ${activePath.contains('/profile') ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-all" href="${pageContext.request.contextPath}/user/profile">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
            <circle cx="12" cy="7" r="4" />
        </svg>
        My Profile
        <c:if test="${activePath.contains('/profile')}">
            <span class="absolute left-[-10px] top-1/4 bottom-1/4 w-[4px] bg-primary rounded-r-full shadow-[2px_0_10px_rgba(11,122,83,0.3)]"></span>
        </c:if>
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-bold text-nav no-underline relative transition-all hover:bg-primary-hover" href="${pageContext.request.contextPath}/logout">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
            <polyline points="16 17 21 12 16 7" />
            <line x1="21" y1="12" x2="9" y2="12" />
        </svg>
        Sign out
    </a>

    <div class="flex-1"></div>

    <!-- User Info Section -->
    <c:set var="displayName" value="${not empty user ? user.name : sessionScope.userName}" />
    
    <div class="flex items-center gap-[11px] pt-4 pr-[18px] pb-5 pl-[18px] border-t border-border mt-2.5">
        <div class="w-[38px] h-[38px] bg-primary-light rounded-[9px] flex items-center justify-center text-sm font-bold text-primary shrink-0 uppercase">
            <c:out value="${not empty displayName ? displayName.substring(0, 1) : 'U'}" />
        </div>
        <div class="flex flex-col gap-[2px]">
            <span class="text-[13.5px] font-bold text-[#1A2E28]"><c:out value="${not empty displayName ? displayName : 'User'}" /></span>
            <span class="text-xs text-muted-dark">User account</span>
        </div>
    </div>
</aside>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const sidebar = document.getElementById('app-sidebar');
        const overlay = document.getElementById('sidebar-overlay');
        const mobileMenuBtn = document.getElementById('mobile-menu-btn');

        if (sidebar && mobileMenuBtn && overlay) {
            const toggleSidebar = () => {
                const isOpen = sidebar.classList.contains('sidebar-open');
                if (isOpen) {
                    sidebar.classList.remove('sidebar-open');
                    overlay.classList.add('hidden');
                } else {
                    sidebar.classList.add('sidebar-open');
                    overlay.classList.remove('hidden');
                }
            };

            mobileMenuBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                toggleSidebar();
            });

            overlay.addEventListener('click', () => {
                sidebar.classList.remove('sidebar-open');
                overlay.classList.add('hidden');
            });

            // Close on window resize if switching to desktop
            window.addEventListener('resize', () => {
                if (window.innerWidth >= 1024) {
                    sidebar.classList.remove('sidebar-open');
                    overlay.classList.add('hidden');
                }
            });
        }
    });
</script>


