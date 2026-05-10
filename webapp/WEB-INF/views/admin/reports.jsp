<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-reports">
        <div class="page-head"><div><h2>Reports & Analytics</h2><p>Platform performance and trends</p></div></div>
        <div class="metrics" style="grid-template-columns:repeat(auto-fit,minmax(180px,1fr))">
          <div class="metric"><div class="metric-label">Completion Rate</div><div class="metric-val">87%</div><div class="metric-sub metric-up">↑ 3% vs last month</div></div>
          <div class="metric"><div class="metric-label">Avg Repair Time</div><div class="metric-val">2.4d</div><div class="metric-sub">Days to complete</div></div>
          <div class="metric"><div class="metric-label">Cancellation Rate</div><div class="metric-val">4%</div><div class="metric-sub">Below target</div></div>
          <div class="metric"><div class="metric-label">New Users (May)</div><div class="metric-val">48</div><div class="metric-sub metric-up">↑ 22%</div></div>
        </div>
        <div class="g2">
          <div class="card">
            <div class="card-header"><div class="card-title">Monthly Requests Trend</div></div>
            <div class="chart-bar-wrap">
              <div class="chart-bar-row"><div class="chart-bar-label">January</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:45%;background:var(--g2)"></div></div><div class="chart-bar-val">328</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">February</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:52%;background:var(--g2)"></div></div><div class="chart-bar-val">378</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">March</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:68%;background:var(--g2)"></div></div><div class="chart-bar-val">492</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">April</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:80%;background:var(--g2)"></div></div><div class="chart-bar-val">580</div></div>
              <div class="chart-bar-row"><div class="chart-bar-label">May (so far)</div><div class="chart-bar-track"><div class="chart-bar-fill" style="width:38%;background:var(--g)"></div></div><div class="chart-bar-val">274</div></div>
            </div>
          </div>
          <div class="card">
            <div class="card-header"><div class="card-title">Impact Counter</div></div>
            <div style="text-align:center;padding:20px">
              <div style="font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.08em;color:var(--ink3);margin-bottom:12px">Total items saved from landfill</div>
              <div style="font-family:Outfit,sans-serif;font-size:64px;font-weight:900;color:var(--g);letter-spacing:-.06em;line-height:1">8,240</div>
              <div style="font-size:14px;color:var(--ink3);margin-top:8px">= 8,240 completed repairs on platform</div>
              <div style="background:var(--g3);border-radius:12px;padding:14px;margin-top:16px;border:1px solid rgba(10,110,80,.1)">
                <div style="font-size:13px;color:var(--gd);font-weight:600"><i data-lucide="leaf" style="width:14px;height:14px;display:inline-block;vertical-align:text-bottom"></i> Each repair saves an item from landfill</div>
                <div style="font-size:12px;color:var(--ink3);margin-top:4px">Estimated 41 tonnes of waste avoided</div>
              </div>
            </div>
          </div>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
