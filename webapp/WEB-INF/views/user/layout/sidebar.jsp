<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- SIDEBAR -->
<aside class="w-[260px] min-w-[260px] bg-white flex flex-col p-0 border-r border-border fixed top-0 left-0 bottom-0 z-20 transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
    <div class="flex items-center gap-[10px] pt-[26px] pr-6 pb-[22px] pl-6">
        <div class="w-9 h-9 bg-primary rounded-[12px] flex items-center justify-center shadow-lg shadow-primary/20">
            <!-- wrench icon -->
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
            </svg>
        </div>
        <span class="text-lg font-bold text-dark tracking-[-0.3px]">NearFix</span>
    </div>

    <div class="text-[10.5px] font-semibold text-muted tracking-[0.08em] uppercase pt-3.5 pr-6 pb-1.5 pl-6">Main</div>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-semibold ${requestScope['jakarta.servlet.forward.servlet_path'] == '/user/dashboard' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-colors" href="${pageContext.request.contextPath}/user/dashboard">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="3" width="7" height="7" rx="1" />
            <rect x="14" y="3" width="7" height="7" rx="1" />
            <rect x="3" y="14" width="7" height="7" rx="1" />
            <rect x="14" y="14" width="7" height="7" rx="1" />
        </svg>
        Dashboard
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-medium ${requestScope['jakarta.servlet.forward.servlet_path'] == '/user/my-requests' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-colors" href="${pageContext.request.contextPath}/user/my-requests">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
        </svg>
        My Requests
        <c:if test="${not empty requests && requests.size() > 0}">
            <span class="ml-auto bg-primary text-white text-[10px] font-bold px-1.5 py-0.5 rounded-full min-w-[18px] text-center">${requests.size()}</span>
        </c:if>
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-medium ${requestScope['jakarta.servlet.forward.servlet_path'] == '/user/post-request' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-colors" href="${pageContext.request.contextPath}/user/post-request">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="12" y1="8" x2="12" y2="16"></line>
            <line x1="8" y1="12" x2="16" y2="12"></line>
        </svg>
        Post Request
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-medium ${requestScope['jakarta.servlet.forward.servlet_path'] == '/repairers' ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-colors" href="${pageContext.request.contextPath}/repairers">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
            <circle cx="9" cy="7" r="4"></circle>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
        </svg>
        Find Repairers
    </a>

    <div class="text-[10.5px] font-semibold text-muted tracking-[0.08em] uppercase pt-3.5 pr-6 pb-1.5 pl-6 mt-1.5">Account</div>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-medium ${requestScope['jakarta.servlet.forward.servlet_path'].contains('/profile') ? 'text-primary bg-primary-light' : 'text-nav hover:bg-primary-hover'} no-underline relative transition-colors" href="${pageContext.request.contextPath}/user/profile">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
            <circle cx="12" cy="7" r="4" />
        </svg>
        My Profile
    </a>

    <a class="flex items-center gap-3 py-2.5 px-3.5 mx-2.5 my-px rounded-[12px] text-sm font-medium text-nav no-underline relative transition-colors hover:bg-primary-hover" href="${pageContext.request.contextPath}/logout">
        <svg class="w-[18px] h-[18px] shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
            <polyline points="16 17 21 12 16 7" />
            <line x1="21" y1="12" x2="9" y2="12" />
        </svg>
        Sign out
    </a>

    <div class="flex-1"></div>

    <div class="flex items-center gap-[11px] pt-4 pr-[18px] pb-5 pl-[18px] border-t border-border mt-2.5">
        <div class="w-[38px] h-[38px] bg-primary-light rounded-[9px] flex items-center justify-center text-sm font-bold text-primary shrink-0 uppercase">
            ${user.name.substring(0, 1)}
        </div>
        <div class="flex flex-col gap-[2px]">
            <span class="text-[13.5px] font-bold text-dark">${user.name}</span>
            <span class="text-xs text-muted-dark">User account</span>
        </div>
    </div>
</aside>

