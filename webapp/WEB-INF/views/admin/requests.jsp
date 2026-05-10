<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-allrequests">
        <div class="page-head"><div><h2>All Repair Requests</h2><p>Full platform request list</p></div></div>
        <div class="tab-bar"><div class="tab active" onclick="filterTab(this)">All (15,240)</div><div class="tab" onclick="filterTab(this)">Pending</div><div class="tab" onclick="filterTab(this)">In Progress</div><div class="tab" onclick="filterTab(this)">Completed</div></div>
        <div class="table-wrap">
          <table>
            <thead><tr><th>Request</th><th>User</th><th>Category</th><th>Status</th><th>Date</th><th>Actions</th></tr></thead>
            <tbody>
              <tr><td><div style="font-weight:700">#1044 Samsung S22 screen</div></td><td>Dev Raj</td><td><span class="badge badge-blue">Electronics</span></td><td><span class="badge badge-blue">Pending</span></td><td style="font-size:12px;color:var(--ink3)">May 7, 2025</td><td><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Request deleted')">Delete</button></td></tr>
              <tr><td><div style="font-weight:700">#1042 iPhone 13 screen</div></td><td>Anita S.</td><td><span class="badge badge-blue">Electronics</span></td><td><span class="badge badge-green">In Progress</span></td><td style="font-size:12px;color:var(--ink3)">May 5, 2025</td><td><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Request deleted')">Delete</button></td></tr>
              <tr><td><div style="font-weight:700">#1041 Leather jacket zip</div></td><td>Anita S.</td><td><span class="badge badge-gray">Clothing</span></td><td><span class="badge badge-blue">Pending</span></td><td style="font-size:12px;color:var(--ink3)">May 4, 2025</td><td><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Request deleted')">Delete</button></td></tr>
              <tr><td><div style="font-weight:700">#1036 Wooden chair leg</div></td><td>Anita S.</td><td><span class="badge badge-amber">Furniture</span></td><td><span class="badge badge-gray">Completed</span></td><td style="font-size:12px;color:var(--ink3)">May 1, 2025</td><td><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Request deleted')">Delete</button></td></tr>
            </tbody>
          </table>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
