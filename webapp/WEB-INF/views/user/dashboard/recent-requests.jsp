<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- RECENT REQUESTS -->
<div class="bg-white rounded-2xl border border-border p-6 shadow-sm flex flex-col h-full">
    <div class="flex items-center justify-between mb-6">
        <div>
            <h3 class="text-[17px] font-bold text-dark">Recent Requests</h3>
            <p class="text-[12px] text-muted-dark mt-0.5">Your latest repair jobs</p>
        </div>
        <a href="${pageContext.request.contextPath}/user/my-requests" class="text-[13px] font-semibold text-nav border border-border rounded-xl py-2 px-4 hover:bg-primary-hover transition-colors no-underline">View all</a>
    </div>

    <div class="flex flex-col gap-4 flex-1 overflow-y-auto max-h-[500px] pr-1">
        <c:choose>
            <c:when test="${not empty requests}">
                <c:forEach var="req" items="${requests}" end="2">
                    <div class="bg-white border border-border rounded-2xl p-5 hover:border-primary/30 transition-all group">
                        <div class="flex items-start justify-between mb-4">
                            <div>
                                <h4 class="text-[15.5px] font-bold text-dark group-hover:text-primary transition-colors">${req.itemName}</h4>
                                <div class="flex items-center gap-2 mt-2">
                                    <span class="px-2.5 py-0.5 rounded-full text-[10px] font-bold uppercase ${req.status == 'PENDING' ? 'bg-blue-50 text-blue-500' : req.status == 'IN_PROGRESS' ? 'bg-primary-light text-primary' : 'bg-green-50 text-green-600'}">
                                        ${req.status}
                                    </span>
                                    <c:if test="${req.urgency == 'URGENT'}">
                                        <span class="px-2.5 py-0.5 rounded-full text-[10px] font-bold uppercase bg-yellow-light text-yellow">Urgent</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <!-- Progress Steps -->
                        <div class="flex items-start justify-between relative mt-6 px-2">
                            <!-- Line -->
                            <div class="absolute top-[15px] left-8 right-8 h-[2px] bg-border z-0">
                                <div class="h-full bg-primary rounded-full transition-all duration-700" 
                                     style="width: ${req.status == 'PENDING' ? '0%' : req.status == 'ACCEPTED' ? '33%' : req.status == 'IN_PROGRESS' ? '66%' : '100%'}"></div>
                            </div>

                            <!-- Step 1 -->
                            <div class="flex flex-col items-center gap-2 z-[1] flex-1">
                                <div class="w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-bold ${req.status == 'PENDING' || req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS' || req.status == 'COMPLETED' ? 'bg-primary border-4 border-primary-light text-white' : 'bg-white border-2 border-border text-muted'}">
                                    <c:choose>
                                        <c:when test="${req.status != 'PENDING'}">
                                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        </c:when>
                                        <c:otherwise>1</c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-[10.5px] font-bold text-dark">Pending</span>
                            </div>

                            <!-- Step 2 -->
                            <div class="flex flex-col items-center gap-2 z-[1] flex-1">
                                <div class="w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-bold ${req.status == 'ACCEPTED' || req.status == 'IN_PROGRESS' || req.status == 'COMPLETED' ? 'bg-primary border-4 border-primary-light text-white' : 'bg-white border-2 border-border text-muted'}">
                                    <c:choose>
                                        <c:when test="${req.status == 'IN_PROGRESS' || req.status == 'COMPLETED'}">
                                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        </c:when>
                                        <c:otherwise>2</c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-[10.5px] font-medium text-muted-dark">Accepted</span>
                            </div>

                            <!-- Step 3 -->
                            <div class="flex flex-col items-center gap-2 z-[1] flex-1">
                                <div class="w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-bold ${req.status == 'IN_PROGRESS' || req.status == 'COMPLETED' ? 'bg-primary border-4 border-primary-light text-white' : 'bg-white border-2 border-border text-muted'}">
                                    <c:choose>
                                        <c:when test="${req.status == 'COMPLETED'}">
                                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        </c:when>
                                        <c:otherwise>3</c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-[10.5px] font-medium text-muted-dark">In Progress</span>
                            </div>

                            <!-- Step 4 -->
                            <div class="flex flex-col items-center gap-2 z-[1] flex-1">
                                <div class="w-8 h-8 rounded-full flex items-center justify-center text-[11px] font-bold ${req.status == 'COMPLETED' ? 'bg-primary border-4 border-primary-light text-white' : 'bg-white border-2 border-border text-muted'}">
                                    4
                                </div>
                                <span class="text-[10.5px] font-medium text-muted-dark">Done</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="flex-1 flex flex-col items-center justify-center text-center py-12 px-4 border-2 border-dashed border-border rounded-2xl">
                    <div class="w-16 h-16 bg-muted-light rounded-full flex items-center justify-center mb-4">
                        <svg class="w-8 h-8 text-muted" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                    </div>
                    <h4 class="text-dark font-bold mb-1">No requests yet</h4>
                    <p class="text-sm text-muted-dark max-w-[200px]">You haven't posted any repair requests yet. Get started by posting your first repair!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
