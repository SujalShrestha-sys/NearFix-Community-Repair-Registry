<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-requests">
    <div class="page-head responsive-header">
        <div>
            <h2>Repair Registry</h2>
            <p>Monitor and manage platform repair activity (${totalRequests} active events)</p>
        </div>

        <div class="filter-controls">
            <form action="${pageContext.request.contextPath}/admin/requests" method="get" class="search-form-structured">
                <div class="search-input-group">
                    <i data-lucide="search" class="icon-sm"></i>
                    <input type="text" name="search" value="${search}" placeholder="Search registry..." class="search-field">
                    <c:if test="${not empty search}">
                        <a href="${pageContext.request.contextPath}/admin/requests?status=${selectedStatus}&categoryId=${selectedCategoryId}" class="clear-search">
                            <i data-lucide="x" style="width: 14px; height: 14px;"></i>
                        </a>
                    </c:if>
                </div>

                <select name="categoryId" class="form-input" style="width: auto; padding: 9px 36px 9px 14px;" onchange="this.form.submit()">
                    <option value="">All Disciplines</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat.categoryId}" ${selectedCategoryId == cat.categoryId ? 'selected' : ''}>${cat.name}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="status" value="${selectedStatus}">
            </form>
        </div>
    </div>

    <!-- Professional Status Navigation -->
    <div class="tab-bar scrollable-tabs" style="margin-bottom: 24px;">
        <a href="${pageContext.request.contextPath}/admin/requests?status=&search=${search}&categoryId=${selectedCategoryId}" 
           class="tab ${empty selectedStatus ? 'active' : ''}">Overview</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=PENDING&search=${search}&categoryId=${selectedCategoryId}" 
           class="tab ${selectedStatus == 'PENDING' ? 'active' : ''}">Pending</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=ACCEPTED&search=${search}&categoryId=${selectedCategoryId}" 
           class="tab ${selectedStatus == 'ACCEPTED' ? 'active' : ''}">Active</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=COMPLETED&search=${search}&categoryId=${selectedCategoryId}" 
           class="tab ${selectedStatus == 'COMPLETED' ? 'active' : ''}">Resolved</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=CANCELLED&search=${search}&categoryId=${selectedCategoryId}" 
           class="tab ${selectedStatus == 'CANCELLED' ? 'active' : ''}">Archived</a>
    </div>

    <div class="table-wrap responsive-table-wrap">
        <table class="responsive-table">
            <thead>
                <tr>
                    <th>Item Specification</th>
                    <th>Originator</th>
                    <th>Category</th>
                    <th>Lifecycle</th>
                    <th class="text-right">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="r" items="${requests}">
                    <tr>
                        <td data-label="Item Specification">
                            <div style="display: flex; align-items: center; gap: 12px">
                                <span class="urgency-dot ${r.urgency.toLowerCase()}"></span>
                                <div>
                                    <div style="font-weight: 700; color: var(--ink)">${r.itemName}</div>
                                    <div style="font-size: 11px; color: var(--ink3); font-weight: 600; margin-top: 2px;">
                                        ID-${r.requestId} • <fmt:formatDate value="${r.createdAt}" pattern="dd MMM" />
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td data-label="Originator">
                            <div style="font-weight: 600; color: var(--ink2)">${r.userName}</div>
                        </td>
                        <td data-label="Category">
                            <span class="badge badge-gray" style="font-size: 10px">${r.categoryName}</span>
                        </td>
                        <td data-label="Lifecycle">
                            <c:choose>
                                <c:when test="${r.status == 'PENDING'}"><span class="pill pill-warn">Pending</span></c:when>
                                <c:when test="${r.status == 'ACCEPTED'}"><span class="pill" style="background: var(--blue-light); color: var(--blue)">Active</span></c:when>
                                <c:when test="${r.status == 'COMPLETED'}"><span class="pill pill-success">Resolved</span></c:when>
                                <c:otherwise><span class="pill pill-danger">Archived</span></c:otherwise>
                            </c:choose>
                        </td>
                        <td data-label="Action" class="text-right">
                            <form action="${pageContext.request.contextPath}/admin/requests" method="post" onsubmit="return confirm('Permanently remove this entry?')">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="requestId" value="${r.requestId}">
                                <input type="hidden" name="search" value="${search}">
                                <input type="hidden" name="categoryId" value="${selectedCategoryId}">
                                <input type="hidden" name="status" value="${selectedStatus}">
                                <input type="hidden" name="page" value="${currentPage}">
                                
                                <button type="submit" class="icon-btn" style="color: var(--ink3); border: none; background: transparent; cursor: pointer;">
                                    <i data-lucide="trash-2" style="width: 18px; height: 18px"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty requests}">
            <div class="empty">
                <div class="empty-icon"><i data-lucide="clipboard-list"></i></div>
                <h3>No records found</h3>
                <p>Try adjusting your search or filters.</p>
            </div>
        </c:if>
    </div>

    <!-- Pagination -->
    <c:if test="${totalPages > 1}">
        <div style="display: flex; justify-content: center; gap: 8px; margin-top: 32px">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="${pageContext.request.contextPath}/admin/requests?page=${i}&search=${search}&categoryId=${selectedCategoryId}&status=${selectedStatus}" 
                   class="tab ${currentPage == i ? 'active' : ''}" style="padding: 8px 16px; text-decoration: none; border-radius: 10px;">
                    ${i}
                </a>
            </c:forEach>
        </div>
    </c:if>
</div>

<style>
    .urgency-dot { width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0; }
    .urgency-dot.high { background: #ef4444; }
    .urgency-dot.medium { background: #f59e0b; }
    .urgency-dot.low { background: #3b82f6; }

    .responsive-header { display: flex; justify-content: space-between; align-items: flex-end; gap: 20px; flex-wrap: wrap; margin-bottom: 24px; }
    .filter-controls { display: flex; gap: 12px; flex: 1; }
    .search-form-structured { display: flex; gap: 10px; align-items: center; flex: 1; }
    .search-input-group { 
        position: relative; display: flex; align-items: center; 
        background: var(--surface); border: 1.5px solid var(--border2); 
        border-radius: 10px; padding: 0 12px; width: 280px; transition: all 0.2s ease;
    }
    .search-input-group:focus-within { border-color: var(--g); box-shadow: 0 0 0 3px rgba(10,110,80,0.05); }
    .search-field { background: transparent; border: none; padding: 10px 8px; font-size: 14px; color: var(--ink); width: 100%; outline: none; }
    .icon-sm { width: 16px; height: 16px; color: var(--ink3); }
    .clear-search { color: var(--ink3); padding: 4px; border-radius: 4px; display: flex; align-items: center; text-decoration: none; }

    .scrollable-tabs { display: flex; overflow-x: auto; gap: 5px; scrollbar-width: none; border-bottom: none; -webkit-overflow-scrolling: touch; }
    .scrollable-tabs::-webkit-scrollbar { display: none; }
    .scrollable-tabs .tab { text-decoration: none; white-space: nowrap; }

    #admin-requests { padding: 0 2rem 2rem 2rem; max-width: 100%; overflow-x: hidden; }
    .responsive-table th { font-size: 11px; letter-spacing: 0.05em; }
    .text-right { text-align: right; }

    @media (max-width: 1024px) {
        .search-input-group { width: 220px; }
    }

    @media (max-width: 900px) {
        #admin-requests { padding: 0 1rem 2rem 1rem; }
        .responsive-header { flex-direction: column; align-items: stretch; gap: 16px; }
        .filter-controls { width: 100%; }
        .search-form-structured { flex-direction: column; align-items: stretch; width: 100%; }
        .search-input-group { width: 100%; }
        .form-input { width: 100% !important; }
        
        .responsive-table thead { display: none; }
        .responsive-table tr { display: block; border: 1px solid var(--surface3); border-radius: 12px; margin-bottom: 16px; padding: 8px; background: #fff; }
        .responsive-table td { display: flex; justify-content: space-between; align-items: center; padding: 12px 16px; border-bottom: 1px solid var(--surface2); width: 100%; box-sizing: border-box; }
        .responsive-table td:last-child { border-bottom: none; }
        .responsive-table td::before { content: attr(data-label); font-weight: 700; font-size: 11px; color: var(--ink3); text-transform: uppercase; }
        
        .tab-bar { margin: 0 -1rem 24px -1rem; padding: 4px 1rem; border-radius: 0; }
    }
</style>

<jsp:include page="layout/footer.jsp" />
