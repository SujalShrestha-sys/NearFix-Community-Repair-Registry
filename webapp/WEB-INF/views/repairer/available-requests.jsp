<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Browse Jobs - NearFix</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: '#0B7A53',
              'primary-light': '#EAF5EF',
              'primary-hover': '#F0F7F3',
              background: '#F3F8F5',
              dark: '#0D1F1A',
              border: '#E3ECE7',
              'border-light': '#D0E4DA',
              'border-extra-light': '#D8EAE1',
              muted: '#A0B4A8',
              'muted-dark': '#7D9087',
              'muted-light': '#EAF2EE',
              nav: '#3D5A50',
              yellow: '#F4B63D',
              'yellow-light': '#FFF5DC',
            }
          }
        }
      }
    </script>
    <style>
      .sidebar-open { transform: translateX(0) !important; }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="dashboard/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="dashboard/navbar.jsp" />

        <div class="pt-[22px] px-4 md:px-9 pb-9">
            <div class="flex flex-col md:flex-row md:items-center justify-between mb-6 gap-4">
                <h2 class="text-xl md:text-2xl font-bold text-dark">Available Repair Requests</h2>
                <div class="w-full md:w-auto">
                    <form action="${pageContext.request.contextPath}/repairer/available-requests" method="GET" class="flex flex-col sm:flex-row gap-2">
                        <select name="categoryId" class="bg-white border border-border rounded-lg px-4 py-2 text-sm outline-none w-full sm:w-auto">
                            <option value="">All Categories</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}" ${selectedCategoryId == cat.categoryId ? 'selected' : ''}>${cat.name}</option>
                            </c:forEach>
                        </select>
                        <div class="flex gap-2 w-full sm:w-auto">
                            <input type="text" name="search" value="${search}" placeholder="Search items..." class="bg-white border border-border rounded-lg px-4 py-2 text-sm outline-none flex-1 sm:w-48">
                            <button type="submit" class="bg-primary text-white px-6 py-2 rounded-lg text-sm font-semibold hover:bg-opacity-90">Filter</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:choose>
                    <c:when test="${not empty requests}">
                        <c:forEach var="req" items="${requests}">
                            <c:set var="isSaved" value="${savedIds.contains(req.requestId)}" />
                            <div class="bg-white rounded-2xl border border-border p-6 shadow-sm hover:shadow-md transition-shadow flex flex-col">
                                <div class="flex justify-between items-start mb-4">
                                    <span class="bg-primary-light text-primary text-xs font-bold px-3 py-1 rounded-full uppercase">${req.categoryName}</span>
                                    <div class="flex items-center gap-2">
                                        <span class="text-xs text-muted-dark font-medium">${req.urgency}</span>
                                        <%-- Bookmark / Save Button --%>
                                        <form action="${pageContext.request.contextPath}/repairer/available-requests" method="POST" class="inline">
                                            <input type="hidden" name="action" value="toggle-save">
                                            <input type="hidden" name="requestId" value="${req.requestId}">
                                            <button type="submit"
                                                title="${isSaved ? 'Remove from Wishlist' : 'Save to Wishlist'}"
                                                class="w-8 h-8 flex items-center justify-center rounded-full transition-all ${isSaved ? 'bg-pink-100 text-pink-500 hover:bg-pink-200' : 'bg-gray-100 text-muted hover:bg-pink-100 hover:text-pink-500'}">
                                                <c:choose>
                                                    <c:when test="${isSaved}">
                                                        <%-- Filled heart --%>
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor">
                                                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                                        </svg>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <%-- Outline heart --%>
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                                        </svg>
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <h3 class="text-lg font-bold text-dark mb-2">${req.itemName}</h3>
                                <p class="text-sm text-muted-dark mb-6 line-clamp-2">${req.description}</p>

                                <div class="flex items-center justify-between mt-auto pt-4 border-t border-border">
                                    <div class="flex flex-col">
                                        <span class="text-xs text-muted">Customer</span>
                                        <span class="text-sm font-semibold text-dark">${req.userName}</span>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/repairer/available-requests" method="POST">
                                        <input type="hidden" name="action" value="accept-request">
                                        <input type="hidden" name="requestId" value="${req.requestId}">
                                        <button type="submit" class="bg-primary text-white px-5 py-2.5 rounded-xl text-sm font-bold hover:bg-opacity-90 transition-all">Accept Job</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-span-full py-20 text-center">
                            <div class="text-muted-dark text-lg">No requests found matching your criteria.</div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <script>
      const menuBtn = document.getElementById('mobile-menu-btn');
      const sidebar = document.querySelector('aside');
      if (menuBtn && sidebar) {
        menuBtn.addEventListener('click', () => sidebar.classList.toggle('sidebar-open'));
        document.addEventListener('click', (e) => {
          if (window.innerWidth < 1024 && !sidebar.contains(e.target) && !menuBtn.contains(e.target)) {
            sidebar.classList.remove('sidebar-open');
          }
        });
      }
    </script>
</body>
</html>
