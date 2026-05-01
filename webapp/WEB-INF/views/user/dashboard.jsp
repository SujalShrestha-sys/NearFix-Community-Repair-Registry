<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | NearFix</title>
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
            <!-- Welcome Section -->
            <header class="mb-10 flex items-end justify-between">
                <div>
                    <h2 class="serif text-4xl text-gray-900 mb-2">Welcome back <span class="inline-block animate-bounce">👋</span></h2>
                    <p class="text-gray-500 font-medium">Here's an overview of your repair requests.</p>
                </div>
                <a href="<%= request.getContextPath() %>/repair-request?action=post" 
                   class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-6 py-3 rounded-xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/>
                    </svg>
                    <span>New Request</span>
                </a>
            </header>

            <% 
                List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");
                int total = (requests != null) ? requests.size() : 0;
                long openCount = (requests != null) ? requests.stream().filter(r -> "PENDING".equals(r.getStatus())).count() : 0;
                long inProgressCount = (requests != null) ? requests.stream().filter(r -> "ACCEPTED".equals(r.getStatus()) || "IN_PROGRESS".equals(r.getStatus())).count() : 0;
                int completedCount = (request.getAttribute("totalCompleted") != null) ? (Integer)request.getAttribute("totalCompleted") : 0;
            %>

            <!-- Stats Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
                <!-- Total Requests -->
                <div class="bg-emerald-50/50 border border-emerald-100/50 p-6 rounded-2xl flex flex-col">
                    <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-emerald-600 shadow-sm mb-6">
                         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/>
                        </svg>
                    </div>
                    <span class="text-3xl font-bold text-gray-900 leading-none mb-1"><%= total %></span>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider">Total Requests</span>
                </div>

                <!-- Open -->
                <div class="bg-orange-50/50 border border-orange-100/50 p-6 rounded-2xl flex flex-col">
                    <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-orange-600 shadow-sm mb-6">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>
                        </svg>
                    </div>
                    <span class="text-3xl font-bold text-gray-900 leading-none mb-1"><%= openCount %></span>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider">Open</span>
                </div>

                <!-- In Progress -->
                <div class="bg-yellow-50/50 border border-yellow-100/50 p-6 rounded-2xl flex flex-col">
                    <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-yellow-600 shadow-sm mb-6">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 12h-4l-3 9L9 3l-3 9H2"/>
                        </svg>
                    </div>
                    <span class="text-3xl font-bold text-gray-900 leading-none mb-1"><%= inProgressCount %></span>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider">In Progress</span>
                </div>

                <!-- Completed -->
                <div class="bg-emerald-50/50 border border-emerald-100/50 p-6 rounded-2xl flex flex-col">
                    <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-emerald-600 shadow-sm mb-6">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 11 12 14 22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/>
                        </svg>
                    </div>
                    <span class="text-3xl font-bold text-gray-900 leading-none mb-1"><%= completedCount %></span>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider">Completed</span>
                </div>
            </div>

            <!-- Recent Requests -->
            <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
                <div class="px-8 py-6 border-b border-gray-50 flex items-center justify-between">
                    <h3 class="font-bold text-gray-900">Recent Requests</h3>
                    <a href="<%= request.getContextPath() %>/repair-request?action=myRequests" class="text-xs font-bold text-gray-400 hover:text-[#449E80] flex items-center gap-1.5 transition-all">
                        <span>View All</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                    </a>
                </div>

                <% if (requests == null || requests.isEmpty()) { %>
                    <div class="px-8 py-24 flex flex-col items-center justify-center text-center">
                        <div class="w-20 h-20 bg-gray-50 rounded-2xl flex items-center justify-center text-gray-300 mb-6">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/>
                            </svg>
                        </div>
                        <h4 class="font-bold text-xl text-gray-900 mb-2">No requests yet</h4>
                        <p class="text-gray-500 mb-8 max-w-xs">Create your first repair request to get started!</p>
                        <a href="<%= request.getContextPath() %>/repair-request?action=post" 
                           class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-8 py-4 rounded-2xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20 active:scale-95">
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
                                    <th class="px-8 py-4">Item</th>
                                    <th class="px-8 py-4">Category</th>
                                    <th class="px-8 py-4">Urgency</th>
                                    <th class="px-8 py-4">Status</th>
                                    <th class="px-8 py-4">Date</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                                <% for (RepairRequest r : requests.subList(0, Math.min(requests.size(), 5))) { %>
                                    <tr class="hover:bg-gray-50/50 transition-colors cursor-pointer group">
                                        <td class="px-8 py-5">
                                            <span class="font-semibold text-gray-900 group-hover:text-[#449E80] transition-colors"><%= r.getItemName() %></span>
                                        </td>
                                        <td class="px-8 py-5">
                                            <span class="text-sm font-medium text-gray-600"><%= r.getCategoryName() %></span>
                                        </td>
                                        <td class="px-8 py-5">
                                            <% 
                                                String urgencyClass = switch(r.getUrgency()) {
                                                    case "HIGH" -> "bg-red-50 text-red-600";
                                                    case "MEDIUM" -> "bg-orange-50 text-orange-600";
                                                    default -> "bg-blue-50 text-blue-600";
                                                };
                                            %>
                                            <span class="text-[10px] font-bold px-2.5 py-1 rounded-full <%= urgencyClass %> tracking-wider">
                                                <%= r.getUrgency() %>
                                            </span>
                                        </td>
                                        <td class="px-8 py-5">
                                            <% 
                                                String statusClass = switch(r.getStatus()) {
                                                    case "COMPLETED" -> "text-emerald-500 bg-emerald-50";
                                                    case "ACCEPTED", "IN_PROGRESS" -> "text-blue-500 bg-blue-50";
                                                    case "CANCELLED" -> "text-gray-500 bg-gray-50";
                                                    default -> "text-orange-500 bg-orange-50";
                                                };
                                            %>
                                            <div class="flex items-center gap-2">
                                                <div class="w-1.5 h-1.5 rounded-full <%= statusClass.split(" ")[0] %>"></div>
                                                <span class="text-xs font-bold <%= statusClass.split(" ")[0] %>"><%= r.getStatus() %></span>
                                            </div>
                                        </td>
                                        <td class="px-8 py-5">
                                            <span class="text-xs font-medium text-gray-400"><%= r.getCreatedAt() %></span>
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
