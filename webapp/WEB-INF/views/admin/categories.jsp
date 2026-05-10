<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-categories">
        <div class="page-head"><div><h2>Skill Categories</h2><p>Manage repair categories on the platform</p></div><button class="btn btn-primary" onclick="showToast('<i data-lucide=\'check\'></i> New category created!')">+ Add Category</button></div>
        <div class="table-wrap">
          <table>
            <thead><tr><th>Category</th><th>Active Repairers</th><th>Total Requests</th><th>Actions</th></tr></thead>
            <tbody>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><span style="display:flex;align-items:center;justify-content:center;width:24px;height:24px"><i data-lucide="smartphone"></i></span><div style="font-weight:700">Electronics</div></div></td><td style="font-weight:700;color:var(--g)">62</td><td>5,230</td><td><div style="display:flex;gap:6px"><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'pencil\' class=\'w-4 h-4\'></i> Category updated')">Edit</button><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Category deleted')">Delete</button></div></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><span style="display:flex;align-items:center;justify-content:center;width:24px;height:24px"><i data-lucide="shirt"></i></span><div style="font-weight:700">Clothing & Footwear</div></div></td><td style="font-weight:700;color:var(--g)">41</td><td>3,480</td><td><div style="display:flex;gap:6px"><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'pencil\' class=\'w-4 h-4\'></i> Category updated')">Edit</button><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Category deleted')">Delete</button></div></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><span style="display:flex;align-items:center;justify-content:center;width:24px;height:24px"><i data-lucide="armchair"></i></span><div style="font-weight:700">Furniture</div></div></td><td style="font-weight:700;color:var(--g)">28</td><td>2,540</td><td><div style="display:flex;gap:6px"><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'pencil\' class=\'w-4 h-4\'></i> Category updated')">Edit</button><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Category deleted')">Delete</button></div></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><span style="display:flex;align-items:center;justify-content:center;width:24px;height:24px"><i data-lucide="watch"></i></span><div style="font-weight:700">Watches & Jewellery</div></div></td><td style="font-weight:700;color:var(--g)">9</td><td>820</td><td><div style="display:flex;gap:6px"><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'pencil\' class=\'w-4 h-4\'></i> Category updated')">Edit</button><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Category deleted')">Delete</button></div></td></tr>
              <tr><td><div style="display:flex;align-items:center;gap:10px"><span style="display:flex;align-items:center;justify-content:center;width:24px;height:24px"><i data-lucide="plug"></i></span><div style="font-weight:700">Appliances</div></div></td><td style="font-weight:700;color:var(--g)">7</td><td>1,170</td><td><div style="display:flex;gap:6px"><button class="btn btn-ghost btn-sm" onclick="showToast('<i data-lucide=\'pencil\' class=\'w-4 h-4\'></i> Category updated')">Edit</button><button class="btn btn-danger btn-sm" onclick="showToast('<i data-lucide=\'trash-2\' class=\'w-4 h-4\'></i> Category deleted')">Delete</button></div></td></tr>
            </tbody>
          </table>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
