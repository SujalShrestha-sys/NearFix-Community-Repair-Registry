<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nearfix.nearfix.model.RepairRequest, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Jobs | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap');
        body { font-family: 'Inter', sans-serif; background-color: #FAFAFA; }
        .font-serif-custom { font-family: 'Playfair Display', serif; }
    </style>
</head>
<body class="flex h-screen overflow-hidden text-gray-800">
    <jsp:include page="layout/sidebar.jsp" />
    <main class="flex-1 flex flex-col h-full relative bg-[#FAFAFA]">
        <jsp:include page="layout/header.jsp" />
        <div class="flex-1 overflow-y-auto px-8 pb-12">
            <div id="myjobs" class="page-content active">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">My Jobs</h1>
                        <p class="text-gray-500 text-[15px]">Manage and complete your accepted repair jobs.</p>
                    </div>
                </div>
                <% 
                    List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");
                    if (requests == null || requests.isEmpty()) { 
                %>
                    <div class="bg-white border border-gray-100 rounded-3xl py-28 flex flex-col items-center justify-center text-center shadow-sm mt-6">
                        <div class="bg-gray-50 w-14 h-14 rounded-2xl flex items-center justify-center mb-5 border border-gray-100">
                            <i class="ph ph-package text-[#409074] text-2xl"></i>
                        </div>
                        <h3 class="text-[19px] font-bold text-gray-900 font-serif-custom mb-1.5">No jobs accepted yet</h3>
                        <p class="text-gray-500 text-[15px]">Browse available jobs to start working.</p>
                    </div>
                <% } else { %>
                    <div class="bg-white border border-gray-100 rounded-3xl overflow-hidden shadow-sm">
                        <table class="w-full text-left">
                            <thead class="bg-gray-50/50 border-b border-gray-100">
                                <tr>
                                    <th class="px-8 py-4 text-[11px] font-bold text-gray-400 uppercase tracking-widest">Item / Request</th>
                                    <th class="px-8 py-4 text-[11px] font-bold text-gray-400 uppercase tracking-widest">Customer</th>
                                    <th class="px-8 py-4 text-[11px] font-bold text-gray-400 uppercase tracking-widest">Status</th>
                                    <th class="px-8 py-4 text-[11px] font-bold text-gray-400 uppercase tracking-widest">Action</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                                <% for (RepairRequest req : requests) { %>
                                    <tr class="hover:bg-gray-50/50 transition-colors">
                                        <td class="px-8 py-6">
                                            <div class="flex flex-col">
                                                <span class="font-bold text-gray-900 mb-0.5"><%= req.getItemName() %></span>
                                                <span class="text-xs text-gray-400"><%= req.getCategoryName() %> • <%= req.getUrgency() %></span>
                                            </div>
                                        </td>
                                        <td class="px-8 py-6">
                                            <span class="text-sm text-gray-600 font-medium"><%= req.getUserName() %></span>
                                        </td>
                                        <td class="px-8 py-6">
                                            <span class="bg-[#F0F9F5] text-[#2F6C56] text-[10px] font-bold px-2 py-1 rounded-md uppercase"><%= req.getStatus() %></span>
                                        </td>
                                        <td class="px-8 py-6">
                                            <% if (!"COMPLETED".equals(req.getStatus())) { %>
                                                <form action="<%= request.getContextPath() %>/repairer/" method="POST">
                                                    <input type="hidden" name="action" value="complete-request">
                                                    <input type="hidden" name="requestId" value="<%= req.getRequestId() %>">
                                                    <button type="submit" class="text-[#409074] hover:text-[#2F6C56] text-sm font-bold flex items-center gap-1.5 transition-colors">
                                                        Mark Completed <i class="ph ph-check-circle text-base"></i>
                                                    </button>
                                                </form>
                                            <% } else { %>
                                                <span class="text-gray-300 text-sm italic font-medium">No actions</span>
                                            <% } %>
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
