<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest, nearfix.nearfix.model.Category, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repair Requests | NearFix Admin</title>
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
                <h1 class="serif text-4xl text-gray-900 mb-2">Repair Requests</h1>
                <p class="text-gray-500 font-medium">Monitor and manage all service requests on the platform.</p>
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
            <form action="<%= request.getContextPath() %>/admin/requests" method="GET" class="flex flex-col lg:flex-row gap-4">
                <div class="flex-1 relative">
                    <i class="ph ph-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-lg"></i>
                    <input type="text" name="search" value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>" 
                           placeholder="Search by item name or description..." 
                           class="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm">
                </div>
                <div class="w-full lg:w-48">
                    <select name="categoryId" class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm appearance-none">
                        <option value="">All Categories</option>
                        <% 
                            List<Category> categories = (List<Category>) request.getAttribute("categories");
                            Integer selectedId = (Integer) request.getAttribute("selectedCategoryId");
                            if (categories != null) {
                                for (Category cat : categories) {
                        %>
                            <option value="<%= cat.getCategoryId() %>" <%= (selectedId != null && selectedId == cat.getCategoryId()) ? "selected" : "" %>>
                                <%= cat.getName() %>
                            </option>
                        <% 
                                }
                            } 
                        %>
                    </select>
                </div>
                <div class="w-full lg:w-48">
                    <select name="status" class="w-full px-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm appearance-none">
                        <option value="">All Statuses</option>
                        <option value="PENDING" <%= "PENDING".equals(request.getAttribute("selectedStatus")) ? "selected" : "" %>>Pending</option>
                        <option value="ACCEPTED" <%= "ACCEPTED".equals(request.getAttribute("selectedStatus")) ? "selected" : "" %>>Accepted</option>
                        <option value="IN_PROGRESS" <%= "IN_PROGRESS".equals(request.getAttribute("selectedStatus")) ? "selected" : "" %>>In Progress</option>
                        <option value="COMPLETED" <%= "COMPLETED".equals(request.getAttribute("selectedStatus")) ? "selected" : "" %>>Completed</option>
                        <option value="CANCELLED" <%= "CANCELLED".equals(request.getAttribute("selectedStatus")) ? "selected" : "" %>>Cancelled</option>
                    </select>
                </div>
                <button type="submit" class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-8 py-3 rounded-2xl font-bold transition-all shadow-lg shadow-[#449E80]/10">
                    Filter
                </button>
                <% if (request.getAttribute("search") != null || request.getAttribute("selectedCategoryId") != null || request.getAttribute("selectedStatus") != null) { %>
                    <a href="<%= request.getContextPath() %>/admin/requests" class="bg-gray-100 hover:bg-gray-200 text-gray-600 px-6 py-3 rounded-2xl font-bold transition-all text-center flex items-center justify-center">
                        Clear
                    </a>
                <% } %>
            </form>
        </div>

        <!-- Requests Table -->
        <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
            <% 
                List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");
                if (requests == null || requests.isEmpty()) { 
            %>
                <div class="p-24 text-center">
                    <div class="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-6">
                        <i class="ph ph-file-search text-gray-300 text-3xl"></i>
                    </div>
                    <h3 class="text-xl font-bold text-gray-900 mb-2">No requests found</h3>
                    <p class="text-gray-500">Try adjusting your search or filters.</p>
                </div>
            <% } else { %>
                <table class="w-full text-left">
                    <thead class="bg-gray-50 text-[10px] uppercase tracking-widest font-bold text-gray-400">
                        <tr>
                            <th class="px-8 py-5">Request</th>
                            <th class="px-8 py-5">User</th>
                            <th class="px-8 py-5">Category</th>
                            <th class="px-8 py-5">Status</th>
                            <th class="px-8 py-5 text-right">Date</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                        <% for (RepairRequest r : requests) { %>
                            <tr class="hover:bg-gray-50/50 transition-colors">
                                <td class="px-8 py-6">
                                    <div class="flex flex-col">
                                        <span class="font-bold text-gray-900"><%= r.getItemName() %></span>
                                        <span class="text-xs text-gray-400 line-clamp-1"><%= r.getDescription() %></span>
                                    </div>
                                </td>
                                <td class="px-8 py-6 text-sm text-gray-600">
                                    <%= r.getUserName() %>
                                </td>
                                <td class="px-8 py-6">
                                    <span class="text-xs font-semibold text-gray-500"><%= r.getCategoryName() %></span>
                                </td>
                                <td class="px-8 py-6">
                                    <% 
                                        String statusClass = switch(r.getStatus()) {
                                            case "COMPLETED" -> "text-emerald-500 bg-emerald-50";
                                            case "ACCEPTED", "IN_PROGRESS" -> "text-blue-500 bg-blue-50";
                                            case "CANCELLED" -> "text-gray-500 bg-gray-50";
                                            default -> "text-orange-500 bg-orange-50";
                                        };
                                    %>
                                    <span class="text-[10px] font-bold px-2.5 py-1 rounded-full uppercase tracking-wider <%= statusClass %>">
                                        <%= r.getStatus() %>
                                    </span>
                                </td>
                                <td class="px-8 py-6 text-right">
                                    <span class="text-xs text-gray-400"><%= r.getCreatedAt() %></span>
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
                    String catParam = request.getAttribute("selectedCategoryId") != null ? "&categoryId=" + request.getAttribute("selectedCategoryId") : "";
                    String statusParam = request.getAttribute("selectedStatus") != null ? "&status=" + request.getAttribute("selectedStatus") : "";
                %>
                <% for (int i = 1; i <= total; i++) { %>
                    <a href="?page=<%= i %><%= searchParam %><%= catParam %><%= statusParam %>" 
                       class="w-10 h-10 flex items-center justify-center rounded-xl font-bold transition-all <%= i == current ? "bg-[#449E80] text-white shadow-lg shadow-[#449E80]/20" : "bg-white text-gray-400 hover:bg-gray-50 border border-gray-100" %>">
                        <%= i %>
                    </a>
                <% } %>
            </div>
        <% } %>
    </main>
</body>
</html>
