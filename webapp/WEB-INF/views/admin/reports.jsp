<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-reports">
  <div class="page-head">
    <div>
      <h2>Reports & Analytics</h2>
      <p>Platform performance and trends</p>
    </div>
  </div>

  <div class="metrics" style="grid-template-columns:repeat(auto-fit,minmax(180px,1fr))">
    <div class="metric">
      <div class="metric-label">Completion Rate</div>
      <div class="metric-val">${completionRate}%</div>
      <div class="metric-sub">${completedRepairs} of ${totalRequests} completed</div>
    </div>
    <div class="metric">
      <div class="metric-label">Avg Repair Time</div>
      <div class="metric-val">${avgRepairTime}d</div>
      <div class="metric-sub">Average days to close</div>
    </div>
    <div class="metric">
      <div class="metric-label">Active Users</div>
      <div class="metric-val">${totalUsers}</div>
      <div class="metric-sub metric-up">↑ ${newUsers} in last 30d</div>
    </div>
    <div class="metric">
      <div class="metric-label">Sustainability</div>
      <div class="metric-val">${completedRepairs}</div>
      <div class="metric-sub">Items saved from landfill</div>
    </div>
  </div>

  <div class="g2">
    <div class="card">
      <div class="card-header">
        <div class="card-title">Monthly Requests Trend</div>
      </div>
      <div class="chart-bar-wrap">
        <c:set var="maxCount" value="${0}" />
        <c:forEach var="entry" items="${monthlyTrend}">
            <c:if test="${entry.value > maxCount}">
                <c:set var="maxCount" value="${entry.value}" />
            </c:if>
        </c:forEach>
        
        <c:forEach var="entry" items="${monthlyTrend}">
          <c:set var="val" value="${entry.value}" />
          <c:set var="barWidth" value="0" />
          <c:if test="${maxCount > 0}">
             <c:set var="barWidth" value="${(val * 100) / maxCount}" />
          </c:if>
          
          <div class="chart-bar-row">
            <div class="chart-bar-label">${entry.key}</div>
            <div class="chart-bar-track">
              <!-- We use data-width to store the percentage, and a small script at the bottom sets the actual width. -->
              <!-- This prevents the IDE from showing CSS syntax errors. -->
              <div class="chart-bar-fill" data-width="${barWidth}" style="background: var(--g2)"></div>
            </div>
            <div class="chart-bar-val">${entry.value}</div>
          </div>
        </c:forEach>
        
        <c:if test="${empty monthlyTrend}">
            <p style="padding: 20px; color: var(--ink3); text-align: center">No trend data available yet.</p>
        </c:if>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <div class="card-title">Impact Counter</div>
      </div>
      <div style="text-align:center;padding:20px">
        <div style="font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.08em;color:var(--ink3);margin-bottom:12px">Total items saved from landfill</div>
        <div style="font-family:Outfit,sans-serif;font-size:64px;font-weight:900;color:var(--g);letter-spacing:-.06em;line-height:1">
            <c:out value="${completedRepairs}" />
        </div>
        <div style="font-size:14px;color:var(--ink3);margin-top:8px">= ${completedRepairs} completed repairs on platform</div>
        
        <div style="background:var(--g3);border-radius:12px;padding:14px;margin-top:16px;border:1px solid rgba(10,110,80,.1)">
          <div style="font-size:13px;color:var(--gd);font-weight:600">
            <i data-lucide="leaf" style="width:14px;height:14px;display:inline-block;vertical-align:text-bottom"></i> 
            Each repair saves an item from landfill
          </div>
          <div style="font-size:12px;color:var(--ink3);margin-top:4px">
            Estimated <c:out value="${completedRepairs * 5}" /> kg of waste avoided
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="card" style="margin-top: 24px">
    <div class="card-header">
      <div class="card-title">Category Distribution</div>
    </div>
    <div style="padding: 20px; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px">
      <c:forEach var="entry" items="${categoryCounts}">
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 12px; background: var(--surface2); border-radius: 8px">
          <span style="font-weight: 600; color: var(--ink1)">${entry.key}</span>
          <span class="badge badge-primary">${entry.value}</span>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<script>
  /**
   * Beginner-Friendly Script:
   * This script finds all the chart bars and sets their width.
   * We do this here instead of in the HTML 'style' attribute to 
   * keep the code clean and prevent IDE errors.
   */
  document.addEventListener('DOMContentLoaded', function() {
    // 1. Find all elements with the class 'chart-bar-fill'
    var bars = document.querySelectorAll('.chart-bar-fill');
    
    // 2. Loop through each bar
    bars.forEach(function(bar) {
      // 3. Get the percentage value we stored in 'data-width'
      var widthValue = bar.getAttribute('data-width');
      
      // 4. Set the actual CSS width
      if (widthValue) {
        bar.style.width = widthValue + '%';
      }
    });
  });
</script>

<jsp:include page="layout/footer.jsp" />
