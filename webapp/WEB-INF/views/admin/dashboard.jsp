<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-home">
        <div class="impact-banner">
          <div><div class="impact-num">${completedRepairs}</div><div class="impact-label"><i data-lucide="leaf" style="width:16px;height:16px;display:inline-block;vertical-align:text-bottom"></i> Items saved from landfill — Platform's total impact</div></div>
          <div class="impact-right">
            <p>${pendingRepairers} new repairers pending approval. Platform growing steadily.</p>
            <button class="btn" style="border:1.5px solid rgba(255,255,255,.4);color:#fff;margin-top:14px;border-radius:10px;padding:9px 18px;font-size:14px;font-weight:600;background:rgba(255,255,255,.1);cursor:pointer" onclick="window.location.href='${pageContext.request.contextPath}/admin/repairers'">Review Repairers →</button>
          </div>
        </div>
        <div class="metrics">
          <div class="metric"><div class="metric-label">Total Users</div><div class="metric-icon" style="background:var(--g3)"><i data-lucide="users" style="width:20px;height:20px;color:var(--gd)"></i></div><div class="metric-val">${totalUsers}</div><div class="metric-sub metric-up">↑ 12 this week</div></div>
          <div class="metric"><div class="metric-label">Categories</div><div class="metric-icon" style="background:#EFF6FF"><i data-lucide="folder" style="width:20px;height:20px;color:#1D4ED8"></i></div><div class="metric-val">${totalCategories}</div><div class="metric-sub">Active categories</div></div>
          <div class="metric"><div class="metric-label">Total Requests</div><div class="metric-icon" style="background:#FEF9C3"><i data-lucide="clipboard-list" style="width:20px;height:20px;color:#854D0E"></i></div><div class="metric-val">${totalRequests}</div><div class="metric-sub">All time</div></div>
          <div class="metric"><div class="metric-label">Pending Approval</div><div class="metric-icon" style="background:#FEE2E2"><i data-lucide="alert-triangle" style="width:20px;height:20px;color:#B91C1C"></i></div><div class="metric-val">${pendingRepairers}</div><div class="metric-sub" style="color:var(--acc)">Needs action</div></div>
        </div>
        <div class="g2">
          <div class="card">
            <div class="card-header"><div class="card-title">Jobs by Category</div></div>
            <div class="chart-bar-wrap">
              <c:forEach var="entry" items="${jobsByCategory}">
                <c:set var="barWidth" value="${totalRequests > 0 ? (entry.value * 100 / totalRequests) : 0}" />
                <c:set var="barColor">
                  <c:choose>
                    <c:when test="${entry.key == 'Electronics'}">var(--g2)</c:when>
                    <c:when test="${entry.key == 'Clothing'}">#60A5FA</c:when>
                    <c:when test="${entry.key == 'Furniture'}">#F59E0B</c:when>
                    <c:when test="${entry.key == 'Footwear'}">#A78BFA</c:when>
                    <c:otherwise>var(--ink3)</c:otherwise>
                  </c:choose>
                </c:set>
                <div class="chart-bar-row" style="--w: ${barWidth}%; --c: ${barColor};">
                  <div class="chart-bar-label">${entry.key}</div>
                  <div class="chart-bar-track">
                    <div class="chart-bar-fill" style="width: var(--w); background: var(--c);"></div>
                  </div>
                  <div class="chart-bar-val">${entry.value}</div>
                </div>
              </c:forEach>
              <c:if test="${empty jobsByCategory}">
                <div style="padding: 20px; text-align: center; color: var(--ink3)">No job data yet</div>
              </c:if>
            </div>
          </div>
          <div class="card">
            <div class="card-header"><div class="card-title">Top Repairers</div></div>
            <div style="display:flex;flex-direction:column;gap:12px">
              <c:forEach var="repairer" items="${topRepairers}">
                <div style="display:flex;align-items:center;gap:12px">
                  <div class="av av-g">${repairer.name.substring(0, 1)}</div>
                  <div style="flex:1">
                    <div style="font-size:13px;font-weight:700">${repairer.name}</div>
                    <div style="font-size:12px;color:var(--ink3)">${repairer.specialization} · ${repairer.serviceArea}</div>
                  </div>
                  <div class="stars" style="gap:1px">
                    <i data-lucide="star" style="width:14px;height:14px;color:#F59E0B;fill:currentColor"></i>
                  </div>
                  <div style="font-size:14px;font-weight:700;color:var(--g)">${repairer.rating}</div>
                </div>
              </c:forEach>
              <c:if test="${empty topRepairers}">
                <div style="padding: 20px; text-align: center; color: var(--ink3)">No top repairers yet</div>
              </c:if>
            </div>
          </div>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
