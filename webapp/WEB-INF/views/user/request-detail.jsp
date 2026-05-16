<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Overview - NearFix</title>
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
        .glass-card { background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(12px); border: 1px solid rgba(227, 236, 231, 0.5); }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <!-- Header -->
            <div class="flex flex-col md:flex-row md:items-center justify-between mb-8 gap-4">
                <div class="flex items-center gap-4">
                    <a href="${pageContext.request.contextPath}/user/my-requests" class="w-10 h-10 rounded-xl bg-white border border-border flex items-center justify-center text-muted-dark hover:text-primary hover:border-primary transition-all">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M15 19l-7-7 7-7"></path></svg>
                    </a>
                    <div>
                        <h1 class="text-2xl font-extrabold text-dark tracking-tight">Request Overview</h1>
                        <p class="text-sm text-muted-dark font-medium">Request #${repairRequest.requestId} &bull; ${repairRequest.categoryName}</p>
                    </div>
                </div>
                <div class="flex items-center gap-3">
                    <span class="px-4 py-1.5 rounded-full text-xs font-black uppercase tracking-widest ${repairRequest.status == 'PENDING' ? 'bg-blue-50 text-blue-500' : repairRequest.status == 'IN_PROGRESS' ? 'bg-primary-light text-primary' : 'bg-green-50 text-green-600'}">
                        ${repairRequest.status}
                    </span>
                    <c:if test="${repairRequest.urgency == 'URGENT'}">
                        <span class="px-4 py-1.5 rounded-full text-xs font-black uppercase tracking-widest bg-yellow-light text-yellow">Urgent</span>
                    </c:if>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Left Column: Request Details -->
                <div class="lg:col-span-2 space-y-8">
                    <!-- Progress Card -->
                    <div class="bg-white rounded-[32px] border border-border p-8 md:p-10 shadow-sm overflow-hidden relative">
                         <div class="absolute top-0 right-0 w-48 h-48 bg-primary/5 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2"></div>
                         
                         <h3 class="text-lg font-bold text-dark mb-10 relative z-10">Repair Progress</h3>
                         
                         <div class="flex items-start justify-between relative px-2 max-w-2xl mx-auto md:mx-0">
                            <!-- Progress Line -->
                            <div class="absolute top-[18px] left-10 right-10 h-[3px] bg-background z-0">
                                <c:set var="progWidth" value="${repairRequest.status == 'PENDING' ? 'w-0' : repairRequest.status == 'ACCEPTED' ? 'w-1/3' : repairRequest.status == 'IN_PROGRESS' ? 'w-2/3' : repairRequest.status == 'COMPLETED' ? 'w-full' : 'w-0'}" />
                                <div class="h-full bg-primary rounded-full transition-all duration-1000 ${progWidth}"></div>
                            </div>

                            <!-- Steps -->
                            <c:forEach var="step" items="Pending,Accepted,In Progress,Done" varStatus="vs">
                                <c:set var="isReached" value="${(vs.index == 0 && (repairRequest.status == 'PENDING' || repairRequest.status == 'ACCEPTED' || repairRequest.status == 'IN_PROGRESS' || repairRequest.status == 'COMPLETED')) || 
                                                               (vs.index == 1 && (repairRequest.status == 'ACCEPTED' || repairRequest.status == 'IN_PROGRESS' || repairRequest.status == 'COMPLETED')) || 
                                                               (vs.index == 2 && (repairRequest.status == 'IN_PROGRESS' || repairRequest.status == 'COMPLETED')) || 
                                                               (vs.index == 3 && (repairRequest.status == 'COMPLETED'))}" />
                                <c:set var="isCurrent" value="${(vs.index == 0 && repairRequest.status == 'PENDING') || 
                                                               (vs.index == 1 && repairRequest.status == 'ACCEPTED') || 
                                                               (vs.index == 2 && repairRequest.status == 'IN_PROGRESS') || 
                                                               (vs.index == 3 && repairRequest.status == 'COMPLETED')}" />
                                
                                <div class="flex flex-col items-center gap-3 z-10 flex-1">
                                    <div class="w-10 h-10 rounded-full flex items-center justify-center text-xs font-bold transition-all duration-500 ${isReached ? 'bg-primary border-4 border-primary-light text-white ring-4 ring-primary/5' : 'bg-white border-2 border-border text-muted'} ${isCurrent ? 'scale-110 shadow-lg shadow-primary/20' : ''}">
                                        <c:choose>
                                            <c:when test="${isReached && !isCurrent}">
                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                                            </c:when>
                                            <c:otherwise>${vs.index + 1}</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <span class="text-[11px] uppercase tracking-widest ${isReached ? 'font-black text-dark' : 'font-bold text-muted'}">${step}</span>
                                </div>
                            </c:forEach>
                         </div>
                    </div>

                    <!-- Details Card -->
                    <div class="bg-white rounded-[32px] border border-border p-8 md:p-10 shadow-sm">
                        <div class="flex items-center gap-3 mb-8">
                            <div class="w-1.5 h-6 bg-primary rounded-full"></div>
                            <h3 class="text-xl font-bold text-dark">Item Details</h3>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                            <div class="space-y-6">
                                <div>
                                    <label class="text-[11px] font-black uppercase tracking-widest text-muted mb-2 block">Item Name</label>
                                    <p class="text-lg font-bold text-dark">${repairRequest.itemName}</p>
                                </div>
                                <div>
                                    <label class="text-[11px] font-black uppercase tracking-widest text-muted mb-2 block">Category</label>
                                    <div class="flex items-center gap-2">
                                        <div class="w-8 h-8 rounded-lg bg-primary-light flex items-center justify-center text-primary">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                                        </div>
                                        <p class="font-bold text-dark">${repairRequest.categoryName}</p>
                                    </div>
                                </div>
                                <div>
                                    <label class="text-[11px] font-black uppercase tracking-widest text-muted mb-2 block">Location</label>
                                    <div class="flex items-center gap-2 text-dark font-semibold">
                                        <svg class="w-4 h-4 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                                        ${repairRequest.location}
                                    </div>
                                </div>
                            </div>
                            <div class="space-y-6">
                                <div>
                                    <label class="text-[11px] font-black uppercase tracking-widest text-muted mb-2 block">Posted Date</label>
                                    <p class="font-bold text-dark">${repairRequest.createdAt}</p>
                                </div>
                                <div>
                                    <label class="text-[11px] font-black uppercase tracking-widest text-muted mb-2 block">Description</label>
                                    <p class="text-sm text-muted-dark leading-relaxed font-medium bg-background/50 p-4 rounded-2xl border border-border/50 italic">
                                        "${repairRequest.description}"
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Repairer Profile -->
                <div class="space-y-8">
                    <c:choose>
                        <c:when test="${not empty repairer}">
                            <!-- Assigned Expert Card -->
                            <div class="bg-white rounded-[32px] border border-border p-8 shadow-sm relative overflow-hidden group">
                                <div class="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full blur-2xl -translate-y-1/2 translate-x-1/2 group-hover:scale-150 transition-transform duration-700"></div>
                                
                                <div class="flex flex-col items-center text-center mb-8 relative z-10">
                                    <div class="w-20 h-20 rounded-[24px] bg-primary-light flex items-center justify-center text-primary text-2xl font-black uppercase mb-4 shadow-lg shadow-primary/10">
                                        ${repairer.name.substring(0, 2)}
                                    </div>
                                    <h3 class="text-xl font-black text-dark mb-1">${repairer.name}</h3>
                                    <div class="flex items-center gap-1 text-yellow mb-4">
                                        <c:forEach begin="1" end="5" var="i">
                                            <svg class="w-3.5 h-3.5 ${i <= repairer.rating ? 'fill-current' : 'fill-border text-border'}" viewBox="0 0 20 20">
                                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                            </svg>
                                        </c:forEach>
                                        <span class="text-[11px] font-black text-dark ml-1">${repairer.rating > 0 ? repairer.rating : 'New'}</span>
                                    </div>
                                    <span class="px-4 py-1 bg-green-50 text-green-600 rounded-full text-[10px] font-black uppercase tracking-wider">Assigned Expert</span>
                                </div>

                                <div class="space-y-4 mb-8">
                                    <div class="flex items-center justify-between p-3 rounded-2xl bg-background/50 border border-border/50">
                                        <span class="text-[11px] font-bold text-muted-dark">Experience</span>
                                        <span class="text-xs font-black text-dark">${repairer.yearsOfExperience} Years</span>
                                    </div>
                                    <div class="flex items-center justify-between p-3 rounded-2xl bg-background/50 border border-border/50">
                                        <span class="text-[11px] font-bold text-muted-dark">Specialty</span>
                                        <span class="text-xs font-black text-dark">${repairer.specialization}</span>
                                    </div>
                                    <div class="flex items-center justify-between p-3 rounded-2xl bg-background/50 border border-border/50">
                                        <span class="text-[11px] font-bold text-muted-dark">Service Area</span>
                                        <span class="text-xs font-black text-dark">${repairer.serviceArea}</span>
                                    </div>
                                </div>

                                <a href="${pageContext.request.contextPath}/repairer-profile?id=${repairer.userId}" class="block w-full text-center py-4 bg-dark text-white rounded-2xl font-black text-xs uppercase tracking-widest hover:bg-primary transition-all shadow-xl shadow-dark/10">View Full Profile</a>
                            </div>

                            <!-- Rating Prompt (Only if Completed) -->
                            <c:if test="${repairRequest.status == 'COMPLETED'}">
                                <div class="bg-yellow-light/50 rounded-[32px] border border-yellow/20 p-8 text-center">
                                    <div class="w-12 h-12 bg-yellow rounded-2xl flex items-center justify-center text-white mx-auto mb-4 shadow-lg shadow-yellow/20">
                                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    </div>
                                    <h4 class="text-lg font-bold text-dark mb-2">How was the service?</h4>
                                    <p class="text-xs text-muted-dark mb-6">Your feedback helps the community find the best experts.</p>
                                    <button class="w-full py-3 bg-white border border-yellow text-yellow rounded-xl font-bold text-xs uppercase tracking-widest hover:bg-yellow hover:text-white transition-all">Rate Expert</button>
                                </div>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <!-- Awaiting Expert Card -->
                            <div class="bg-white rounded-[32px] border-2 border-dashed border-border p-10 flex flex-col items-center text-center">
                                <div class="w-16 h-16 bg-background rounded-full flex items-center justify-center mb-6">
                                    <svg class="w-8 h-8 text-muted animate-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                </div>
                                <h3 class="text-xl font-bold text-dark mb-2">Awaiting Expert</h3>
                                <p class="text-sm text-muted-dark leading-relaxed">We're notifying local experts about your request. You'll see their profile here once someone accepts.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
    </div>

</body>
</html>
