<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nearfix.nearfix.model.RepairRequest, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Jobs | NearFix</title>
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
            <div id="availablejobs" class="page-content active">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">Available Jobs</h1>
                        <p class="text-gray-500 text-[15px]">Browse open repair requests and accept new work.</p>
                    </div>
                </div>

                <!-- Search and Filter Bar -->
                <div class="bg-white border border-gray-100 rounded-[2rem] p-6 mb-8 shadow-sm">
                    <form action="<%= request.getContextPath() %>/repairer/available-requests" method="GET" class="flex flex-col md:flex-row gap-4">
                        <div class="flex-1 relative">
                            <i class="ph ph-magnifying-glass absolute left-4 top-1/2 -translate-y-1/2 text-gray-400 text-lg"></i>
                            <input type="text" name="search" value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>" 
                                   placeholder="Search items or descriptions..." 
                                   class="w-full pl-12 pr-4 py-3.5 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#409074] transition-all text-[15px]">
                        </div>
                        <div class="w-full md:w-64">
                            <select name="categoryId" class="w-full px-4 py-3.5 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#409074] transition-all text-[15px] appearance-none">
                                <option value="">All Categories</option>
                                <% 
                                    List<nearfix.nearfix.model.Category> categories = (List<nearfix.nearfix.model.Category>) request.getAttribute("categories");
                                    Integer selectedId = (Integer) request.getAttribute("selectedCategoryId");
                                    if (categories != null) {
                                        for (nearfix.nearfix.model.Category cat : categories) {
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
                        <button type="submit" class="bg-[#409074] hover:bg-[#2F6C56] text-white px-8 py-3.5 rounded-2xl font-bold transition-all shadow-lg shadow-[#409074]/10">
                            Apply
                        </button>
                        <% if (request.getAttribute("search") != null || request.getAttribute("selectedCategoryId") != null) { %>
                            <a href="<%= request.getContextPath() %>/repairer/available-requests" class="bg-gray-100 hover:bg-gray-200 text-gray-600 px-6 py-3.5 rounded-2xl font-bold transition-all text-center">
                                Clear
                            </a>
                        <% } %>
                    </form>
                </div>
                <% 
                    List<RepairRequest> requests = (List<RepairRequest>) request.getAttribute("requests");
                    if (requests == null || requests.isEmpty()) { 
                %>
                    <div class="bg-white border border-gray-100 rounded-3xl py-28 flex flex-col items-center justify-center text-center shadow-sm mt-6">
                        <div class="bg-gray-50 w-14 h-14 rounded-2xl flex items-center justify-center mb-5 border border-gray-100">
                            <i class="ph ph-tray text-[#409074] text-2xl"></i>
                        </div>
                        <h3 class="text-[19px] font-bold text-gray-900 font-serif-custom mb-1.5">No open jobs right now</h3>
                        <p class="text-gray-500 text-[15px]">Check back later for new repair requests.</p>
                    </div>
                <% } else { %>
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                        <% for (RepairRequest req : requests) { %>
                            <div class="bg-white border border-gray-100 rounded-[2rem] p-8 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between">
                                <div>
                                    <div class="flex justify-between items-start mb-4">
                                        <span class="bg-[#F0F9F5] text-[#2F6C56] text-[10px] font-bold px-2.5 py-1 rounded-full uppercase tracking-wider">
                                            <%= req.getCategoryName() != null ? req.getCategoryName() : "General" %>
                                        </span>
                                        <span class="text-xs font-bold <%= "HIGH".equals(req.getUrgency()) ? "text-red-500" : "text-orange-500" %>">
                                            <%= req.getUrgency() %> PRIORITY
                                        </span>
                                    </div>
                                    <h3 class="text-xl font-bold text-gray-900 mb-2"><%= req.getItemName() %></h3>
                                    <p class="text-gray-600 text-sm mb-6 line-clamp-3"><%= req.getDescription() %></p>
                                </div>
                                <form action="<%= request.getContextPath() %>/repairer/" method="POST">
                                    <input type="hidden" name="action" value="accept-request">
                                    <input type="hidden" name="requestId" value="<%= req.getRequestId() %>">
                                    <button type="submit" class="w-full bg-[#409074] hover:bg-[#2F6C56] text-white rounded-2xl py-3.5 flex items-center justify-center gap-2 font-bold transition-all shadow-lg shadow-[#409074]/10">
                                        <i class="ph ph-check-circle text-lg"></i>
                                        Accept This Job
                                    </button>
                                </form>
                            </div>
                        <% } %>
                    </div>
                <% } %>
            </div>
        </div>
    </main>
</body>
</html>
