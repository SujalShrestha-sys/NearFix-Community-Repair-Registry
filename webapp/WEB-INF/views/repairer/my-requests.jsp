<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Jobs - NearFix</title>
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

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <div class="pt-[22px] px-4 md:px-9 pb-9">
            <div class="flex flex-col md:flex-row md:items-center justify-between mb-6 gap-4">
                <h2 class="text-xl md:text-2xl font-bold text-dark">My Assigned Jobs</h2>
                <div class="w-full md:w-auto">
                    <form action="${pageContext.request.contextPath}/repairer/my-requests" method="GET" class="flex flex-col sm:flex-row gap-2">
                        <select name="status" onchange="this.form.submit()" class="bg-white border border-border rounded-lg px-4 py-2 text-sm outline-none w-full sm:w-auto">
                            <option value="" ${empty selectedStatus ? 'selected' : ''}>All Statuses</option>
                            <option value="ACCEPTED" ${selectedStatus == 'ACCEPTED' ? 'selected' : ''}>Accepted</option>
                            <option value="IN_PROGRESS" ${selectedStatus == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                            <option value="COMPLETED" ${selectedStatus == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                        </select>
                        <div class="flex gap-2 w-full sm:w-auto">
                            <input type="text" name="search" value="${search}" placeholder="Search my jobs..." class="bg-white border border-border rounded-lg px-4 py-2 text-sm outline-none flex-1 sm:w-48">
                            <button type="submit" class="bg-primary text-white px-6 py-2 rounded-lg text-sm font-semibold hover:bg-opacity-90">Filter</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="bg-white rounded-2xl border border-border overflow-hidden shadow-sm">
                <!-- Desktop Table -->
                <div class="hidden md:block">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-primary-light">
                                <th class="px-6 py-4 text-xs font-bold text-primary uppercase tracking-wider">Request ID</th>
                                <th class="px-6 py-4 text-xs font-bold text-primary uppercase tracking-wider">Item</th>
                                <th class="px-6 py-4 text-xs font-bold text-primary uppercase tracking-wider">Customer</th>
                                <th class="px-6 py-4 text-xs font-bold text-primary uppercase tracking-wider">Status</th>
                                <th class="px-6 py-4 text-xs font-bold text-primary uppercase tracking-wider">Action</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-border">
                            <c:choose>
                                <c:when test="${not empty requests}">
                                    <c:forEach var="req" items="${requests}">
                                        <tr class="hover:bg-primary-hover transition-colors">
                                            <td class="px-6 py-4 text-sm font-medium text-dark">#${req.requestId}</td>
                                            <td class="px-6 py-4">
                                                <div class="flex flex-col">
                                                    <span class="text-sm font-bold text-dark">${req.itemName}</span>
                                                    <span class="text-xs text-muted-dark">${req.categoryName}</span>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 text-sm text-dark">${req.userName}</td>
                                            <td class="px-6 py-4">
                                                <span class="px-3 py-1 rounded-full text-[11px] font-bold uppercase
                                                    ${req.status == 'ACCEPTED' ? 'bg-yellow-light text-yellow' : 
                                                      req.status == 'IN_PROGRESS' ? 'bg-primary-light text-primary' : 
                                                      req.status == 'COMPLETED' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'}">
                                                    ${req.status}
                                                </span>
                                            </td>
                                            <td class="px-6 py-4">
                                                <div class="flex items-center gap-2">
                                                    <c:if test="${req.status == 'ACCEPTED'}">
                                                        <form action="${pageContext.request.contextPath}/repairer/my-requests" method="POST" class="inline">
                                                            <input type="hidden" name="action" value="start-request">
                                                            <input type="hidden" name="requestId" value="${req.requestId}">
                                                            <button type="submit" class="bg-yellow-light text-yellow-700 px-3 py-1.5 rounded-lg text-xs font-bold hover:bg-yellow-200 transition-colors">In Progress</button>
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS'}">
                                                        <form action="${pageContext.request.contextPath}/repairer/my-requests" method="POST" class="inline">
                                                            <input type="hidden" name="action" value="complete-request">
                                                            <input type="hidden" name="requestId" value="${req.requestId}">
                                                            <button type="submit" class="bg-primary-light text-primary px-3 py-1.5 rounded-lg text-xs font-bold hover:bg-primary hover:text-white transition-colors">Mark Completed</button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="px-6 py-12 text-center text-muted-dark">No jobs found.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Mobile Cards -->
                <div class="md:hidden">
                    <c:choose>
                        <c:when test="${not empty requests}">
                            <div class="divide-y divide-border">
                                <c:forEach var="req" items="${requests}">
                                    <div class="p-4 flex flex-col gap-3">
                                        <div class="flex justify-between items-start">
                                            <div class="flex flex-col">
                                                <span class="text-xs text-muted">ID #${req.requestId}</span>
                                                <span class="text-base font-bold text-dark">${req.itemName}</span>
                                                <span class="text-xs text-muted-dark">${req.categoryName}</span>
                                            </div>
                                            <span class="px-3 py-1 rounded-full text-[10px] font-bold uppercase
                                                ${req.status == 'ACCEPTED' ? 'bg-yellow-light text-yellow' : 
                                                  req.status == 'IN_PROGRESS' ? 'bg-primary-light text-primary' : 
                                                  req.status == 'COMPLETED' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'}">
                                                ${req.status}
                                            </span>
                                        </div>
                                        <div class="flex justify-between items-end">
                                            <div class="flex flex-col">
                                                <span class="text-xs text-muted">Customer</span>
                                                <span class="text-sm font-semibold text-dark">${req.userName}</span>
                                            </div>
                                            <c:if test="${req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS'}">
                                                <div class="flex gap-2">
                                                    <c:if test="${req.status == 'ACCEPTED'}">
                                                        <form action="${pageContext.request.contextPath}/repairer/my-requests" method="POST">
                                                            <input type="hidden" name="action" value="start-request">
                                                            <input type="hidden" name="requestId" value="${req.requestId}">
                                                            <button type="submit" class="bg-yellow-light text-yellow-700 px-4 py-2 rounded-lg text-xs font-bold hover:bg-yellow-200 transition-colors">In Progress</button>
                                                        </form>
                                                    </c:if>
                                                    <form action="${pageContext.request.contextPath}/repairer/my-requests" method="POST">
                                                        <input type="hidden" name="action" value="complete-request">
                                                        <input type="hidden" name="requestId" value="${req.requestId}">
                                                        <button type="submit" class="bg-primary-light text-primary px-4 py-2 rounded-lg text-xs font-bold hover:bg-primary hover:text-white transition-colors">Complete</button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="p-8 text-center text-muted-dark text-sm">No jobs found.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
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
    <style>
      .sidebar-open { transform: translateX(0) !important; }
    </style>
</body>
</html>
