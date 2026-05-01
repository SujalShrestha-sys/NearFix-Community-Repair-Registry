<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String contextPath = request.getContextPath(); String currentPath = request.getRequestURI(); %>
<aside class="w-64 bg-white border-r border-gray-100 flex flex-col hidden md:flex h-screen sticky top-0">
    <div class="h-20 flex items-center px-6 border-b border-transparent">
        <a href="<%= contextPath %>/" class="flex items-center gap-3">
            <div class="bg-[#409074] rounded-full w-9 h-9 flex items-center justify-center text-white">N</div>
            <h1 class="font-bold text-gray-900 text-lg">NearFix</h1>
        </a>
    </div>
    <div class="flex-1 py-6 px-4 space-y-1">
        <a href="<%= contextPath %>/repairer/dashboard" class="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors <%= currentPath.contains("dashboard") ? "bg-[#F0F9F5] text-[#2F6C56]" : "text-gray-500 hover:bg-gray-50" %>">Dashboard</a>
        <a href="<%= contextPath %>/repairer/available-requests" class="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors <%= currentPath.contains("available-requests") ? "bg-[#F0F9F5] text-[#2F6C56]" : "text-gray-500 hover:bg-gray-50" %>">Available Jobs</a>
        <a href="<%= contextPath %>/repairer/my-requests" class="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors <%= currentPath.contains("my-requests") ? "bg-[#F0F9F5] text-[#2F6C56]" : "text-gray-500 hover:bg-gray-50" %>">My Jobs</a>
        <a href="<%= contextPath %>/repairer/profile" class="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors <%= currentPath.contains("profile") ? "bg-[#F0F9F5] text-[#2F6C56]" : "text-gray-500 hover:bg-gray-50" %>">Profile</a>
    </div>
</aside>
