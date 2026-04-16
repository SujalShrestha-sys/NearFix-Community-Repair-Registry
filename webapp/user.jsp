<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="nearfix.nearfix.model.RepairRequest" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");
    String userRole = (String) session.getAttribute("userRole");
    List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");

    int totalRequests = 0, openCount = 0, inProgressCount = 0, completedCount = 0;
    if (requests != null) {
        totalRequests = requests.size();
        for (RepairRequest r : requests) {
            String status = r.getStatus();
            if ("PENDING".equalsIgnoreCase(status)) openCount++;
            else if ("IN_PROGRESS".equalsIgnoreCase(status)) inProgressCount++;
            else if ("COMPLETED".equalsIgnoreCase(status)) completedCount++;
        }
    }
    int recentLimit = requests != null ? Math.min(requests.size(), 5) : 0;
    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Portal | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>body{font-family:'Inter',sans-serif;}</style>
</head>
<body class="bg-gray-50 antialiased">

<div class="flex min-h-screen">

    <!-- ===== SIDEBAR ===== -->
    <aside class="hidden md:flex w-[220px] flex-col fixed inset-y-0 left-0 bg-white border-r border-gray-100 z-40">
        <!-- Logo -->
        <div class="flex items-center gap-2.5 px-6 pt-6 pb-1">
            <div class="w-8 h-8 bg-[#449E80] rounded-[10px] flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
            </div>
            <span class="text-lg font-bold text-gray-900">NearFix</span>
        </div>
        <p class="px-6 text-[11px] font-medium text-gray-400 uppercase tracking-wider mb-5">User Portal</p>

        <!-- Nav Label -->
        <p class="px-6 text-[11px] font-semibold text-gray-300 uppercase tracking-wider mb-2">Navigation</p>

        <!-- Nav Links -->
        <nav class="flex flex-col">
            <a href="<%= request.getContextPath() %>/user/dashboard.jsp" class="flex items-center gap-3 px-6 py-2.5 text-sm font-semibold text-[#449E80] bg-emerald-50/70 border-l-[3px] border-[#449E80]">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                Dashboard
            </a>
            <a href="<%= request.getContextPath() %>/repair-request?action=post" class="flex items-center gap-3 px-6 py-2.5 text-sm font-medium text-gray-500 border-l-[3px] border-transparent hover:text-[#449E80] hover:bg-emerald-50/40 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg>
                New Request
            </a>
            <a href="<%= request.getContextPath() %>/repair-request?action=myRequests" class="flex items-center gap-3 px-6 py-2.5 text-sm font-medium text-gray-500 border-l-[3px] border-transparent hover:text-[#449E80] hover:bg-emerald-50/40 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
                My Requests
            </a>
            <a href="<%= request.getContextPath() %>/user/profile.jsp" class="flex items-center gap-3 px-6 py-2.5 text-sm font-medium text-gray-500 border-l-[3px] border-transparent hover:text-[#449E80] hover:bg-emerald-50/40 transition-all">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-[18px] h-[18px]" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                Profile
            </a>
        </nav>
    </aside>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="md:ml-[220px] flex-1 flex flex-col min-h-screen">

        <!-- Top Header -->
        <header class="flex items-center justify-between px-8 py-4 bg-white border-b border-gray-100 sticky top-0 z-30">
            <div class="flex items-center gap-2.5 text-gray-700 text-[15px] font-semibold">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#9ca3af" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                User Portal
            </div>
            <div class="flex items-center gap-5">
                <a href="<%= request.getContextPath() %>/" class="text-gray-400 hover:text-[#449E80] transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
                </a>
                <div class="flex items-center gap-2 bg-gray-100 rounded-full px-3.5 py-1.5">
                    <div class="w-7 h-7 rounded-full bg-[#449E80] text-white flex items-center justify-center text-xs font-bold">
                        <%= userEmail != null && !userEmail.isEmpty() ? userEmail.substring(0, 1).toUpperCase() : "U" %>
                    </div>
                    <span class="text-[13px] font-medium text-gray-700"><%= userEmail != null ? (userEmail.length() > 18 ? userEmail.substring(0, 18) + "..." : userEmail) : "user@email.com" %></span>
                </div>
                <a href="<%= request.getContextPath() %>/logout" class="flex items-center gap-1.5 text-[13px] font-medium text-gray-500 hover:text-red-500 transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
                    Sign Out
                </a>
            </div>
        </header>

        <!-- Dashboard Content -->
        <div class="p-8">

            <!-- Welcome + New Request -->
            <div class="flex items-start justify-between mb-7">
                <div>
                    <h1 class="text-[28px] font-bold text-gray-900 mb-1">Welcome back &#x1F44B;</h1>
                    <p class="text-sm text-gray-400">Here's an overview of your repair requests.</p>
                </div>
                <a href="<%= request.getContextPath() %>/repair-request?action=post" class="inline-flex items-center gap-2 px-5 py-2.5 bg-[#449E80] hover:bg-[#3d8b70] text-white text-sm font-semibold rounded-xl transition-all hover:-translate-y-0.5">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg>
                    New Request
                </a>
            </div>

            <!-- Stat Cards -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-8">
                <!-- Total Requests -->
                <div class="rounded-2xl p-6 bg-gradient-to-br from-emerald-100 to-emerald-200/60">
                    <div class="w-9 h-9 rounded-[10px] bg-[#449E80] text-white flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
                    </div>
                    <div class="text-[28px] font-bold text-gray-900 mb-1"><%= totalRequests %></div>
                    <div class="text-[13px] font-medium text-gray-500">Total Requests</div>
                </div>

                <!-- Open -->
                <div class="rounded-2xl p-6 bg-gradient-to-br from-amber-100 to-orange-200/50">
                    <div class="w-9 h-9 rounded-[10px] bg-amber-500 text-white flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                    </div>
                    <div class="text-[28px] font-bold text-gray-900 mb-1"><%= openCount %></div>
                    <div class="text-[13px] font-medium text-gray-500">Open</div>
                </div>

                <!-- In Progress -->
                <div class="rounded-2xl p-6 bg-gradient-to-br from-yellow-100 to-yellow-200/50">
                    <div class="w-9 h-9 rounded-[10px] bg-yellow-500 text-white flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
                    </div>
                    <div class="text-[28px] font-bold text-gray-900 mb-1"><%= inProgressCount %></div>
                    <div class="text-[13px] font-medium text-gray-500">In Progress</div>
                </div>

                <!-- Completed -->
                <div class="rounded-2xl p-6 bg-gradient-to-br from-emerald-50 to-green-200/50">
                    <div class="w-9 h-9 rounded-[10px] bg-green-500 text-white flex items-center justify-center mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                    </div>
                    <div class="text-[28px] font-bold text-gray-900 mb-1"><%= completedCount %></div>
                    <div class="text-[13px] font-medium text-gray-500">Completed</div>
                </div>
            </div>

            <!-- Recent Requests -->
            <div class="bg-white rounded-2xl border border-gray-100 p-7">
                <div class="flex items-center justify-between mb-5">
                    <h3 class="text-base font-bold text-gray-900">Recent Requests</h3>
                    <a href="<%= request.getContextPath() %>/repair-request?action=myRequests" class="flex items-center gap-1 text-[13px] font-semibold text-[#449E80] hover:gap-2 transition-all">
                        View All
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                    </a>
                </div>

                <% if (requests == null || requests.isEmpty()) { %>
                    <!-- Empty State -->
                    <div class="flex flex-col items-center justify-center py-16">
                        <div class="w-14 h-14 bg-gray-100 rounded-full flex items-center justify-center mb-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="#d1d5db" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 001.71 3h16.94a2 2 0 001.71-3L13.71 3.86a2 2 0 00-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
                        </div>
                        <h4 class="text-[15px] font-bold text-gray-900 mb-1">No requests yet</h4>
                        <p class="text-[13px] text-gray-400 mb-5">Create your first repair request to get started!</p>
                        <a href="<%= request.getContextPath() %>/repair-request?action=post" class="inline-flex items-center gap-2 px-6 py-2.5 bg-[#449E80] hover:bg-[#3d8b70] text-white text-sm font-semibold rounded-xl transition-all hover:-translate-y-0.5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="16"/><line x1="8" y1="12" x2="16" y2="12"/></svg>
                            Create Request
                        </a>
                    </div>
                <% } else { %>
                    <!-- Requests Table -->
                    <table class="w-full">
                        <thead>
                            <tr>
                                <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-wide px-4 py-3 border-b border-gray-100">Item</th>
                                <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-wide px-4 py-3 border-b border-gray-100">Category</th>
                                <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-wide px-4 py-3 border-b border-gray-100">Urgency</th>
                                <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-wide px-4 py-3 border-b border-gray-100">Status</th>
                                <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-wide px-4 py-3 border-b border-gray-100">Date</th>
                                <th class="px-4 py-3 border-b border-gray-100"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < recentLimit; i++) {
                                RepairRequest rr = requests.get(i);
                                String st = rr.getStatus() != null ? rr.getStatus() : "PENDING";
                                String badgeBg = "bg-amber-100 text-amber-700";
                                String dotBg = "bg-amber-500";
                                if ("IN_PROGRESS".equalsIgnoreCase(st)) { badgeBg = "bg-sky-100 text-sky-700"; dotBg = "bg-sky-500"; }
                                else if ("COMPLETED".equalsIgnoreCase(st)) { badgeBg = "bg-green-100 text-green-700"; dotBg = "bg-green-500"; }
                                else if ("CANCELLED".equalsIgnoreCase(st)) { badgeBg = "bg-red-100 text-red-700"; dotBg = "bg-red-500"; }
                            %>
                            <tr class="hover:bg-gray-50/60">
                                <td class="px-4 py-3.5 text-sm font-semibold text-gray-700 border-b border-gray-50"><%= rr.getItemName() != null ? rr.getItemName() : "-" %></td>
                                <td class="px-4 py-3.5 text-sm text-gray-600 border-b border-gray-50"><%= rr.getCategoryName() != null ? rr.getCategoryName() : "-" %></td>
                                <td class="px-4 py-3.5 text-xs font-medium text-gray-500 border-b border-gray-50"><%= rr.getUrgency() != null ? rr.getUrgency() : "-" %></td>
                                <td class="px-4 py-3.5 border-b border-gray-50">
                                    <span class="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold <%= badgeBg %>">
                                        <span class="w-1.5 h-1.5 rounded-full <%= dotBg %>"></span>
                                        <%= st.replace("_", " ") %>
                                    </span>
                                </td>
                                <td class="px-4 py-3.5 text-[13px] text-gray-400 border-b border-gray-50"><%= rr.getCreatedAt() != null ? sdf.format(rr.getCreatedAt()) : "-" %></td>
                                <td class="px-4 py-3.5 border-b border-gray-50">
                                    <a href="<%= request.getContextPath() %>/repair-request?action=view&id=<%= rr.getRequestId() %>" class="text-[13px] font-semibold text-[#449E80] hover:underline">View &rarr;</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } %>
            </div>
        </div>
    </div>
</div>

</body>
</html>
