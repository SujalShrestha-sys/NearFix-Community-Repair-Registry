<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Requests - NearFix</title>
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
        .font-inter { font-family: 'Inter', sans-serif; }
        .sidebar-open { transform: translateX(0) !important; }
        .line-clamp-2 { display: -webkit-box; -webkit-line-clamp: 2; line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <!-- Messages -->
            <c:if test="${not empty successMessage}">
                <div class="mb-6 bg-green-50 border border-green-100 text-green-600 px-6 py-4 rounded-2xl font-semibold flex items-center gap-3 animate-bounce">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                    ${successMessage}
                </div>
                <% session.removeAttribute("successMessage"); %>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="mb-6 bg-red-50 border border-red-100 text-red-500 px-6 py-4 rounded-2xl font-semibold flex items-center gap-3">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    ${errorMessage}
                </div>
                <% session.removeAttribute("errorMessage"); %>
            </c:if>

            <div class="flex flex-col md:flex-row md:items-center justify-between mb-8 gap-4">
                <div>
                    <h1 class="text-2xl md:text-[32px] font-extrabold text-dark tracking-[-0.8px]">My Requests</h1>
                    <p class="text-sm text-muted-dark mt-1">Track and manage all your repair requests</p>
                </div>
                <a href="${pageContext.request.contextPath}/user/post-request" class="inline-flex items-center gap-2 bg-primary text-white px-6 py-3.5 rounded-[14px] font-bold text-sm shadow-lg shadow-primary/20 hover:bg-opacity-90 transition-all no-underline">
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                    New Request
                </a>
            </div>

            <!-- Filters -->
            <div class="flex items-center gap-2 mb-8 overflow-x-auto pb-2 no-scrollbar">
                <a href="${pageContext.request.contextPath}/user/my-requests" class="px-5 py-2.5 rounded-full text-sm font-semibold whitespace-nowrap transition-all ${empty selectedStatus ? 'bg-dark text-white shadow-md' : 'bg-white text-muted-dark border border-border hover:bg-muted-light'} no-underline">
                    All (${requests.size()})
                </a>
                <a href="${pageContext.request.contextPath}/user/my-requests?status=PENDING" class="px-5 py-2.5 rounded-full text-sm font-semibold whitespace-nowrap transition-all ${selectedStatus == 'PENDING' ? 'bg-dark text-white shadow-md' : 'bg-white text-muted-dark border border-border hover:bg-muted-light'} no-underline">
                    Pending
                </a>
                <a href="${pageContext.request.contextPath}/user/my-requests?status=IN_PROGRESS" class="px-5 py-2.5 rounded-full text-sm font-semibold whitespace-nowrap transition-all ${selectedStatus == 'IN_PROGRESS' ? 'bg-dark text-white shadow-md' : 'bg-white text-muted-dark border border-border hover:bg-muted-light'} no-underline">
                    In Progress
                </a>
                <a href="${pageContext.request.contextPath}/user/my-requests?status=COMPLETED" class="px-5 py-2.5 rounded-full text-sm font-semibold whitespace-nowrap transition-all ${selectedStatus == 'COMPLETED' ? 'bg-dark text-white shadow-md' : 'bg-white text-muted-dark border border-border hover:bg-muted-light'} no-underline">
                    Completed
                </a>
            </div>

            <!-- Requests List -->
            <div class="flex flex-col gap-6">
                <c:choose>
                    <c:when test="${not empty requests}">
                        <c:forEach var="req" items="${requests}">
                            <div class="bg-white rounded-[24px] border border-border p-6 md:p-8 shadow-sm hover:shadow-md transition-all relative overflow-hidden group">
                                <div class="flex flex-col md:flex-row md:items-start justify-between gap-4 mb-6">
                                    <div class="flex-1">
                                        <div class="flex flex-wrap items-center gap-2 mb-3">
                                            <span class="px-3 py-1 rounded-full text-[11px] font-bold uppercase ${req.status == 'PENDING' ? 'bg-blue-50 text-blue-500' : req.status == 'IN_PROGRESS' ? 'bg-primary-light text-primary' : 'bg-green-50 text-green-600'}">
                                                ${req.status}
                                            </span>
                                            <c:if test="${req.urgency == 'URGENT'}">
                                                <span class="px-3 py-1 rounded-full text-[11px] font-bold uppercase bg-yellow-light text-yellow">Urgent</span>
                                            </c:if>
                                            <span class="text-[11px] font-medium text-muted-dark">${req.categoryName} · #${req.requestId}</span>
                                        </div>
                                        <h3 class="text-xl font-bold text-dark mb-3 group-hover:text-primary transition-colors">${req.itemName}</h3>
                                        <p class="text-sm text-muted-dark line-clamp-2 max-w-3xl">${req.description}</p>
                                    </div>
                                    
                                    <div class="flex items-center gap-3">
                                        <c:choose>
                                            <c:when test="${req.status == 'PENDING'}">
                                                <a href="${pageContext.request.contextPath}/user/repair-request?action=edit&id=${req.requestId}" class="px-6 py-3 rounded-[16px] text-[11px] font-black uppercase tracking-widest border border-border text-dark hover:bg-dark hover:text-white transition-all no-underline">Edit</a>
                                                <form action="${pageContext.request.contextPath}/user/repair-request" method="POST" onsubmit="return confirm('Archive this request?')">
                                                    <input type="hidden" name="action" value="cancel">
                                                    <input type="hidden" name="requestId" value="${req.requestId}">
                                                    <button type="submit" class="w-12 h-12 rounded-[16px] flex items-center justify-center border border-border text-muted hover:text-red-500 hover:border-red-100 hover:bg-red-50 transition-all">
                                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/user/repair-request?action=view&id=${req.requestId}" class="px-8 py-3 rounded-[16px] text-[11px] font-black uppercase tracking-widest bg-dark text-white hover:bg-primary transition-all no-underline">Overview</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <!-- Progress Bar -->
                                <div class="flex items-start justify-between relative mt-10 mb-8 px-2 max-w-4xl mx-auto md:mx-0 ${req.status == 'CANCELLED' ? 'opacity-40 grayscale' : ''}">
                                    <div class="absolute top-[15px] left-8 right-8 h-[2px] bg-border z-0">
                                        <c:set var="userProgClass" value="${req.status == 'PENDING' ? 'w-0' : req.status == 'ACCEPTED' ? 'w-1/3' : req.status == 'IN_PROGRESS' ? 'w-2/3' : req.status == 'COMPLETED' ? 'w-full' : 'w-0'}" />
                                        <div class="h-full bg-primary rounded-full transition-all duration-700 ${userProgClass}">
                                    </div>
                                </div>

                                    <!-- Steps -->
                                    <c:forEach var="step" items="Pending,Accepted,In Progress,Done" varStatus="vs">
                                        <div class="flex flex-col items-center gap-2 z-[1] flex-1">
                                            <c:set var="isReached" value="${(vs.index == 0 && (req.status == 'PENDING' || req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS' || req.status == 'COMPLETED')) || 
                                                                           (vs.index == 1 && (req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS' || req.status == 'COMPLETED')) || 
                                                                           (vs.index == 2 && (req.status == 'IN_PROGRESS' || req.status == 'COMPLETED')) || 
                                                                           (vs.index == 3 && (req.status == 'COMPLETED'))}" />
                                            <div class="w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-bold ${isReached ? 'bg-primary border-4 border-primary-light text-white' : 'bg-white border-2 border-border text-muted'}">
                                                <c:choose>
                                                    <c:when test="${isReached && req.status != 'PENDING' && req.status != 'ACCEPTED' && req.status != 'IN_PROGRESS' && req.status != 'COMPLETED' ? false : (isReached && req.status != (step == 'Done' ? 'COMPLETED' : (step == 'In Progress' ? 'IN_PROGRESS' : step.toUpperCase())))}">
                                                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                                    </c:when>
                                                    <c:otherwise>${vs.index + 1}</c:otherwise>
                                                </c:choose>
                                        </div>
                                            <span class="text-[10.5px] ${isReached ? 'font-bold text-dark' : 'font-medium text-muted-dark'}">${step}</span>
                                        </div>
                                    </c:forEach>
                                    </div>

                                <!-- Footer -->
                                <div class="flex items-center justify-between pt-6 border-t border-border mt-2">
                                    <div class="flex items-center gap-3">
                                        <c:choose>
                                            <c:when test="${not empty req.repairerName}">
                                                <div class="w-8 h-8 bg-primary-light rounded-lg flex items-center justify-center text-primary font-bold text-xs uppercase">${req.repairerName.substring(0,2)}</div>
                                                <div class="flex items-center gap-2">
                                                    <span class="text-xs font-bold text-dark">${req.repairerName}</span>
                                                    <div class="flex items-center text-yellow">
                                                        <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                                        <span class="text-[10px] font-bold ml-0.5 text-muted-dark">4.9</span>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-xs font-medium text-muted">Awaiting repairer</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="flex items-center gap-4">
                                        <span class="text-[11px] text-muted-dark font-medium">Posted on ${req.createdAt}</span>
                                        <c:if test="${req.status == 'COMPLETED'}">
                                            <div class="flex items-center gap-1 text-yellow">
                                                <span class="text-[11px] font-bold">Rated</span>
                                                <div class="flex">
                                                    <c:forEach begin="1" end="5">
                                                        <svg class="w-2.5 h-2.5" fill="currentColor" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="bg-white rounded-[24px] border-2 border-dashed border-border py-20 flex flex-col items-center justify-center text-center">
                            <div class="w-20 h-20 bg-muted-light rounded-full flex items-center justify-center mb-6">
                                <svg class="w-10 h-10 text-muted" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>
                            </div>
                            <h2 class="text-xl font-bold text-dark mb-2">No requests found</h2>
                            <p class="text-muted-dark max-w-sm mb-8">You don't have any repair requests in this category. Start by posting a new one!</p>
                            <a href="${pageContext.request.contextPath}/user/post-request" class="bg-primary text-white px-8 py-3 rounded-xl font-bold hover:bg-opacity-90 transition-all no-underline">Post a Request</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
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
