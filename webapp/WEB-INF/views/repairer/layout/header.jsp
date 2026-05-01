<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String contextPath = request.getContextPath(); %>
<header class="h-20 flex items-center justify-between px-8 z-10 sticky top-0 bg-[#FAFAFA]/80 backdrop-blur-md">
    <div class="flex items-center gap-4">
        <h2 class="font-bold text-gray-900 text-lg">Repairer Portal</h2>
    </div>
    <div class="flex items-center gap-5">
        <span class="text-sm text-gray-600 font-medium"><%= session.getAttribute("userEmail") %></span>
        <a href="<%= contextPath %>/logout" class="text-gray-500 hover:text-red-600 text-sm font-medium transition-colors">Sign Out</a>
    </div>
</header>
