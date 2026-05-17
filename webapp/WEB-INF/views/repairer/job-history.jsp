<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job History | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .serif { font-family: 'Playfair Display', serif; }
    </style>
</head>
<body class="bg-[#F9FAFB] flex min-h-screen">

<jsp:include page="layout/sidebar.jsp" />

<main class="lg:ml-[260px] flex-1 flex flex-col min-w-0">
    <jsp:include page="layout/navbar.jsp" />

    <div class="px-8 py-10 max-w-7xl">
        <!-- Page Header -->
        <header class="mb-10 flex items-end justify-between">
            <div>
                <h2 class="serif text-4xl text-gray-900 mb-2">Job History</h2>
                <p class="text-gray-500 font-medium">Review your past completed and cancelled repair jobs.</p>
            </div>
        </header>

        <!-- Stats/Summary Bar -->
        <%
            List<RepairRequest> jobHistory = (List<RepairRequest>) request.getAttribute("jobHistory");
            int totalHistory = (jobHistory != null) ? jobHistory.size() : 0;
            long completedCount = (jobHistory != null) ? jobHistory.stream().filter(r -> "COMPLETED".equals(r.getStatus())).count() : 0;
            long cancelledCount = (jobHistory != null) ? jobHistory.stream().filter(r -> "CANCELLED".equals(r.getStatus())).count() : 0;
        %>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white border border-gray-100 p-6 rounded-2xl flex items-center justify-between shadow-sm">
                <div>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider block mb-1">Total History</span>
                    <span class="text-2xl font-bold text-gray-900 leading-none"><%= totalHistory %></span>
                </div>
                <div class="w-10 h-10 bg-gray-50 rounded-xl flex items-center justify-center text-gray-400">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>
            </div>
            <div class="bg-emerald-50/50 border border-emerald-100/50 p-6 rounded-2xl flex items-center justify-between shadow-sm">
                <div>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider block mb-1">Successfully Fixed</span>
                    <span class="text-2xl font-bold text-emerald-600 leading-none"><%= completedCount %></span>
                </div>
                <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-emerald-500 shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/>
                    </svg>
                </div>
            </div>
            <div class="bg-gray-50/50 border border-gray-100/50 p-6 rounded-2xl flex items-center justify-between shadow-sm">
                <div>
                    <span class="text-xs font-semibold text-gray-400 uppercase tracking-wider block mb-1">Cancelled</span>
                    <span class="text-2xl font-bold text-gray-600 leading-none"><%= cancelledCount %></span>
                </div>
                <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center text-gray-500 shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/>
                    </svg>
                </div>
            </div>
        </div>

        <!-- Content Area -->
        <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
            <% if (jobHistory == null || jobHistory.isEmpty()) { %>
            <div class="px-8 py-32 flex flex-col items-center justify-center text-center">
                <div class="w-24 h-24 bg-gray-50 rounded-3xl flex items-center justify-center text-gray-300 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                </div>
                <h4 class="font-bold text-2xl text-gray-900 mb-3">No job history yet</h4>
                <p class="text-gray-500 mb-10 max-w-sm">Completed and cancelled requests will appear here.</p>
                <a href="<%= request.getContextPath() %>/repair-request?action=myRequests"
                   class="bg-[#449E80] hover:bg-[#3d8b70] text-white px-10 py-4 rounded-2xl font-bold transition-all flex items-center gap-2 shadow-lg shadow-[#449E80]/20 active:scale-95">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="19" y1="12" x2="5" y2="12"/><polyline points="12 19 5 12 12 5"/>
                    </svg>
                    <span>Back to My Requests</span>
                </a>
            </div>
            <% } else { %>
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 text-[10px] uppercase tracking-widest font-bold text-gray-400">
                    <tr>
                        <th class="px-8 py-5">Item Name</th>
                        <th class="px-8 py-5">Category</th>
                        <th class="px-8 py-5">Status</th>
                        <th class="px-8 py-5">Completed On</th>
                        <th class="px-8 py-5 text-right">Actions</th>
                    </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-50">
                    <% for (RepairRequest r : jobHistory) { %>
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
                                String statusClass = "";
                                if ("COMPLETED".equals(r.getStatus())) {
                                    statusClass = "text-emerald-500 bg-emerald-50";
                                } else if ("CANCELLED".equals(r.getStatus())) {
                                    statusClass = "text-gray-500 bg-gray-50";
                                } else {
                                    statusClass = "text-orange-500 bg-orange-50";
                                }
                            %>
                            <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl <%= statusClass %>">
                                <div class="w-1.5 h-1.5 rounded-full fill-current"></div>
                                <span class="text-xs font-bold uppercase tracking-wide"><%= r.getStatus() %></span>
                            </div>
                        </td>
                        <td class="px-8 py-6">
                            <span class="text-xs font-medium text-gray-500"><%= r.getCreatedAt() %></span>
                        </td>
                        <td class="px-8 py-6 text-right">
                            <a href="<%= request.getContextPath() %>/repair-request?action=view&id=<%= r.getRequestId() %>"
                               class="text-gray-400 hover:text-[#449E80] transition-colors p-2 hover:bg-[#449E80]/5 rounded-lg inline-block"
                               title="View Details">
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
