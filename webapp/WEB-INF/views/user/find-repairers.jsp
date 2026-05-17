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
              background: '#F3F8F5',
              dark: '#0D1F1A',
              border: '#E3ECE7',
              muted: '#A0B4A8',
              'muted-dark': '#7D9087',
              'yellow': '#F4B63D',
              'yellow-light': '#FFF5DC',
            }
          }
        }
      }
    </script>
    <style>
        .font-inter { font-family: 'Inter', sans-serif; }
        .sidebar-open { transform: translateX(0) !important; }
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <!-- Header & Search -->
            <div class="flex flex-col lg:flex-row lg:items-center justify-between mb-8 gap-6 mt-2">
                <div class="flex-1">
                    <p class="text-sm text-muted-dark mb-4">Discover verified local experts ready to fix your items</p>
                    <form action="${pageContext.request.contextPath}/repairers" method="GET" class="relative max-w-2xl">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <i data-lucide="search" class="w-5 h-5 text-muted"></i>
                        </div>
                        <input type="text" name="keyword" value="${currentKeyword}" 
                               placeholder="Search by name or specialty..." 
                               class="block w-full pl-12 pr-4 py-4 bg-white border border-border rounded-2xl text-sm font-semibold focus:ring-4 focus:ring-primary/5 focus:border-primary outline-none transition-all shadow-sm">
                        <c:if test="${not empty currentCategoryId}">
                            <input type="hidden" name="categoryId" value="${currentCategoryId}">
                        </c:if>
                    </form>
                </div>
                
                <div class="flex items-center gap-4">
                    <form action="${pageContext.request.contextPath}/repairers" method="GET" id="areaForm">
                        <select name="area" onchange="this.form.submit()" 
                                class="bg-white border border-border rounded-2xl px-5 py-4 text-sm font-semibold text-dark outline-none focus:ring-4 focus:ring-primary/5 transition-all cursor-pointer appearance-none min-w-[180px]">
                            <option value="">All Areas</option>
                            <option value="Kathmandu" ${currentArea == 'Kathmandu' ? 'selected' : ''}>Kathmandu</option>
                            <option value="Lalitpur" ${currentArea == 'Lalitpur' ? 'selected' : ''}>Lalitpur</option>
                            <option value="Bhaktapur" ${currentArea == 'Bhaktapur' ? 'selected' : ''}>Bhaktapur</option>
                            <option value="Pokhara" ${currentArea == 'Pokhara' ? 'selected' : ''}>Pokhara</option>
                        </select>
                    </form>
                </div>
            </div>

            <!-- Premium Category Scroll Section -->
            <div class="relative mb-10 group">
                <div class="flex items-center gap-4">
                    <!-- Left Scroll Button -->
                    <button id="scroll-left" class="hidden absolute left-0 z-10 w-11 h-11 bg-white border border-border rounded-full items-center justify-center shadow-xl text-dark hover:text-primary transition-all -ml-5 group-hover:flex transform active:scale-95">
                        <i data-lucide="chevron-left" class="w-5 h-5"></i>
                    </button>

                    <!-- Scrollable Container -->
                    <div id="category-scroll" class="flex items-center gap-3 overflow-x-auto no-scrollbar scroll-smooth pb-2 flex-1">
                        <a href="${pageContext.request.contextPath}/repairers" 
                           class="px-7 py-3.5 rounded-2xl text-[13px] font-bold uppercase tracking-wider whitespace-nowrap transition-all ${empty currentCategoryId ? 'bg-primary text-white shadow-lg shadow-primary/20' : 'bg-white text-muted-dark border border-border hover:border-primary/40 hover:text-primary'} no-underline">
                           Overview
                        </a>
                        <c:forEach var="cat" items="${categories}">
                            <a href="${pageContext.request.contextPath}/repairers?categoryId=${cat.categoryId}" 
                               class="px-7 py-3.5 rounded-2xl text-[13px] font-bold uppercase tracking-wider whitespace-nowrap transition-all ${currentCategoryId == cat.categoryId ? 'bg-primary text-white shadow-lg shadow-primary/20' : 'bg-white text-muted-dark border border-border hover:border-primary/40 hover:text-primary'} no-underline">
                                ${cat.name}
                            </a>
                        </c:forEach>
                    </div>

                    <!-- Right Scroll Button -->
                    <button id="scroll-right" class="absolute right-0 z-10 w-11 h-11 bg-white border border-border rounded-full flex items-center justify-center shadow-xl text-dark hover:text-primary transition-all -mr-5 transform active:scale-95">
                        <i data-lucide="chevron-right" class="w-5 h-5"></i>
                    </button>
                </div>
            </div>

            <!-- Results Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
                <c:choose>
                    <c:when test="${not empty repairers}">
                        <c:forEach var="rep" items="${repairers}">
                            <div class="bg-white rounded-[32px] border border-border p-8 flex flex-col shadow-sm group hover:border-primary/30 transition-all hover:shadow-2xl hover:shadow-primary/5 relative overflow-hidden">
                                <!-- Top Info -->
                                <div class="flex items-start justify-between mb-6">
                                    <div class="w-16 h-16 rounded-[20px] bg-primary-light flex items-center justify-center shrink-0 group-hover:rotate-3 transition-transform">
                                        <span class="text-primary font-bold text-2xl uppercase">${rep.name.substring(0, 2)}</span>
                                    </div>
                                    <div class="flex flex-col items-end">
                                        <div class="flex items-center gap-1.5 px-3 py-1 bg-yellow-light rounded-full mb-2">
                                            <i data-lucide="star" class="w-3.5 h-3.5 text-yellow fill-yellow"></i>
                                            <span class="text-[12px] font-bold text-dark">${rep.rating > 0 ? rep.rating : 'NEW'}</span>
                                        </div>
                                        <c:if test="${rep.verified}">
                                            <div class="flex items-center gap-1 text-primary">
                                                <i data-lucide="check-circle-2" class="w-4 h-4 fill-primary-light"></i>
                                                <span class="text-[10px] font-bold uppercase tracking-widest">Verified</span>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="mb-8">
                                    <h3 class="text-xl font-bold text-dark tracking-tight mb-2 group-hover:text-primary transition-colors">${rep.name}</h3>
                                    <p class="text-muted-dark text-sm font-semibold opacity-80">${rep.specialization}</p>
                                </div>

                                <!-- Stats Row -->
                                <div class="grid grid-cols-2 gap-4 py-6 border-t border-border mt-auto">
                                    <div>
                                        <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-1">Experience</p>
                                        <p class="text-[13px] font-semibold text-dark">${rep.yearsOfExperience} Years</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-[10px] font-bold text-muted uppercase tracking-widest mb-1">Location</p>
                                        <p class="text-[13px] font-semibold text-dark">${rep.serviceArea}</p>
                                    </div>
                                </div>

                                <!-- Action Button -->
                                <a href="${pageContext.request.contextPath}/repairer-profile?id=${rep.userId}" 
                                   class="block w-full text-center py-4 bg-dark text-white rounded-[14px] font-medium text-[12px] uppercase tracking-[0.15em] hover:bg-primary transition-all shadow-lg shadow-dark/10 no-underline">
                                    View Profile
                                </a>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-span-full py-28 text-center bg-white rounded-[40px] border border-dashed border-border">
                            <div class="w-24 h-24 bg-primary-light rounded-full flex items-center justify-center mx-auto mb-8 text-primary/40">
                                <i data-lucide="search-x" class="w-12 h-12"></i>
                            </div>
                            <h3 class="text-2xl font-semibold text-dark mb-3 tracking-tight">No experts found</h3>
                            <p class="text-muted-dark font-semibold max-w-xs mx-auto opacity-70 mb-8">We couldn't find any repairers matching your current filters.</p>
                            <a href="${pageContext.request.contextPath}/" class="px-8 py-4 bg-primary text-white rounded-2xl font-black text-xs uppercase tracking-widest hover:scale-105 transition-all no-underline shadow-xl shadow-primary/20">Clear all filters</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>

    <script src="https://unpkg.com/lucide@latest"></script>
    <script>
        lucide.createIcons();

        // Premium Horizontal Category Scroll
        const scrollContainer = document.getElementById('category-scroll');
        const scrollLeftBtn = document.getElementById('scroll-left');
        const scrollRightBtn = document.getElementById('scroll-right');

        if (scrollContainer && scrollLeftBtn && scrollRightBtn) {
            const updateScrollButtons = () => {
                const isScrollable = scrollContainer.scrollWidth > scrollContainer.clientWidth;
                const scrollLeft = scrollContainer.scrollLeft;
                const maxScrollLeft = scrollContainer.scrollWidth - scrollContainer.clientWidth;

                scrollLeftBtn.style.display = (isScrollable && scrollLeft > 10) ? 'flex' : 'none';
                scrollRightBtn.style.display = (isScrollable && scrollLeft < maxScrollLeft - 10) ? 'flex' : 'none';
            };

            scrollLeftBtn.addEventListener('click', () => {
                scrollContainer.scrollBy({ left: -350, behavior: 'smooth' });
            });

            scrollRightBtn.addEventListener('click', () => {
                scrollContainer.scrollBy({ left: 350, behavior: 'smooth' });
            });

            scrollContainer.addEventListener('scroll', updateScrollButtons);
            window.addEventListener('resize', updateScrollButtons);
            
            // Initial check with a small delay for rendering
            setTimeout(updateScrollButtons, 100);
        }
    </script>
</body>
</html>

