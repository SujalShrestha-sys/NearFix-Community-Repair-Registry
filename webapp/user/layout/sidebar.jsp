<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String currentPath = request.getRequestURI();
    String contextPath = request.getContextPath();
%>
<aside class="w-64 flex-shrink-0 bg-white border-r border-gray-100 flex flex-col h-screen sticky top-0">
    <div class="px-8 py-10 flex items-center gap-3">
        <div class="p-2 bg-[#449E80] rounded-lg text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
            </svg>
        </div>
        <div>
            <h1 class="text-lg font-bold text-gray-900 tracking-tight">NearFix</h1>
            <p class="text-[10px] uppercase tracking-[0.2em] font-bold text-gray-400 -mt-1 leading-none">User Portal</p>
        </div>
    </div>

    <nav class="flex-1 px-4 space-y-1">
        <p class="px-4 text-[10px] uppercase tracking-widest font-bold text-gray-400 mb-2 mt-4">Navigation</p>
        
        <a href="<%= contextPath %>/user/dashboard" 
           class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all font-medium text-sm <%= currentPath.contains("dashboard") ? "bg-[#449E80]/10 text-[#449E80]" : "text-gray-500 hover:bg-gray-50 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/>
            </svg>
            <span>Dashboard</span>
        </a>

        <a href="<%= contextPath %>/repair-request?action=post" 
           class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all font-medium text-sm <%= currentPath.contains("post-request") ? "bg-[#449E80]/10 text-[#449E80]" : "text-gray-500 hover:bg-gray-50 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/>
            </svg>
            <span>New Request</span>
        </a>

        <a href="<%= contextPath %>/repair-request?action=myRequests" 
           class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all font-medium text-sm <%= currentPath.contains("my-requests") ? "bg-[#449E80]/10 text-[#449E80]" : "text-gray-500 hover:bg-gray-50 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/>
            </svg>
            <span>My Requests</span>
        </a>

        <a href="<%= contextPath %>/user/profile" 
           class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all font-medium text-sm <%= currentPath.contains("profile") ? "bg-[#449E80]/10 text-[#449E80]" : "text-gray-500 hover:bg-gray-50 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
            </svg>
            <span>Profile</span>
        </a>
    </nav>
</aside>
