<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.Repairer, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repairer Directory | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; } .serif { font-family: 'Playfair Display', serif; }</style>
</head>
<body class="bg-[#F9FAFB] flex min-h-screen">
    <jsp:include page="layout/sidebar.jsp" />
    <main class="flex-1 flex flex-col min-w-0">
        <jsp:include page="layout/header.jsp" />
        <div class="px-8 py-10 max-w-7xl mx-auto w-full">
            <header class="mb-10">
                <h2 class="serif text-4xl text-gray-900 mb-2">Find a Repairer</h2>
                <p class="text-gray-500 font-medium">Browse skilled professionals in your community.</p>
            </header>

            <!-- Search Bar -->
            <div class="bg-white border border-gray-100 rounded-3xl p-6 mb-8 shadow-sm">
                <form action="<%= request.getContextPath() %>/user/repairers" method="GET" class="flex gap-4">
                    <div class="flex-1 relative">
                        <input type="text" name="search" value="<%= request.getAttribute("search") != null ? request.getAttribute("search") : "" %>" 
                               placeholder="Search by name, skill, or expertise (e.g. 'tailor', 'electronics')..." 
                               class="w-full pl-6 pr-4 py-3 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm">
                    </div>
                    <button type="submit" class="bg-[#449E80] text-white px-8 py-3 rounded-2xl font-bold hover:bg-[#3d8b70] transition-all">Search</button>
                </form>
            </div>

            <!-- Repairer Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <% 
                    List<Repairer> repairers = (List<Repairer>) request.getAttribute("repairers");
                    if (repairers == null || repairers.isEmpty()) {
                %>
                    <div class="col-span-full py-20 text-center">
                        <p class="text-gray-500 italic">No repairers found matching your search.</p>
                    </div>
                <% } else { 
                    for (Repairer r : repairers) { %>
                    <div class="bg-white border border-gray-100 rounded-3xl p-6 shadow-sm hover:shadow-md transition-all group">
                        <div class="flex items-center gap-4 mb-4">
                            <div class="w-14 h-14 bg-[#449E80]/10 text-[#449E80] rounded-2xl flex items-center justify-center font-bold text-xl">
                                <%= r.getName().substring(0, 1) %>
                            </div>
                            <div>
                                <h4 class="font-bold text-gray-900 group-hover:text-[#449E80] transition-colors"><%= r.getName() %></h4>
                                <div class="flex items-center gap-1 text-xs text-amber-500 font-bold">
                                    <span>★</span> <span><%= String.format("%.1f", r.getRating()) %></span>
                                    <span class="text-gray-400 font-medium ml-1">(<%= r.getTotalJobsCompleted() %> jobs)</span>
                                </div>
                            </div>
                        </div>
                        <div class="mb-6">
                            <span class="text-[10px] font-bold uppercase tracking-widest text-gray-400 block mb-1">Specialization</span>
                            <p class="text-sm text-gray-700 font-semibold"><%= r.getSpecialization() %></p>
                        </div>
                        <div class="mb-6">
                            <span class="text-[10px] font-bold uppercase tracking-widest text-gray-400 block mb-1">Expertise</span>
                            <p class="text-xs text-gray-500 line-clamp-2"><%= r.getExpertise() %></p>
                        </div>
                        <a href="<%= request.getContextPath() %>/repair-request?action=post" 
                           class="block w-full py-3 text-center bg-gray-50 text-[#449E80] rounded-xl font-bold text-sm hover:bg-[#449E80] hover:text-white transition-all">
                            Hire Repairer
                        </a>
                    </div>
                <% } } %>
            </div>
        </div>
    </main>
</body>
</html>
