<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Requests | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .serif { font-family: 'Playfair Display', serif; }
    </style>
</head>
<body class="bg-[#F9FAFB] flex min-h-screen">

    <jsp:include page="layout/sidebar.jsp" />

    <main class="flex-1 flex flex-col min-w-0">
        <jsp:include page="layout/header.jsp" />

        <div class="px-8 py-10 max-w-7xl">
            <!-- Page Header -->
            <header class="mb-10 flex items-end justify-between">
                <div>
                    <h2 class="serif text-4xl text-gray-900 mb-2">My Requests</h2>
                    <p class="text-gray-500 font-medium">Track and manage all your repair requests.</p>
                </div>
                <a href="<%= request.getContextPath() %>/repair-request?action=post" 
                   class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-6 py-3 rounded-xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/>
                    </svg>
                    <span>New Request</span>
                </a>
            </header>

            <!-- Search and Filter Bar -->
            <div class="bg-white border border-gray-100 rounded-3xl p-6 mb-8 shadow-sm">
                <form action="<%= request.getContextPath() %>/repair-request" method="GET" class="flex flex-col md:flex-row gap-4">
                    <input type="hidden" name="action" value="myRequests">
                    <div class="flex-1 relative">
                        <svg xmlns="http://www.w3.org/2000/svg" class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                        <input type="text" name="search" value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>" 
                               placeholder="Search your requests..." 
                               class="w-full pl-12 pr-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm">
                    </div>
                    <div class="w-full md:w-48">
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
                        Apply
                    </button>
                    <% if (request.getAttribute("search") != null || request.getAttribute("selectedStatus") != null) { %>
                        <a href="<%= request.getContextPath() %>/repair-request?action=myRequests" class="bg-gray-100 hover:bg-gray-200 text-gray-600 px-6 py-3 rounded-2xl font-bold transition-all text-center flex items-center justify-center">
                            Clear
                        </a>
                    <% } %>
                </form>
            </div>

            <% 
                List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");
            %>

            <!-- Content Area -->
            <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
                <% if (requests == null || requests.isEmpty()) { %>
                    <div class="px-8 py-32 flex flex-col items-center justify-center text-center">
                        <div class="w-24 h-24 bg-gray-50 rounded-3xl flex items-center justify-center text-gray-300 mb-6">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 8V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v3"/><path d="m21 12-9-4-9 4"/><path d="m21 16-9-4-9 4"/><path d="M5 21h14a2 2 0 0 0 2-2v-3H3v3a2 2 0 0 0 2 2z"/>
                            </svg>
                        </div>
                        <h4 class="font-bold text-2xl text-gray-900 mb-3">No requests yet</h4>
                        <p class="text-gray-500 mb-10 max-w-sm">Submit your first repair request to get started.</p>
                        <a href="<%= request.getContextPath() %>/repair-request?action=post" 
                           class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-10 py-4 rounded-2xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20 active:scale-95">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/>
                            </svg>
                            <span>Create Request</span>
                        </a>
                    </div>
                <% } else { %>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead class="bg-gray-50 text-[10px] uppercase tracking-widest font-bold text-gray-400">
                                <tr>
                                    <th class="px-8 py-5">Item Name</th>
                                    <th class="px-8 py-5">Category</th>
                                    <th class="px-8 py-5">Urgency</th>
                                    <th class="px-8 py-5">Status</th>
                                    <th class="px-8 py-5">Submitted On</th>
                                    <th class="px-8 py-5 text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                                <% for (RepairRequest r : requests) { %>
                                    <tr class="hover:bg-gray-50/50 transition-colors group">
                                        <td class="px-8 py-6">
                                            <div class="flex flex-col">
                                                <span class="font-bold text-gray-900 group-hover:text-[#449E80] transition-colors"><%= r.getItemName() %></span>
                                                <span class="text-xs text-gray-400 line-clamp-1"><%= r.getDescription() %></span>
                                            </div>
                                        </td>
                                        <td class="px-8 py-6">
                                            <span class="text-sm font-semibold text-gray-600"><%= r.getCategoryName() %></span>
                                        </td>
                                        <td class="px-8 py-6">
                                            <% 
                                                String urgencyClass = switch(r.getUrgency()) {
                                                    case "HIGH" -> "bg-red-50 text-red-600";
                                                    case "MEDIUM" -> "bg-orange-50 text-orange-600";
                                                    default -> "bg-blue-50 text-blue-600";
                                                };
                                            %>
                                            <span class="text-[10px] font-bold px-3 py-1.5 rounded-full <%= urgencyClass %> tracking-wider">
                                                <%= r.getUrgency() %>
                                            </span>
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
                                            <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl <%= statusClass %>">
                                                <div class="w-1.5 h-1.5 rounded-full fill-current"></div>
                                                <span class="text-xs font-bold uppercase tracking-wide"><%= r.getStatus() %></span>
                                            </div>
                                        </td>
                                        <td class="px-8 py-6">
                                            <span class="text-xs font-medium text-gray-400"><%= r.getCreatedAt() %></span>
                                        </td>
                                        <td class="px-8 py-6 text-right">
                                            <a href="<%= request.getContextPath() %>/repair-request?action=view&id=<%= r.getRequestId() %>" 
                                               class="text-gray-400 hover:text-[#449E80] transition-colors p-2 hover:bg-[#449E80]/5 rounded-lg inline-block">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/><circle cx="12" cy="12" r="3"/></svg>
                                            </a>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>
        </div>
    </main>

</body>
</html>
