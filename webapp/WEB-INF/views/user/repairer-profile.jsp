<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${repairer.name} - Expert Profile</title>
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
            }
          }
        }
      }
    </script>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <!-- Breadcrumb -->
            <nav class="mb-6">
                <a href="${pageContext.request.contextPath}/repairers" class="text-sm font-bold text-muted-dark hover:text-primary transition-colors flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M15 19l-7-7 7-7"></path>
                    </svg>
                    Back to experts
                </a>
            </nav>

            <div class="max-w-5xl">
                <!-- Profile Header Card -->
                <div class="bg-white rounded-[32px] border border-border p-8 md:p-10 mb-8 shadow-sm relative overflow-hidden">
                    <!-- Background Accent -->
                    <div class="absolute top-0 right-0 w-64 h-64 bg-primary/5 rounded-full blur-[80px] -translate-y-1/2 translate-x-1/3"></div>

                    <div class="relative z-10 flex flex-col md:flex-row items-start md:items-center gap-8">
                        <!-- Avatar -->
                        <div class="w-24 h-24 rounded-[28px] bg-primary-light flex items-center justify-center text-primary text-3xl font-extrabold uppercase shadow-lg shadow-primary/10">
                            ${repairer.name.substring(0, 2)}
                        </div>

                        <!-- Info -->
                        <div class="flex-1">
                            <div class="flex flex-wrap items-center gap-3 mb-2">
                                <h1 class="text-3xl font-extrabold text-dark tracking-tight">${repairer.name}</h1>
                                <c:if test="${repairer.verified}">
                                    <div class="flex items-center gap-1.5 px-3 py-1 bg-green-50 rounded-full">
                                        <svg class="w-3.5 h-3.5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                                        </svg>
                                        <span class="text-[11px] font-black text-green-600 uppercase tracking-wider">Verified Expert</span>
                                    </div>
                                </c:if>
                            </div>
                            
                            <p class="text-lg font-bold text-muted-dark mb-4">${repairer.specialization} &bull; ${repairer.yearsOfExperience} Years of Professional Experience</p>

                            <div class="flex flex-wrap items-center gap-6">
                                <div class="flex items-center gap-2">
                                    <div class="flex items-center gap-1 text-yellow">
                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                        </svg>
                                        <span class="text-lg font-extrabold text-dark">${repairer.rating > 0 ? repairer.rating : 'New'}</span>
                                    </div>
                                    <span class="text-sm font-bold text-muted-dark">Community Rating</span>
                                </div>
                                <div class="w-px h-6 bg-border hidden md:block"></div>
                                <div class="flex items-center gap-2 text-muted-dark">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    </svg>
                                    <span class="text-lg font-bold text-dark">${repairer.serviceArea}</span>
                                </div>
                            </div>
                        </div>

                        <!-- Action -->
                        <div class="shrink-0 w-full md:w-auto">
                            <a href="${pageContext.request.contextPath}/user/post-request?prefillExpert=${repairer.userId}" 
                               class="block text-center px-10 py-4 bg-primary text-white font-black text-sm rounded-2xl shadow-xl shadow-primary/20 hover:scale-[1.02] active:scale-95 transition-all">
                                Request a Repair
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Content Grid -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Bio & Details -->
                    <div class="lg:col-span-2 space-y-8">
                        <div class="bg-white rounded-[32px] border border-border p-8 shadow-sm">
                            <h2 class="text-xl font-extrabold text-dark mb-4">About the Expert</h2>
                            <p class="text-muted-dark font-medium leading-relaxed">
                                <c:choose>
                                    <c:when test="${not empty repairer.expertise}">
                                        ${repairer.expertise}
                                    </c:when>
                                    <c:otherwise>
                                        No detailed bio provided yet. This expert specializes in ${repairer.specialization} and has ${repairer.yearsOfExperience} years of experience in the field.
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        
                        <!-- Skills / Categories -->
                        <div class="bg-white rounded-[32px] border border-border p-8 shadow-sm">
                            <h2 class="text-xl font-extrabold text-dark mb-4">Core Specializations</h2>
                            <div class="flex flex-wrap gap-3">
                                <span class="px-4 py-2 bg-primary-light text-primary font-bold text-sm rounded-xl border border-primary/10">${repairer.specialization}</span>
                                <!-- Optional: Other skills can be added here -->
                            </div>
                        </div>
                    </div>

                    <!-- Side Stats -->
                    <div class="space-y-6">
                        <div class="bg-white rounded-[32px] border border-border p-8 shadow-sm">
                            <h3 class="text-sm font-black uppercase tracking-widest text-muted-dark mb-6">Expertise Stats</h3>
                            <div class="space-y-6">
                                <div>
                                    <div class="flex justify-between items-end mb-2">
                                        <span class="text-sm font-bold text-muted-dark">Experience</span>
                                        <span class="text-lg font-black text-dark">${repairer.yearsOfExperience} Years</span>
                                    </div>
                                    <div class="h-2 bg-background rounded-full overflow-hidden">
                                        <c:set var="expWidthClass" value="${repairer.yearsOfExperience <= 2 ? 'w-1/5' : repairer.yearsOfExperience <= 4 ? 'w-2/5' : repairer.yearsOfExperience <= 6 ? 'w-3/5' : repairer.yearsOfExperience <= 8 ? 'w-4/5' : 'w-full'}" />
                                        <div class="h-full bg-primary rounded-full ${expWidthClass}"></div>
                                    </div>
                                </div>
                                <div class="pt-4 border-t border-border">
                                    <div class="flex items-center gap-3">
                                        <div class="w-10 h-10 rounded-xl bg-primary-light flex items-center justify-center text-primary">
                                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <p class="text-[10px] font-black uppercase tracking-widest text-muted">Verification</p>
                                            <p class="text-sm font-bold text-dark">Identity Verified</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</body>
</html>
