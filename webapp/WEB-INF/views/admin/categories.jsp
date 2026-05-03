<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.Category, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management | NearFix Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .serif { font-family: 'Playfair Display', serif; }
    </style>
</head>
<body class="bg-[#F9FAFB] flex min-h-screen">

    <main class="flex-1 flex flex-col min-w-0 p-8">
        <header class="mb-10 flex flex-col md:flex-row md:items-end justify-between gap-6">
            <div>
                <h1 class="serif text-4xl text-gray-900 mb-2">Service Categories</h1>
                <p class="text-gray-500 font-medium">Create and manage the types of repairs offered on the platform.</p>
            </div>
            <div class="flex items-center gap-4">
                <a href="<%= request.getContextPath() %>/admin/dashboard" class="text-gray-500 hover:text-gray-900 font-medium flex items-center gap-2">
                    <i class="ph ph-house"></i> Dashboard
                </a>
                <button onclick="document.getElementById('addModal').classList.remove('hidden')" class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-6 py-3 rounded-xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20">
                    <i class="ph ph-plus-circle text-lg"></i> Add Category
                </button>
            </div>
        </header>

        <% if (session.getAttribute("successMessage") != null) { %>
            <div class="mb-6 p-4 bg-emerald-50 text-emerald-700 rounded-2xl border border-emerald-100 font-medium">
                <%= session.getAttribute("successMessage") %>
                <% session.removeAttribute("successMessage"); %>
            </div>
        <% } %>

        <!-- Categories List -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <% 
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null) {
                    for (Category cat : categories) {
            %>
                <div class="bg-white border border-gray-100 rounded-3xl p-6 shadow-sm hover:shadow-md transition-shadow">
                    <div class="flex justify-between items-start mb-4">
                        <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center text-[#449E80]">
                            <i class="ph ph-tag text-2xl"></i>
                        </div>
                        <div class="flex gap-2">
                            <button onclick="editCategory('<%= cat.getCategoryId() %>', '<%= cat.getName() %>', '<%= cat.getDescription() %>')" class="p-2 text-gray-400 hover:text-[#449E80] transition-colors">
                                <i class="ph ph-pencil-simple text-xl"></i>
                            </button>
                            <form action="<%= request.getContextPath() %>/admin/categories" method="POST" class="inline" onsubmit="return confirm('Are you sure you want to delete this category?')">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="categoryId" value="<%= cat.getCategoryId() %>">
                                <button type="submit" class="p-2 text-gray-400 hover:text-red-500 transition-colors">
                                    <i class="ph ph-trash text-xl"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-2"><%= cat.getName() %></h3>
                    <p class="text-sm text-gray-500 line-clamp-2"><%= cat.getDescription() %></p>
                </div>
            <% 
                    }
                } 
            %>
        </div>

        <!-- Add Modal -->
        <div id="addModal" class="hidden fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
            <div class="bg-white rounded-[2.5rem] w-full max-w-md p-8 shadow-2xl">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-900">Add Category</h2>
                    <button onclick="document.getElementById('addModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-600">
                        <i class="ph ph-x text-2xl"></i>
                    </button>
                </div>
                <form action="<%= request.getContextPath() %>/admin/categories" method="POST">
                    <input type="hidden" name="action" value="create">
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1.5">Category Name</label>
                            <input type="text" name="name" required class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all">
                        </div>
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1.5">Description</label>
                            <textarea name="description" rows="3" class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all"></textarea>
                        </div>
                        <button type="submit" class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white py-4 rounded-2xl font-bold transition-all shadow-lg shadow-[#449E80]/20 mt-4">
                            Create Category
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Edit Modal -->
        <div id="editModal" class="hidden fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
            <div class="bg-white rounded-[2.5rem] w-full max-w-md p-8 shadow-2xl">
                <div class="flex justify-between items-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-900">Edit Category</h2>
                    <button onclick="document.getElementById('editModal').classList.add('hidden')" class="text-gray-400 hover:text-gray-600">
                        <i class="ph ph-x text-2xl"></i>
                    </button>
                </div>
                <form action="<%= request.getContextPath() %>/admin/categories" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="categoryId" id="editCategoryId">
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1.5">Category Name</label>
                            <input type="text" name="name" id="editCategoryName" required class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all">
                        </div>
                        <div>
                            <label class="block text-sm font-bold text-gray-700 mb-1.5">Description</label>
                            <textarea name="description" id="editCategoryDesc" rows="3" class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all"></textarea>
                        </div>
                        <button type="submit" class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white py-4 rounded-2xl font-bold transition-all shadow-lg shadow-[#449E80]/20 mt-4">
                            Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script>
        function editCategory(id, name, desc) {
            document.getElementById('editCategoryId').value = id;
            document.getElementById('editCategoryName').value = name;
            document.getElementById('editCategoryDesc').value = desc;
            document.getElementById('editModal').classList.remove('hidden');
        }
    </script>
</body>
</html>
