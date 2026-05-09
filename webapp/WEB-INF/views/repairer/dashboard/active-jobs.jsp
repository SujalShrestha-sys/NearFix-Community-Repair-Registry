<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Active Jobs Card -->
<div class="bg-white rounded-[20px] border border-border shadow-stat pt-[26px] pr-[26px] pb-[26px] pl-[26px]">
    <div class="flex items-center justify-between mb-5">
        <span class="text-[17px] font-bold text-dark">Active Jobs</span>
        <a href="${pageContext.request.contextPath}/repairer/my-requests?status=IN_PROGRESS" class="text-[13px] font-medium text-nav border-[1.5px] border-border-light rounded-[20px] py-1.5 px-4 bg-transparent cursor-pointer no-underline">View all</a>
    </div>

    <c:choose>
        <c:when test="${not empty activeJobs}">
            <c:forEach var="job" items="${activeJobs}" varStatus="status">
                <div class="bg-white border-[1.5px] border-border rounded-[16px] pt-5 pr-[22px] pb-5 pl-[22px] mb-4 last:mb-0">
                    <div class="flex items-start justify-between mb-[18px]">
                        <div>
                            <div class="text-[15.5px] font-bold text-dark mb-[7px]">${job.itemName}</div>
                            <div class="flex items-center gap-2 text-[12.5px] text-muted-dark">
                                <span class="bg-primary-light text-primary text-[11.5px] font-semibold rounded-[20px] py-[3px] px-[11px] inline-block">${job.categoryName}</span>
                                <span>ID: #${job.requestId}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Progress Tracker -->
                    <div class="flex items-start justify-between mb-5 relative px-1">
                        <div class="absolute top-4 left-[26px] right-[26px] h-[2.5px] bg-border z-0">
                            <div class="h-full bg-primary rounded-[2px]" style="width: ${job.status == 'PENDING' ? '0%' : job.status == 'ACCEPTED' ? '33%' : job.status == 'IN_PROGRESS' ? '66%' : '100%'}"></div>
                        </div>

                        <!-- Step 1: Pending -->
                        <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                            <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold ${job.status == 'PENDING' || job.status == 'ACCEPTED' || job.status == 'IN_PROGRESS' || job.status == 'COMPLETED' ? 'bg-white border-[2.5px] border-primary text-primary' : 'bg-background border-2 border-border-light text-muted'}">
                                <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                            </div>
                            <span class="text-[11.5px] font-bold text-primary text-center whitespace-nowrap">Pending</span>
                        </div>

                        <!-- Step 2: Accepted -->
                        <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                            <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold ${job.status == 'ACCEPTED' || job.status == 'IN_PROGRESS' || job.status == 'COMPLETED' ? 'bg-white border-[2.5px] border-primary text-primary' : 'bg-background border-2 border-border-light text-muted'}">
                                <c:choose>
                                    <c:when test="${job.status == 'ACCEPTED' || job.status == 'IN_PROGRESS' || job.status == 'COMPLETED'}">
                                        <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                                    </c:when>
                                    <c:otherwise>2</c:otherwise>
                                </c:choose>
                            </div>
                            <span class="text-[11.5px] ${job.status == 'ACCEPTED' || job.status == 'IN_PROGRESS' || job.status == 'COMPLETED' ? 'font-bold text-primary' : 'font-medium text-muted-dark'} text-center whitespace-nowrap">Accepted</span>
                        </div>

                        <!-- Step 3: In Progress -->
                        <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                            <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold ${job.status == 'IN_PROGRESS' || job.status == 'COMPLETED' ? 'bg-white border-[2.5px] border-primary text-primary' : 'bg-background border-2 border-border-light text-muted'}">
                                <c:choose>
                                    <c:when test="${job.status == 'IN_PROGRESS' || job.status == 'COMPLETED'}">
                                        <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                                    </c:when>
                                    <c:otherwise>3</c:otherwise>
                                </c:choose>
                            </div>
                            <span class="text-[11.5px] ${job.status == 'IN_PROGRESS' || job.status == 'COMPLETED' ? 'font-bold text-primary' : 'font-medium text-muted-dark'} text-center whitespace-nowrap">In Progress</span>
                        </div>

                        <!-- Step 4: Done -->
                        <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                            <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold ${job.status == 'COMPLETED' ? 'bg-white border-[2.5px] border-primary text-primary' : 'bg-background border-2 border-border-light text-muted'}">
                                <c:choose>
                                    <c:when test="${job.status == 'COMPLETED'}">
                                        <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                                    </c:when>
                                    <c:otherwise>4</c:otherwise>
                                </c:choose>
                            </div>
                            <span class="text-[11.5px] ${job.status == 'COMPLETED' ? 'font-bold text-primary' : 'font-medium text-muted-dark'} text-center whitespace-nowrap">Done</span>
                        </div>
                    </div>

                    <div class="flex justify-end">
                        <form action="${pageContext.request.contextPath}/repairer/dashboard" method="POST">
                            <input type="hidden" name="action" value="complete-request">
                            <input type="hidden" name="requestId" value="${job.requestId}">
                            <button type="submit" class="bg-primary text-white border-none rounded-[24px] py-3 px-[26px] text-sm font-semibold font-inter cursor-pointer tracking-[0.01em] hover:bg-opacity-90 transition-all">Mark Complete ✓</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="bg-white border-[1.5px] border-dashed border-border rounded-[16px] py-12 flex flex-col items-center justify-center text-center">
                <div class="w-16 h-16 bg-primary-light rounded-full flex items-center justify-center mb-4">
                    <svg class="w-8 h-8 text-primary" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                        <polyline points="22 4 12 14.01 9 11.01" />
                    </svg>
                </div>
                <div class="text-[17px] font-bold text-dark mb-1">No active jobs</div>
                <p class="text-sm text-muted-dark max-w-[240px]">You don't have any jobs in progress right now. Browse available requests to find work!</p>
                <a href="${pageContext.request.contextPath}/repairer/available-requests" class="mt-5 text-primary font-bold text-sm hover:underline">Find Jobs →</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
