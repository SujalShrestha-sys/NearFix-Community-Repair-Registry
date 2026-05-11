<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Repairers - NearFix</title>
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
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <!-- Header Section -->
            <div class="mb-8 mt-2">
                <p class="text-sm text-muted-dark">Find the best local experts to fix your items</p>
            </div>

            <!-- Filters Section -->
            <form action="${pageContext.request.contextPath}/repairers" method="GET" class="mb-10">
                <div class="flex flex-col md:flex-row gap-4">
                    <!-- Search Bar -->
                    <div class="flex-1 relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-muted" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </div>
                        <input type="text" name="keyword" value="${currentKeyword}" 
                               placeholder="Search repairers by name.." 
                               class="block w-full pl-11 pr-4 py-[14px] bg-white border border-border rounded-2xl text-sm font-bold focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all">
                    </div>

                    <!-- Category Filter -->
                    <div class="w-full md:w-[220px]">
                        <select name="categoryId" onchange="this.form.submit()"
                                class="block w-full px-4 py-[14px] bg-white border border-border rounded-2xl text-sm font-bold appearance-none focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all cursor-pointer">
                            <option value="">All Categories</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}" ${currentCategoryId == cat.categoryId ? 'selected' : ''}>
                                    ${cat.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Area Filter -->
                    <div class="w-full md:w-[220px]">
                        <select name="area" onchange="this.form.submit()"
                                class="block w-full px-4 py-[14px] bg-white border border-border rounded-2xl text-sm font-bold appearance-none focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all cursor-pointer">
                            <option value="">All Areas</option>
                            <option value="Kathmandu" ${currentArea == 'Kathmandu' ? 'selected' : ''}>Kathmandu</option>
                            <option value="Lalitpur" ${currentArea == 'Lalitpur' ? 'selected' : ''}>Lalitpur</option>
                            <option value="Bhaktapur" ${currentArea == 'Bhaktapur' ? 'selected' : ''}>Bhaktapur</option>
                            <option value="Pokhara" ${currentArea == 'Pokhara' ? 'selected' : ''}>Pokhara</option>
                        </select>
                    </div>
                </div>
            </form>

            <!-- Results Section -->
            <div class="grid grid-cols-1 gap-5">
                <c:if test="${empty repairers}">
                    <div class="bg-white rounded-[32px] border border-border p-16 text-center">
                        <div class="w-20 h-20 bg-primary-light rounded-full flex items-center justify-center mx-auto mb-6 text-primary">
                            <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold text-dark mb-2">No repairers found</h3>
                        <p class="text-muted-dark font-medium max-w-sm mx-auto">Try adjusting your filters or searching with a different keyword.</p>
                        <a href="${pageContext.request.contextPath}/find-repairers" class="mt-6 inline-block text-primary font-bold hover:underline">Clear all filters</a>
                    </div>
                </c:if>

                <c:forEach var="rep" items="${repairers}">
                    <div class="bg-white rounded-[28px] border border-border p-6 flex flex-col md:flex-row items-center gap-6 group hover:border-primary/30 transition-all hover:shadow-xl hover:shadow-primary/5">
                        <!-- Profile Avatar -->
                        <div class="w-16 h-16 rounded-2xl bg-primary-light flex items-center justify-center shrink-0 group-hover:scale-105 transition-transform">
                            <span class="text-primary font-extrabold text-xl uppercase">${rep.name.substring(0, 2)}</span>
                        </div>

                        <!-- Details -->
                        <div class="flex-1 text-center md:text-left">
                            <div class="flex flex-col md:flex-row md:items-center gap-2 mb-1">
                                <h3 class="text-lg font-bold text-[#1A2E28] tracking-tight">${rep.name}</h3>
                                <div class="flex items-center justify-center md:justify-start gap-1.5 px-3 py-1 bg-primary-light rounded-full">
                                    <svg class="w-3.5 h-3.5 text-primary" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                    </svg>
                                    <span class="text-[12px] font-bold text-primary">${rep.rating > 0 ? rep.rating : 'New'}</span>
                                </div>
                            </div>
                            <p class="text-muted-dark text-[13px] font-semibold mb-3">
                                ${rep.specialization} &bull; ${rep.yearsOfExperience} years experience
                            </p>
                            <div class="flex flex-wrap items-center justify-center md:justify-start gap-4">
                                <div class="flex items-center gap-2 text-muted-dark">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                    <span class="text-[13px] font-semibold">${rep.serviceArea}</span>
                                </div>
                                <c:if test="${rep.verified}">
                                    <div class="flex items-center gap-1.5 px-3 py-1 bg-green-50 rounded-full">
                                        <svg class="w-3.5 h-3.5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                                        </svg>
                                        <span class="text-[11px] font-bold text-green-600 uppercase tracking-wider">Verified</span>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Action -->
                        <div class="shrink-0 w-full md:w-auto">
                            <a href="${pageContext.request.contextPath}/repairer-profile?id=${rep.userId}" 
                               class="block text-center px-8 py-3 bg-white border-2 border-border text-dark font-black text-sm rounded-2xl hover:border-primary hover:text-primary transition-all active:scale-95">
                                View Profile
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>

</body>
</html>
