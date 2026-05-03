<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.User, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management | NearFix Admin</title>
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
                <h1 class="serif text-4xl text-gray-900 mb-2">User Management</h1>
                <p class="text-gray-500 font-medium">Manage and monitor all users on the platform.</p>
            </div>
            <div class="flex items-center gap-4">
                <a href="<%= request.getContextPath() %>/admin/dashboard" class="text-gray-500 hover:text-gray-900 font-medium flex items-center gap-2">
                    <i class="ph ph-house"></i> Dashboard
                </a>
                <a href="<%= request.getContextPath() %>/logout" class="text-red-500 hover:text-red-700 font-medium flex items-center gap-2">
                    <i class="ph ph-sign-out"></i> Sign Out
                </a>
            </div>
        </header>

        <!-- Search and Filter -->
        <div class="bg-white border border-gray-100 rounded-3xl p-6 mb-8 shadow-sm">
            <form action="<%= request.getContextPath() %>/admin/users" method="GET" class="flex flex-col md:flex-row gap-4">
                <div class="flex-1 relative">
                    <i class="ph ph-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-lg"></i>
                    <input type="text" name="search" value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>" 
                           placeholder="Search by name, email or phone..." 
                           class="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm">
                </div>
                <div class="w-full md:w-48">
                    <select name="role" class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm appearance-none">
                        <option value="">All Roles</option>
                        <option value="USER" <%= "USER".equals(request.getAttribute("selectedRole")) ? "selected" : "" %>>User</option>
                        <option value="REPAIRER" <%= "REPAIRER".equals(request.getAttribute("selectedRole")) ? "selected" : "" %>>Repairer</option>
                        <option value="ADMIN" <%= "ADMIN".equals(request.getAttribute("selectedRole")) ? "selected" : "" %>>Admin</option>
                    </select>
                </div>
                <button type="submit" class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-8 py-3 rounded-2xl font-bold transition-all shadow-lg shadow-[#449E80]/10">
                    Apply Filter
                </button>
                <% if (request.getAttribute("search") != null || request.getAttribute("selectedRole") != null) { %>
                    <a href="<%= request.getContextPath() %>/admin/users" class="bg-gray-100 hover:bg-gray-200 text-gray-600 px-6 py-3 rounded-2xl font-bold transition-all text-center flex items-center justify-center">
                        Clear
                    </a>
                <% } %>
            </form>
        </div>

        <% if (session.getAttribute("successMessage") != null) { %>
            <div class="mb-6 p-4 bg-emerald-50 text-emerald-700 rounded-2xl border border-emerald-100 font-medium">
                <%= session.getAttribute("successMessage") %>
                <% session.removeAttribute("successMessage"); %>
            </div>
        <% } %>

        <!-- Users Table -->
        <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
            <% 
                List<User> users = (List<User>) request.getAttribute("users");
                if (users == null || users.isEmpty()) { 
            %>
                <div class="p-24 text-center">
                    <div class="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-6">
                        <i class="ph ph-users-three text-gray-300 text-3xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-2">No users found</h3>
                    <p class="text-gray-500">Try adjusting your search or filters.</p>
                </div>
            <% } else { %>
                <table class="w-full text-left">
                    <thead class="bg-gray-50 text-[10px] uppercase tracking-widest font-bold text-gray-400">
                        <tr>
                            <th class="px-8 py-5">User</th>
                            <th class="px-8 py-5">Role</th>
                            <th class="px-8 py-5">Status</th>
                            <th class="px-8 py-5 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                        <% for (User u : users) { %>
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-8 py-6">
                                    <div class="flex items-center gap-4">
                                        <div class="w-10 h-10 bg-[#449E80]/10 rounded-full flex items-center justify-center text-[#449E80] font-bold">
                                            <%= u.getName().substring(0, 1).toUpperCase() %>
                                        </div>
                                        <div class="flex flex-col">
                                            <span class="font-bold text-gray-900"><%= u.getName() %></span>
                                            <span class="text-xs text-gray-400"><%= u.getEmail() %></span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="text-xs font-bold px-2.5 py-1 rounded-full <%= "ADMIN".equals(u.getRole()) ? "bg-purple-50 text-purple-600" : "REPAIRER".equals(u.getRole()) ? "bg-blue-50 text-blue-600" : "bg-gray-50 text-gray-600" %>">
                                        <%= u.getRole() %>
                                    </span>
                                </td>
                                <td class="px-8 py-6">
                                    <% if (u.isActive()) { %>
                                        <span class="inline-flex items-center gap-1.5 text-xs font-bold text-emerald-500">
                                            <span class="w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
                                            Active
                                        </span>
                                    <% } else { %>
                                        <span class="inline-flex items-center gap-1.5 text-xs font-bold text-red-400">
                                            <span class="w-1.5 h-1.5 rounded-full bg-red-400"></span>
                                            Deactivated
                                        </span>
                                    <% } %>
                                </td>
                                <td class="px-8 py-6 text-right">
                                    <form action="<%= request.getContextPath() %>/admin/users" method="POST" class="inline">
                                        <input type="hidden" name="userId" value="<%= u.getUserId() %>">
                                        <% if (u.isActive()) { %>
                                            <input type="hidden" name="action" value="deactivate">
                                            <button type="submit" class="text-xs font-bold text-red-400 hover:text-red-600 transition-colors mr-3">Deactivate</button>
                                        <% } else { %>
                                            <input type="hidden" name="action" value="activate">
                                            <button type="submit" class="text-xs font-bold text-emerald-500 hover:text-emerald-700 transition-colors mr-3">Activate</button>
                                        <% } %>
                                    </form>

                                    <% if ("REPAIRER".equals(u.getRole())) { %>
                                        <form action="<%= request.getContextPath() %>/admin/users" method="POST" class="inline border-l border-gray-100 pl-3">
                                            <input type="hidden" name="userId" value="<%= u.getUserId() %>">
                                            <% if (u.isVerified()) { %>
                                                <span class="text-[10px] uppercase tracking-tighter text-emerald-400 font-bold bg-emerald-50 px-2 py-0.5 rounded-md">Verified</span>
                                            <% } else { %>
                                                <input type="hidden" name="action" value="verify">
                                                <button type="submit" class="text-xs font-bold text-blue-500 hover:text-blue-700 transition-colors">Verify Fixer</button>
                                            <% } %>
                                        </form>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>

        <!-- Pagination -->
        <% if ((Integer)request.getAttribute("totalPages") > 1) { %>
            <div class="mt-8 flex items-center justify-center gap-2">
                <% 
                    int current = (Integer)request.getAttribute("currentPage");
                    int total = (Integer)request.getAttribute("totalPages");
                    String searchParam = request.getAttribute("search") != null ? "&search=" + request.getAttribute("search") : "";
                    String roleParam = request.getAttribute("selectedRole") != null ? "&role=" + request.getAttribute("selectedRole") : "";
                %>
                <% for (int i = 1; i <= total; i++) { %>
                    <a href="?page=<%= i %><%= searchParam %><%= roleParam %>" 
                       class="w-10 h-10 flex items-center justify-center rounded-xl font-bold transition-all <%= i == current ? "bg-[#449E80] text-white shadow-lg shadow-[#449E80]/20" : "bg-white text-gray-400 hover:bg-gray-50 border border-gray-100" %>">
                        <%= i %>
                    </a>
                <% } %>
            </div>
        <% } %>
    </main>
</body>
</html>
