<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- STATS CARDS -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-8">
    <!-- Total Requests -->
    <div class="bg-white rounded-2xl p-6 border border-border shadow-sm flex flex-col gap-1 relative min-h-[110px]">
        <span class="text-[10px] font-bold tracking-[0.08em] uppercase text-muted-dark">Total Requests</span>
        <span class="text-[36px] font-bold text-dark leading-none tracking-[-1px] mt-1">${totalRequests}</span>
        <span class="text-xs text-muted font-medium">All time</span>
        <div class="absolute top-5 right-5 w-10 h-10 rounded-xl flex items-center justify-center bg-primary-light">
            <svg class="w-5 h-5 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                <polyline points="14 2 14 8 20 8"></polyline>
                <line x1="16" y1="13" x2="8" y2="13"></line>
                <line x1="16" y1="17" x2="8" y2="17"></line>
                <polyline points="10 9 9 9 8 9"></polyline>
            </svg>
        </div>
    </div>
    <!-- In Progress -->
    <div class="bg-white rounded-2xl p-6 border border-border shadow-sm flex flex-col gap-1 relative min-h-[110px]">
        <span class="text-[10px] font-bold tracking-[0.08em] uppercase text-muted-dark">In Progress</span>
        <span class="text-[36px] font-bold text-dark leading-none tracking-[-1px] mt-1">${inProgressCount}</span>
        <span class="text-xs text-muted font-medium">Active now</span>
        <div class="absolute top-5 right-5 w-10 h-10 rounded-xl flex items-center justify-center bg-blue-50">
            <svg class="w-5 h-5 text-blue-500" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path>
            </svg>
        </div>
    </div>
    <!-- Completed -->
    <div class="bg-white rounded-2xl p-6 border border-border shadow-sm flex flex-col gap-1 relative min-h-[110px]">
        <span class="text-[10px] font-bold tracking-[0.08em] uppercase text-muted-dark">Completed</span>
        <span class="text-[36px] font-bold text-dark leading-none tracking-[-1px] mt-1">${completedCount}</span>
        <span class="text-xs text-muted font-medium">Items repaired</span>
        <div class="absolute top-5 right-5 w-10 h-10 rounded-xl flex items-center justify-center bg-green-50">
            <svg class="w-5 h-5 text-green-500" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
        </div>
    </div>
    <!-- Avg Rating -->
    <div class="bg-white rounded-2xl p-6 border border-border shadow-sm flex flex-col gap-1 relative min-h-[110px]">
        <span class="text-[10px] font-bold tracking-[0.08em] uppercase text-muted-dark">Avg Rating Given</span>
        <span class="text-[36px] font-bold text-dark leading-none tracking-[-1px] mt-1">4.8</span>
        <span class="text-xs text-muted font-medium">Stars</span>
        <div class="absolute top-5 right-5 w-10 h-10 rounded-xl flex items-center justify-center bg-yellow-50">
            <svg class="w-5 h-5 text-yellow" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
            </svg>
        </div>
    </div>
</div>
