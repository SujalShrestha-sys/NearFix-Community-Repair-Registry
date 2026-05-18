<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentPath" value="${requestScope['jakarta.servlet.forward.servlet_path']}" />

<!-- HEADER -->
<div class="flex items-center justify-between pt-7 px-4 md:px-9 pb-0">
  <div class="flex items-center gap-4">
    <button
      id="mobile-menu-btn"
      class="lg:hidden w-10 h-10 flex items-center justify-center bg-white border border-border rounded-xl text-dark"
    >
      <svg
        class="w-6 h-6"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <line x1="3" y1="12" x2="21" y2="12"></line>
        <line x1="3" y1="6" x2="21" y2="6"></line>
        <line x1="3" y1="18" x2="21" y2="18"></line>
      </svg>
    </button>
    <c:set var="displayName" value="${not empty user ? user.name : sessionScope.userName}" />
    <h1
      class="text-xl md:text-[26px] font-bold text-[#1A2E28] tracking-[-0.3px]"
    >
      <c:choose>
        <c:when test="${currentPath == '/user/dashboard'}">
          Welcome, ${displayName}
        </c:when>
        <c:when test="${currentPath == '/repairers'}">
          Find Repairers
        </c:when>
        <c:when test="${currentPath == '/user/my-requests'}">
          My Requests
        </c:when>
        <c:when test="${currentPath == '/user/post-request'}">
          Post Request
        </c:when>
        <c:when test="${currentPath == '/user/profile' || currentPath == '/repairer/profile' || currentPath == '/profile'}">
          My Profile
        </c:when>
        <c:otherwise>
          NearFix
        </c:otherwise>
      </c:choose>
    </h1>
  </div>
  <div class="flex items-center gap-3">
    <div
      class="hidden md:flex items-center gap-2 bg-white border border-border rounded-[24px] py-[9px] px-[18px] w-[260px] shadow-sm"
    >
      <svg
        class="w-[15px] h-[15px] text-muted shrink-0"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <circle cx="11" cy="11" r="8" />
        <line x1="21" y1="21" x2="16.65" y2="16.65" />
      </svg>
      <input
        class="border-none bg-transparent outline-none text-[13.5px] text-muted-dark font-inter w-full placeholder:text-muted"
        type="text"
        placeholder="Search requests..."
      />
    </div>
    <div
      class="w-[42px] h-[42px] bg-white border border-border rounded-xl flex items-center justify-center cursor-pointer shadow-sm relative"
    >
      <svg
        class="w-[19px] h-[19px] text-nav"
        viewBox="0 0 24 24"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        stroke-linecap="round"
        stroke-linejoin="round"
      >
        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
        <path d="M13.73 21a2 2 0 0 1-3.46 0" />
      </svg>
      <span
        class="absolute top-2.5 right-2.5 w-2 h-2 bg-primary rounded-full border-2 border-white"
      ></span>
    </div>
  </div>
</div>
