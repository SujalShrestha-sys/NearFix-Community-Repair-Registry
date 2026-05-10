<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-home">
        <div class="impact-banner">
          <div><div class="impact-num">${completedRepairs}</div><div class="impact-label"><i data-lucide="leaf" style="width:16px;height:16px;display:inline-block;vertical-align:text-bottom"></i> Items saved from landfill — Platform's total impact</div></div>
          <div class="impact-right"><p>3 new repairers pending approval. Platform growing steadily.</p><button class="btn" style="border:1.5px solid rgba(255,255,255,.4);color:#fff;margin-top:14px;border-radius:10px;padding:9px 18px;font-size:14px;font-weight:600;background:rgba(255,255,255,.1);cursor:pointer" onclick="showPage('admin','repairers',null)">Review Repairers →</button></div>
        </div>
        <div class="metrics">
          <div class="metric"><div class="metric-label">Total Users</div><div class="metric-icon" style="background:var(--g3)"><i data-lucide="users" style="width:20px;height:20px;color:var(--gd)"></i></div><div class="metric-val">${totalUsers}</div><div class="metric-sub metric-up">↑ 12 this week</div></div>
          <div class="metric"><div class="metric-label">Categories</div><div class="metric-icon" style="background:#EFF6FF"><i data-lucide="folder" style="width:20px;height:20px;color:#1D4ED8"></i></div><div class="metric-val">${totalCategories}</div><div class="metric-sub">Active categories</div></div>
          <div class="metric"><div class="metric-label">Total Requests</div><div class="metric-icon" style="background:#FEF9C3"><i data-lucide="clipboard-list" style="width:20px;height:20px;color:#854D0E"></i></div><div class="metric-val">${totalRequests}</div><div class="metric-sub">All time</div></div>
          <div class="metric"><div class="metric-label">Pending Approval</div><div class="metric-icon" style="background:#FEE2E2"><i data-lucide="alert-triangle" style="width:20px;height:20px;color:#B91C1C"></i></div><div class="metric-val">3</div><div class="metric-sub" style="color:var(--acc)">Needs action</div></div>
        </div>
        <div class="g2">
          <div class="card">
            <div class="card-header"><div class="card-title">Jobs by Category</div></div>
            <div class="chart-bar-wrap">
              <div class="chart-bar-row"><div class="chart-bar-label">Electronics</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:72%;background:var(--g2)"></div></div><div class="chart-bar-val">5,230</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">Clothing</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:48%;background:#60A5FA"></div></div><div class="chart-bar-val">3,480</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">Furniture</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:35%;background:#F59E0B"></div></div><div class="chart-bar-val">2,540</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">Footwear</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:25%;background:#A78BFA"></div></div><div class="chart-bar-val">1,820</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">Other</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:15%;background:var(--ink3)"></div></div><div class="chart-bar-val">2,170</div></div>
            </div>
          </div>
          <div class="card">
            <div class="card-header"><div class="card-title">Top Repairers</div></div>
            <div style="display:flex;flex-direction:column;gap:12px">
              <div style="display:flex;align-items:center;gap:12px"><div class="av av-g">SK</div><div style="flex:1"><div style="font-size:13px;font-weight:700">Suresh Kumar</div><div style="font-size:12px;color:var(--ink3)">Electronics · Thamel</div></div><div class="stars" style="gap:1px"><i data-lucide="star" style="width:14px;height:14px;color:#F59E0B;fill:currentColor"></i></div><div style="font-size:14px;font-weight:700;color:var(--g)">4.9</div></div>
              <div style="display:flex;align-items:center;gap:12px"><div class="av av-o">BT</div><div style="flex:1"><div style="font-size:13px;font-weight:700">Birendra Tamang</div><div style="font-size:12px;color:var(--ink3)">Furniture · Patan</div></div><div style="font-size:14px;font-weight:700;color:var(--g)">4.7</div></div>
              <div style="display:flex;align-items:center;gap:12px"><div class="av av-b">MP</div><div style="flex:1"><div style="font-size:13px;font-weight:700">Maya Pradhan</div><div style="font-size:12px;color:var(--ink3)">Clothing · Baneshwor</div></div><div style="font-size:14px;font-weight:700;color:var(--g)">4.8</div></div>
            </div>
          </div>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
