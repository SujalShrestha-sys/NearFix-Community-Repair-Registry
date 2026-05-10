<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="layout/header.jsp" />

<div class="registry-canvas">
    <!-- Sophisticated Minimalist Header -->
    <div class="registry-header">
        <div class="header-main">
            <h1 class="registry-title">Repair Registry</h1>
            <div class="registry-meta">
                <span class="meta-item"><i data-lucide="activity" class="meta-icon"></i> ${totalRequests} active events</span>
                <span class="meta-divider"></span>
                <span class="meta-item">Platform Governance</span>
            </div>
        </div>

        <div class="registry-actions">
            <form action="${pageContext.request.contextPath}/admin/requests" method="get" class="minimal-filter-form">
                <div class="search-entry">
                    <i data-lucide="search" class="search-icon"></i>
                    <input type="text" name="search" value="${search}" placeholder="Search registry..." class="minimal-input">
                </div>
                
                <select name="categoryId" class="minimal-select" onchange="this.form.submit()">
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
    <div class="status-nav">
        <a href="${pageContext.request.contextPath}/admin/requests?status=&search=${search}&categoryId=${selectedCategoryId}" 
           class="nav-link ${empty selectedStatus ? 'active' : ''}">Overview</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=PENDING&search=${search}&categoryId=${selectedCategoryId}" 
           class="nav-link ${selectedStatus == 'PENDING' ? 'active' : ''}">Pending</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=ACCEPTED&search=${search}&categoryId=${selectedCategoryId}" 
           class="nav-link ${selectedStatus == 'ACCEPTED' ? 'active' : ''}">Active</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=COMPLETED&search=${search}&categoryId=${selectedCategoryId}" 
           class="nav-link ${selectedStatus == 'COMPLETED' ? 'active' : ''}">Resolved</a>
        <a href="${pageContext.request.contextPath}/admin/requests?status=CANCELLED&search=${search}&categoryId=${selectedCategoryId}" 
           class="nav-link ${selectedStatus == 'CANCELLED' ? 'active' : ''}">Archived</a>
    </div>

    <div class="registry-table-container">
        <table class="registry-table">
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
                    <tr class="registry-row">
                        <td>
                            <div class="item-id-group">
                                <span class="urgency-dot ${r.urgency.toLowerCase()}"></span>
                                <div class="item-main-info">
                                    <span class="item-name-styled">${r.itemName}</span>
                                    <span class="item-serial">ID-${r.requestId} • <fmt:formatDate value="${r.createdAt}" pattern="dd MMM" /></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="originator-info">
                                <span class="originator-name">${r.userName}</span>
                            </div>
                        </td>
                        <td>
                            <span class="minimal-category">${r.categoryName}</span>
                        </td>
                        <td>
                            <span class="lifecycle-badge ${r.status.toLowerCase()}">${r.status}</span>
                        </td>
                        <td class="text-right">
                            <form action="${pageContext.request.contextPath}/admin/requests" method="post" onsubmit="return confirm('Permanently remove this entry?')">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="requestId" value="${r.requestId}">
                                <input type="hidden" name="search" value="${search}">
                                <input type="hidden" name="categoryId" value="${selectedCategoryId}">
                                <input type="hidden" name="status" value="${selectedStatus}">
                                <input type="hidden" name="page" value="${currentPage}">
                                
                                <button type="submit" class="registry-action-btn">
                                    <i data-lucide="trash-2"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty requests}">
            <div class="registry-empty">
                <p>No records found in the specified parameters.</p>
            </div>
        </c:if>
    </div>

    <!-- Minimalist Pagination -->
    <c:if test="${totalPages > 1}">
        <div class="registry-pagination">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="${pageContext.request.contextPath}/admin/requests?page=${i}&search=${search}&categoryId=${selectedCategoryId}&status=${selectedStatus}" 
                   class="page-num ${currentPage == i ? 'active' : ''}">
                    ${i}
                </a>
            </c:forEach>
        </div>
    </c:if>
</div>

<style>
    /* Premium Minimalist Registry Style */
    .registry-canvas { padding: 0 2rem 3rem 2rem; max-width: 1300px; margin: 0 auto; }
    
    .registry-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2.5rem; }
    .registry-title { font-size: 1.75rem; font-weight: 700; letter-spacing: -0.02em; color: var(--ink1); margin-bottom: 0.5rem; }
    .registry-meta { display: flex; align-items: center; gap: 12px; font-size: 0.8rem; font-weight: 600; color: var(--ink3); text-transform: uppercase; letter-spacing: 0.05em; }
    .meta-divider { width: 1px; height: 12px; background: var(--surface3); }
    .meta-icon { width: 14px; height: 14px; }

    .minimal-filter-form { display: flex; gap: 12px; }
    .search-entry { position: relative; }
    .search-icon { position: absolute; left: 12px; top: 50%; transform: translateY(-50%); width: 14px; height: 14px; color: var(--ink3); }
    .minimal-input { background: var(--surface1); border: 1px solid var(--surface3); border-radius: 8px; padding: 10px 12px 10px 36px; font-size: 13px; width: 240px; color: var(--ink1); }
    .minimal-select { background: var(--surface1); border: 1px solid var(--surface3); border-radius: 8px; padding: 10px 12px; font-size: 13px; color: var(--ink2); font-weight: 600; cursor: pointer; }

    .status-nav { display: flex; gap: 24px; border-bottom: 1px solid var(--surface3); margin-bottom: 2rem; }
    .nav-link { padding: 12px 0; font-size: 0.85rem; font-weight: 700; color: var(--ink3); text-decoration: none; position: relative; transition: color 0.2s; }
    .nav-link.active { color: var(--ink1); }
    .nav-link.active::after { content: ''; position: absolute; bottom: -1px; left: 0; width: 100%; height: 2px; background: var(--ink1); }

    .registry-table-container { background: #fff; border: 1px solid var(--surface3); border-radius: 12px; overflow: hidden; }
    .registry-table { width: 100%; border-collapse: collapse; }
    .registry-table th { text-align: left; padding: 16px 20px; font-size: 0.7rem; font-weight: 800; color: var(--ink3); text-transform: uppercase; letter-spacing: 0.1em; background: var(--surface2); border-bottom: 1px solid var(--surface3); }
    .registry-table td { padding: 18px 20px; border-bottom: 1px solid var(--surface3); vertical-align: middle; }
    .registry-row:last-child td { border-bottom: none; }
    .registry-row:hover { background: rgba(0,0,0,0.01); }

    .item-id-group { display: flex; align-items: center; gap: 14px; }
    .urgency-dot { width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0; }
    .urgency-dot.high { background: #ef4444; }
    .urgency-dot.medium { background: #f59e0b; }
    .urgency-dot.low { background: #3b82f6; }

    .item-name-styled { display: block; font-weight: 700; font-size: 0.9rem; color: var(--ink1); }
    .item-serial { display: block; font-size: 0.75rem; color: var(--ink3); font-weight: 500; margin-top: 2px; }

    .originator-name { font-size: 0.85rem; font-weight: 600; color: var(--ink2); }
    .minimal-category { font-size: 0.75rem; font-weight: 700; color: var(--ink3); background: var(--surface2); padding: 4px 8px; border-radius: 4px; }

    .lifecycle-badge { font-size: 0.65rem; font-weight: 800; text-transform: uppercase; letter-spacing: 0.05em; padding: 4px 8px; border-radius: 4px; display: inline-block; }
    .lifecycle-badge.pending { color: #2563eb; background: rgba(37, 99, 235, 0.08); }
    .lifecycle-badge.accepted { color: #7c3aed; background: rgba(124, 58, 237, 0.08); }
    .lifecycle-badge.completed { color: #16a34a; background: rgba(22, 163, 74, 0.08); }
    .lifecycle-badge.cancelled { color: #dc2626; background: rgba(220, 38, 38, 0.08); }

    .registry-action-btn { background: transparent; border: none; color: var(--ink3); cursor: pointer; padding: 6px; transition: color 0.2s; }
    .registry-action-btn:hover { color: #ef4444; }

    .registry-pagination { display: flex; justify-content: center; gap: 8px; margin-top: 2rem; }
    .page-num { width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; border-radius: 6px; font-size: 0.8rem; font-weight: 700; text-decoration: none; color: var(--ink3); border: 1px solid var(--surface3); }
    .page-num.active { background: var(--ink1); color: #fff; border-color: var(--ink1); }

    .registry-empty { padding: 60px; text-align: center; color: var(--ink3); font-size: 0.9rem; font-weight: 500; }

    .text-right { text-align: right; }

    @media (max-width: 900px) {
        .registry-header { flex-direction: column; align-items: flex-start; gap: 20px; }
        .registry-table thead { display: none; }
        .registry-table td { display: flex; justify-content: space-between; align-items: center; padding: 12px 20px; border-bottom: 1px solid var(--surface2); }
        .registry-table td::before { content: attr(data-label); font-weight: 800; font-size: 0.7rem; color: var(--ink3); text-transform: uppercase; }
        .item-id-group { justify-content: flex-end; text-align: right; }
        .minimal-input { width: 100%; }
    }
</style>

<jsp:include page="layout/footer.jsp" />
