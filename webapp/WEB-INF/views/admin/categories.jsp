<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="layout/header.jsp" />

<style>
  /* Modal Styles */
  .modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(13, 27, 21, 0.4);
    backdrop-filter: blur(4px);
    z-index: 1000;
    display: none;
    align-items: center;
    justify-content: center;
    padding: 20px;
  }
  .modal-overlay.active { display: flex; }
  .modal-card {
    background: #fff;
    border-radius: var(--r);
    width: 100%;
    max-width: 450px;
    box-shadow: var(--shadow-xl);
    border: 1px solid var(--border);
    overflow: hidden;
    animation: modalIn 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  }
  @keyframes modalIn {
    from { opacity: 0; transform: scale(0.95) translateY(10px); }
    to { opacity: 1; transform: scale(1) translateY(0); }
  }
  .modal-header {
    padding: 20px 24px;
    border-bottom: 1px solid var(--border);
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .modal-body { padding: 24px; }
  .modal-footer {
    padding: 16px 24px;
    background: var(--surface2);
    border-top: 1px solid var(--border);
    display: flex;
    justify-content: flex-end;
    gap: 12px;
  }
  
  .alert {
    padding: 12px 16px;
    border-radius: 10px;
    margin-bottom: 20px;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .alert-success { background: var(--g3); color: var(--g); border: 1px solid rgba(10,110,80,0.15); }
  .alert-error { background: #FEF2F2; color: #DC2626; border: 1px solid #FCA5A5; }
  
  .btn-disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
</style>

<div class="page active" id="admin-categories">
  <div class="page-head">
    <div>
      <h2>Skill Categories</h2>
      <p>Manage repair categories on the platform</p>
    </div>
    <button
      class="btn btn-primary"
      onclick="openModal('addCategoryModal')"
    >
      <i data-lucide="plus" style="width:16px;height:16px"></i> Add Category
    </button>
  </div>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">
      <i data-lucide="check-circle" style="width:18px;height:18px"></i>
      ${successMessage}
      <% session.removeAttribute("successMessage"); %>
    </div>
  </c:if>
  <c:if test="${not empty errorMessage}">
    <div class="alert alert-error">
      <i data-lucide="alert-circle" style="width:18px;height:18px"></i>
      ${errorMessage}
      <% session.removeAttribute("errorMessage"); %>
    </div>
  </c:if>

  <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th>Category</th>
          <th>Description</th>
          <th>Active Repairers</th>
          <th>Total Requests</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="cat" items="${categories}">
          <c:set var="lowName" value="${fn:toLowerCase(cat.name)}" />
          <tr>
            <td>
              <div style="display: flex; align-items: center; gap: 10px">
                <span
                  style="
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    width: 32px;
                    height: 32px;
                    background: var(--surface2);
                    border-radius: 8px;
                    color: var(--g);
                  "
                >
                  <c:choose>
                    <c:when test="${fn:contains(lowName, 'electron')}"><i data-lucide="smartphone"></i></c:when>
                    <c:when test="${fn:contains(lowName, 'cloth')}"><i data-lucide="shirt"></i></c:when>
                    <c:when test="${fn:contains(lowName, 'furnit')}"><i data-lucide="armchair"></i></c:when>
                    <c:when test="${fn:contains(lowName, 'watch')}"><i data-lucide="watch"></i></c:when>
                    <c:when test="${fn:contains(lowName, 'appliance')}"><i data-lucide="plug"></i></c:when>
                    <c:otherwise><i data-lucide="tag"></i></c:otherwise>
                  </c:choose>
                </span>
                <div style="font-weight: 700">${cat.name}</div>
              </div>
            </td>
            <td style="color: var(--ink2); font-size: 13px; max-width: 250px">${cat.description}</td>
            <td style="font-weight: 700; color: var(--g)">${cat.repairerCount}</td>
            <td>${cat.requestCount}</td>
            <td>
              <div style="display: flex; gap: 6px">
                <button
                  class="btn btn-ghost btn-sm"
                  data-id="${cat.categoryId}"
                  data-name="${fn:escapeXml(cat.name)}"
                  data-desc="${fn:escapeXml(cat.description)}"
                  onclick="editCategory(this)"
                >
                  <i data-lucide="pencil" style="width:14px;height:14px"></i> Edit
                </button>
                
                <c:set var="isInUse" value="${cat.repairerCount > 0 || cat.requestCount > 0}" />
                <button
                  class="btn btn-danger btn-sm ${isInUse ? 'btn-disabled' : ''}"
                  data-id="${cat.categoryId}"
                  data-name="${fn:escapeXml(cat.name)}"
                  data-in-use="${isInUse}"
                  onclick="handleDeleteAction(this)"
                  title="${isInUse ? 'Cannot delete: Category is currently in use' : 'Delete category'}"
                >
                  <i data-lucide="trash-2" style="width:14px;height:14px"></i> Delete
                </button>
              </div>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty categories}">
          <tr>
            <td colspan="5" style="text-align: center; padding: 48px">
              <div class="empty">
                <div class="empty-icon"><i data-lucide="tag"></i></div>
                <h3>No categories found</h3>
                <p>Start by adding your first repair category.</p>
              </div>
            </td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

<!-- Add Category Modal -->
<div class="modal-overlay" id="addCategoryModal">
  <div class="modal-card">
    <div class="modal-header">
      <h3 class="card-title">Add New Category</h3>
      <button class="icon-btn" onclick="closeModal('addCategoryModal')"><i data-lucide="x"></i></button>
    </div>
    <form action="${pageContext.request.contextPath}/admin/categories" method="POST">
      <input type="hidden" name="action" value="create">
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Category Name</label>
          <input type="text" name="name" class="form-input" placeholder="e.g. Electronics" required>
        </div>
        <div class="form-group">
          <label class="form-label">Description</label>
          <textarea name="description" class="form-input" placeholder="Brief description of the category..." required></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-ghost" onclick="closeModal('addCategoryModal')">Cancel</button>
        <button type="submit" class="btn btn-primary">Create Category</button>
      </div>
    </form>
  </div>
</div>

<!-- Edit Category Modal -->
<div class="modal-overlay" id="editCategoryModal">
  <div class="modal-card">
    <div class="modal-header">
      <h3 class="card-title">Edit Category</h3>
      <button class="icon-btn" onclick="closeModal('editCategoryModal')"><i data-lucide="x"></i></button>
    </div>
    <form action="${pageContext.request.contextPath}/admin/categories" method="POST">
      <input type="hidden" name="action" value="update">
      <input type="hidden" name="categoryId" id="editCategoryId">
      <div class="modal-body">
        <div class="form-group">
          <label class="form-label">Category Name</label>
          <input type="text" name="name" id="editCategoryName" class="form-input" required>
        </div>
        <div class="form-group">
          <label class="form-label">Description</label>
          <textarea name="description" id="editCategoryDescription" class="form-input" required></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-ghost" onclick="closeModal('editCategoryModal')">Cancel</button>
        <button type="submit" class="btn btn-primary">Save Changes</button>
      </div>
    </form>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal-overlay" id="deleteCategoryModal">
  <div class="modal-card">
    <div class="modal-header">
      <h3 class="card-title">Delete Category</h3>
      <button class="icon-btn" onclick="closeModal('deleteCategoryModal')"><i data-lucide="x"></i></button>
    </div>
    <form action="${pageContext.request.contextPath}/admin/categories" method="POST">
      <input type="hidden" name="action" value="delete">
      <input type="hidden" name="categoryId" id="deleteCategoryId">
      <div class="modal-body">
        <p style="font-size: 14px; color: var(--ink2); line-height: 1.6">
          Are you sure you want to delete the category <strong id="deleteCategoryName" style="color: var(--ink)"></strong>? 
          This action cannot be undone and may affect existing repairers and requests associated with this category.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-ghost" onclick="closeModal('deleteCategoryModal')">Cancel</button>
        <button type="submit" class="btn btn-danger" style="background: #DC2626; color: #fff; border: none">Delete Category</button>
      </div>
    </form>
  </div>
</div>

<script>
  function openModal(id) {
    document.getElementById(id).classList.add('active');
  }
  
  function closeModal(id) {
    document.getElementById(id).classList.remove('active');
  }
  
  function editCategory(btn) {
    const id = btn.dataset.id;
    const name = btn.dataset.name;
    const desc = btn.dataset.desc;
    
    document.getElementById('editCategoryId').value = id;
    document.getElementById('editCategoryName').value = name;
    document.getElementById('editCategoryDescription').value = desc;
    openModal('editCategoryModal');
  }
  
  function confirmDelete(btn) {
    const id = btn.dataset.id;
    const name = btn.dataset.name;
    
    document.getElementById('deleteCategoryId').value = id;
    document.getElementById('deleteCategoryName').textContent = name;
    openModal('deleteCategoryModal');
  }

  function handleDeleteAction(btn) {
    if (btn.dataset.inUse === 'true') {
      showInUseWarning();
    } else {
      confirmDelete(btn);
    }
  }

  function showInUseWarning() {
    showToast('<i data-lucide="alert-triangle" style="width:18px;height:18px"></i> Cannot delete category while it has active repairers or requests.');
  }

  // Close modal on escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      document.querySelectorAll('.modal-overlay').forEach(function(m) {
        m.classList.remove('active');
      });
    }
  });
</script>

<jsp:include page="layout/footer.jsp" />
