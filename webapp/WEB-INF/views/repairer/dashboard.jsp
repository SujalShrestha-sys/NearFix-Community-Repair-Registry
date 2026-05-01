<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nearfix.nearfix.model.Repairer, nearfix.nearfix.model.RepairRequest, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repairer Dashboard | NearFix</title>
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
            <% 
                Repairer repairer = (Repairer) request.getAttribute("repairer");
                List<RepairRequest> recentJobs = (List<RepairRequest>) request.getAttribute("recentJobs");
            %>
            <div id="dashboard" class="page-content active">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">Welcome back, <%= (repairer != null) ? repairer.getName() : "Repairer" %>!</h1>
                        <p class="text-gray-500 text-[15px]">Find jobs and manage your repairs.</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/repairer/available-requests" class="bg-[#409074] hover:bg-[#2F6C56] text-white px-5 py-2.5 rounded-xl flex items-center gap-2 font-medium transition-colors shadow-sm text-sm">
                        <i class="ph ph-magnifying-glass text-lg"></i>
                        Browse Jobs
                    </a>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
                    <div class="bg-[#FCF5F0] p-6 rounded-2xl border border-[#FBE8DB] shadow-sm">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-magnifying-glass text-[#E08A56] text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1">Available</h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Jobs in your area</p>
                    </div>
                    <div class="bg-[#F2F7F5] p-6 rounded-2xl border border-[#E3ECE7] shadow-sm">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-wrench text-[#409074] text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1">Active</h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Ongoing repairs</p>
                    </div>
                    <div class="bg-[#F0F9F3] p-6 rounded-2xl border border-[#DCF0E3] shadow-sm">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-check-circle text-[#409074] text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1"><%= (repairer != null) ? repairer.getTotalJobsCompleted() : 0 %></h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Jobs Completed</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
