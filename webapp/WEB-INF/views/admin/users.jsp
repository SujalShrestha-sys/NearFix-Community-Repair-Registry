<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-users">
        <div class="page-head"><div><h2>Manage Users</h2><p>View and manage all platform accounts</p></div></div>
        <div class="tab-bar"><div class="tab active" onclick="filterTab(this)">All (1,284)</div><div class="tab" onclick="filterTab(this)">Users (1,137)</div><div class="tab" onclick="filterTab(this)">Repairers (147)</div><div class="tab" onclick="filterTab(this)">Suspended (4)</div></div>
        <div class="table-wrap">
          <table>
            <thead><tr><th>User</th><th>Role</th><th>Joined</th><th>Status</th><th>Actions</th></tr></thead>
            <tbody>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><div class="av av-b" style="width:30px;height:30px;font-size:11px">AS</div><div><div style="font-weight:700">Anita Sharma</div><div style="font-size:12px;color:var(--ink3)">anita@email.com</div></div></div></td><td><span class="badge badge-blue">User</span></td><td style="font-size:13px;color:var(--ink3)">Jan 12, 2025</td><td><span class="pill pill-success">Active</span></td><td><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'alert-triangle\' class=\'w-4 h-4\'></i> Account suspended')">Suspend</button></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><div class="av av-g" style="width:30px;height:30px;font-size:11px">RK</div><div><div style="font-weight:700">Ram Karki</div><div style="font-size:12px;color:var(--ink3)">repairer@nearfix.com</div></div></div></td><td><span class="badge badge-green">Repairer</span></td><td style="font-size:13px;color:var(--ink3)">Feb 3, 2025</td><td><span class="pill pill-success">Active</span></td><td><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'alert-triangle\' class=\'w-4 h-4\'></i> Account suspended')">Suspend</button></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><div class="av av-o" style="width:30px;height:30px;font-size:11px">BT</div><div><div style="font-weight:700">Birendra Tamang</div><div style="font-size:12px;color:var(--ink3)">birendra@email.com</div></div></div></td><td><span class="badge badge-green">Repairer</span></td><td style="font-size:13px;color:var(--ink3)">Mar 15, 2025</td><td><span class="pill pill-success">Active</span></td><td><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'alert-triangle\' class=\'w-4 h-4\'></i> Account suspended')">Suspend</button></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><div class="av" style="width:30px;height:30px;font-size:11px;background:var(--surface3);color:var(--ink3)">DK</div><div><div style="font-weight:700;color:var(--ink3)">Dev Kumar</div><div style="font-size:12px;color:var(--ink3)">dev@email.com</div></div></div></td><td><span class="badge badge-blue">User</span></td><td style="font-size:13px;color:var(--ink3)">Apr 2, 2025</td><td><span class="pill pill-danger">Suspended</span></td><td><button class="btn btn-primary btn-sm" onclick="showToast('<i data-lucide=\'check\' class=\'w-4 h-4\'></i> Account reactivated')">Reactivate</button></td></tr>
            </tbody>
          </table>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
