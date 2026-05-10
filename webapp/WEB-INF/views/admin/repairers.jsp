<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-repairers">
        <div class="page-head"><div><h2>Approve Repairers</h2><p>Review and approve repairer registrations</p></div></div>
        <c:forEach var="repairer" items="${pendingRepairers}">
          <div class="approval-card" id="repairer-${repairer.userId}">
            <div class="flex-row-resp">
              <div style="display:flex;gap:14px;flex:1">
                <div class="av av-g" style="width:48px;height:48px;font-size:16px;flex-shrink:0">${repairer.name.substring(0, 1)}</div>
                <div>
                  <div style="font-size:16px;font-weight:700;font-family:Outfit,sans-serif">${repairer.name}</div>
                  <div style="font-size:13px;color:var(--ink3);margin-top:2px">${repairer.email} · ${repairer.phone}</div>
                  <div style="display:flex;gap:8px;margin-top:8px;flex-wrap:wrap">
                    <span class="badge badge-blue">${repairer.specialization}</span>
                    <span class="badge badge-gray">${repairer.yearsOfExperience} years exp.</span>
                    <span class="badge badge-gray"><i data-lucide="map-pin" style="width:12px;height:12px;margin-right:4px"></i> ${repairer.serviceArea}</span>
                    <span class="badge badge-amber">Pending</span>
                  </div>
                  <div style="margin-top:10px;font-size:13px;color:var(--ink2);line-height:1.6;background:var(--surface2);padding:10px 12px;border-radius:8px;border:1px solid var(--border)">
                    "${repairer.expertise}"
                  </div>
                </div>
              </div>
              <div style="display:flex;flex-direction:column;gap:8px">
                <button class="btn btn-primary btn-sm" onclick="handleRepairerAction('${repairer.userId}', 'approve', this)">
                  <i data-lucide="check" style="width:14px;height:14px"></i> Approve
                </button>
                <button class="btn btn-danger btn-sm" onclick="handleRepairerAction('${repairer.userId}', 'reject', this)">
                  <i data-lucide="x" style="width:14px;height:14px"></i> Reject
                </button>
              </div>
            </div>
          </div>
        </c:forEach>
        <c:if test="${empty pendingRepairers}">
          <div class="empty">
            <div class="empty-icon">🎉</div>
            <h3>No Pending Approvals</h3>
            <p>All repairer applications have been processed. Great job!</p>
          </div>
        </c:if>
      </div>

<jsp:include page="layout/footer.jsp" />
