<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-users">
    <div class="page-head responsive-header">
        <div>
            <h2>Manage Users</h2>
            <p>View and manage all ${totalUsers} platform accounts</p>
        </div>
        
        <!-- Highly Structured Search & Filter Bar -->
        <div class="filter-controls">
            <form action="${pageContext.request.contextPath}/admin/users" method="get" class="search-form-structured">
                <div class="search-input-group">
                    <i data-lucide="search" class="icon-sm"></i>
                    <input type="text" name="search" value="${search}" placeholder="Search identity..." class="search-field">
                    <c:if test="${not empty search}">
                        <a href="${pageContext.request.contextPath}/admin/users?role=${selectedRole}" class="clear-search" title="Clear Search">
                            <i data-lucide="x" style="width: 14px; height: 14px;"></i>
                        </a>
                    </c:if>
                </div>
                <input type="hidden" name="role" value="${selectedRole}">
                <button type="submit" class="btn btn-primary search-submit">Search</button>
            </form>
        </div>
    </div>

    <!-- Active Filter Summary -->
    <c:if test="${not empty search or not empty selectedRole}">
        <div class="filter-summary">
            <span class="summary-text">
                Showing <strong>${users.size()}</strong> results 
                <c:if test="${not empty search}">for "<strong>${search}</strong>"</c:if>
                <c:if test="${not empty selectedRole}">in <strong>${selectedRole}s</strong></c:if>
            </span>
            <a href="${pageContext.request.contextPath}/admin/users" class="reset-link">Reset all filters</a>
        </div>
    </c:if>

    <!-- Dynamic Tab Bar -->
    <div class="tab-bar scrollable-tabs">
        <a href="${pageContext.request.contextPath}/admin/users?role=&search=${search}" 
           class="tab ${empty selectedRole ? 'active' : ''}">All Accounts</a>
        <a href="${pageContext.request.contextPath}/admin/users?role=USER&search=${search}" 
           class="tab ${selectedRole == 'USER' ? 'active' : ''}">Users</a>
        <a href="${pageContext.request.contextPath}/admin/users?role=REPAIRER&search=${search}" 
           class="tab ${selectedRole == 'REPAIRER' ? 'active' : ''}">Repairers</a>
    </div>

    <div class="table-wrap responsive-table-wrap">
        <table class="responsive-table">
            <thead>
                <tr>
                    <th>User Identity</th>
                    <th>Role</th>
                    <th>Contact</th>
                    <th>Status</th>
                    <th class="text-right">Management</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td data-label="User Identity">
                            <div class="user-cell">
                                <c:set var="initials" value="${u.name.substring(0,1)}" />
                                <div class="av ${u.role == 'REPAIRER' ? 'av-g' : 'av-b'} avatar-sm">
                                    ${initials.toUpperCase()}
                                </div>
                                <div class="user-text">
                                    <div class="user-name-text">${u.name}</div>
                                    <div class="user-id-text">ID: #${u.userId}</div>
                                </div>
                            </div>
                        </td>
                        <td data-label="Role">
                            <span class="badge ${u.role == 'REPAIRER' ? 'badge-green' : 'badge-blue'}">${u.role}</span>
                        </td>
                        <td data-label="Contact">
                            <div class="contact-cell">
                                <div class="email-val">${u.email}</div>
                                <div class="phone-val">${u.phone}</div>
                            </div>
                        </td>
                        <td data-label="Status">
                            <c:choose>
                                <c:when test="${u.active}">
                                    <span class="pill pill-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="pill pill-danger">Suspended</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-right actions-cell" data-label="Management">
                            <form action="${pageContext.request.contextPath}/admin/users" method="post" class="action-form">
                                <input type="hidden" name="userId" value="${u.userId}">
                                <c:choose>
                                    <c:when test="${u.active}">
                                        <input type="hidden" name="action" value="deactivate">
                                        <button type="submit" class="btn btn-ghost btn-sm btn-danger-text">Suspend</button>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="hidden" name="action" value="activate">
                                        <button type="submit" class="btn btn-primary btn-sm btn-success-bg">Activate</button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Pagination -->
    <c:if test="${totalPages > 1}">
        <div class="pagination-wrap">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="${pageContext.request.contextPath}/admin/users?page=${i}&search=${search}&role=${selectedRole}" 
                   class="tab ${currentPage == i ? 'active' : ''} page-btn">
                    ${i}
                </a>
            </c:forEach>
        </div>
    </c:if>
</div>

<style>
    /* Structured Search Bar */
    .search-form-structured { display: flex; gap: 8px; align-items: center; }
    .search-input-group { 
        position: relative; display: flex; align-items: center; 
        background: var(--surface2); border: 1.5px solid var(--surface3); 
        border-radius: 10px; padding: 0 12px; width: 300px; transition: all 0.2s ease;
    }
    .search-input-group:focus-within { border-color: var(--ink1); box-shadow: 0 0 0 3px rgba(0,0,0,0.03); }
    .search-field { background: transparent; border: none; padding: 10px 8px; font-size: 14px; color: var(--ink1); width: 100%; outline: none; }
    .icon-sm { width: 16px; height: 16px; color: var(--ink3); }
    .clear-search { color: var(--ink3); padding: 4px; border-radius: 4px; display: flex; align-items: center; }
    .clear-search:hover { background: var(--surface3); color: var(--r); }
    .search-submit { padding: 9px 18px; border-radius: 10px; font-weight: 700; font-size: 14px; }

    /* Filter Summary */
    .filter-summary { margin-bottom: 20px; font-size: 14px; display: flex; justify-content: space-between; align-items: center; color: var(--ink2); background: var(--surface2); padding: 8px 16px; border-radius: 8px; }
    .reset-link { font-weight: 700; color: var(--b); text-decoration: none; font-size: 12px; }
    .reset-link:hover { text-decoration: underline; }

    /* Existing Styles Refined */
    .responsive-header { display: flex; justify-content: space-between; align-items: flex-end; gap: 20px; flex-wrap: wrap; margin-bottom: 24px; }
    .scrollable-tabs { display: flex; overflow-x: auto; gap: 5px; padding-bottom: 5px; scrollbar-width: none; }
    .scrollable-tabs .tab { white-space: nowrap; text-decoration: none; padding: 10px 20px; flex-shrink: 0; }
    .responsive-table-wrap { background: var(--surface1); border: 1px solid var(--surface3); border-radius: 16px; overflow: hidden; }
    #admin-users { padding: 0 2rem 2rem 2rem; max-width: 100%; overflow-x: hidden; }
    .responsive-table { width: 100%; border-collapse: collapse; }
    .responsive-table th { padding: 16px; text-align: left; font-size: 12px; font-weight: 700; color: var(--ink3); background: var(--surface2); text-transform: uppercase; }
    .responsive-table td { padding: 16px; border-bottom: 1px solid var(--surface3); }
    .user-cell { display: flex; align-items: center; gap: 12px; }
    .user-name-text { font-weight: 700; color: var(--ink1); }
    .avatar-sm { width: 36px; height: 36px; font-size: 12px; flex-shrink: 0; }
    .btn-danger-text { color: var(--r) !important; }
    .btn-success-bg { background: var(--g) !important; border: none !important; color: #fff !important; }
    .text-right { text-align: right; }
    .pagination-wrap { margin: 30px 0; display: flex; justify-content: center; gap: 8px; }
    .page-btn { padding: 8px 16px !important; border-radius: 10px !important; text-decoration: none; }

    @media (max-width: 768px) {
        .responsive-header { flex-direction: column; align-items: flex-start; }
        .search-input-group { width: 100%; }
        .filter-controls { width: 100%; }
        .search-form-structured { width: 100%; }
        .responsive-table thead { display: none; }
        .responsive-table tr { display: block; border-bottom: 8px solid var(--surface2); padding: 10px 0; }
        .responsive-table td { display: flex; justify-content: space-between; align-items: center; padding: 12px 16px; border-bottom: 1px solid var(--surface2); }
        .responsive-table td::before { content: attr(data-label); font-weight: 700; font-size: 12px; color: var(--ink3); text-transform: uppercase; }
    }
</style>

<jsp:include page="layout/footer.jsp" />
