<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header class="bg-white border-b border-gray-100 h-16 flex items-center justify-between px-8 sticky top-0 z-30">
    <div class="flex items-center gap-4 text-gray-400">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
            <line x1="9" y1="3" x2="9" y2="21"/>
        </svg>
        <span class="text-sm font-medium text-gray-600">User Portal</span>
    </div>

    <div class="flex items-center gap-6">
        <a href="<%= request.getContextPath() %>/user/dashboard" class="text-gray-400 hover:text-[#449E80] transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/>
                <polyline points="9 22 9 12 15 12 15 22"/>
            </svg>
        </a>

        <div class="flex items-center gap-3 bg-gray-50 border border-gray-200 py-1.5 pl-1.5 pr-3 rounded-full">
            <div class="w-7 h-7 bg-[#449E80]/10 rounded-full flex items-center justify-center text-[10px] font-bold text-[#449E80] uppercase">
                <%= (session.getAttribute("userName") != null) ? ((String)session.getAttribute("userName")).substring(0, 2) : "U" %>
            </div>
            <span class="text-xs font-medium text-gray-700"><%= session.getAttribute("userEmail") %></span>
        </div>

        <a href="<%= request.getContextPath() %>/logout" class="flex items-center gap-2 text-sm font-medium text-gray-500 hover:text-red-500 transition-colors group">
             <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="group-hover:-translate-x-0.5 transition-transform">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                <polyline points="16 17 21 12 16 7"/>
                <line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
            <span>Sign Out</span>
        </a>
    </div>
</header>
