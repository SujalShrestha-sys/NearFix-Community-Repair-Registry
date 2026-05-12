<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- HEADER -->
<div class="flex items-center justify-between pt-7 px-4 md:px-9 pb-0">
    <div class="flex items-center gap-4">
        <button id="mobile-menu-btn" class="lg:hidden w-10 h-10 flex items-center justify-center bg-white border border-border rounded-xl text-dark">
            <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="3" y1="12" x2="21" y2="12"></line>
                <line x1="3" y1="6" x2="21" y2="6"></line>
                <line x1="3" y1="18" x2="21" y2="18"></line>
            </svg>
        </button>
        <h1 class="text-xl md:text-[28px] font-extrabold text-dark tracking-[-0.5px]">${pageTitle}</h1>
    </div>
    <div class="flex items-center gap-3">
        <div class="hidden md:flex items-center gap-2 bg-muted-light border border-border-extra-light rounded-[24px] py-[9px] px-[18px] w-[220px]">
            <svg class="w-[15px] h-[15px] text-muted shrink-0" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8" />
                <line x1="21" y1="21" x2="16.65" y2="16.65" />
            </svg>
            <input class="border-none bg-transparent outline-none text-[13.5px] text-muted-dark font-inter w-full placeholder:text-muted" type="text" placeholder="Search jobs...">
        </div>
        <div class="w-[38px] h-[38px] bg-muted-light border border-border-extra-light rounded-full flex items-center justify-center cursor-pointer">
            <svg class="w-[17px] h-[17px] text-nav" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
                <path d="M13.73 21a2 2 0 0 1-3.46 0" />
            </svg>
        </div>
    </div>
</div>

<%-- Alert Messages --%>
<div class="px-4 md:px-9 pt-4">
    <c:if test="${not empty errorMessage}">
        <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl relative mb-4 flex items-center gap-3">
            <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <span class="text-sm font-medium">${errorMessage}</span>
        </div>
    </c:if>
    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl relative mb-4 flex items-center gap-3">
            <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <span class="text-sm font-medium">${sessionScope.errorMessage}</span>
        </div>
        <c:remove var="errorMessage" scope="session" />
    </c:if>
    <c:if test="${not empty successMessage}">
        <div class="bg-primary-light border border-primary/20 text-primary px-4 py-3 rounded-xl relative mb-4 flex items-center gap-3">
            <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <span class="text-sm font-medium">${successMessage}</span>
        </div>
    </c:if>
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="bg-primary-light border border-primary/20 text-primary px-4 py-3 rounded-xl relative mb-4 flex items-center gap-3">
            <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
            <span class="text-sm font-medium">${sessionScope.successMessage}</span>
        </div>
        <c:remove var="successMessage" scope="session" />
    </c:if>
</div>
