<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Details | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Inter', sans-serif; } .serif { font-family: 'Playfair Display', serif; }</style>
</head>
<body class="bg-[#F9FAFB] flex min-h-screen">
    <jsp:include page="layout/sidebar.jsp" />
    <main class="flex-1 flex flex-col min-w-0">
        <jsp:include page="layout/header.jsp" />
        <div class="px-8 py-10 max-w-4xl mx-auto w-full">
            <% 
                RepairRequest req = (RepairRequest) request.getAttribute("repairRequest");
                if (req == null) {
            %>
                <div class="bg-white p-12 rounded-3xl text-center">
                    <h2 class="serif text-2xl mb-4">Request Not Found</h2>
                    <a href="<%= request.getContextPath() %>/user/dashboard" class="text-[#449E80] font-bold">Back to Dashboard</a>
                </div>
            <% } else { %>
                <div class="flex items-center justify-between mb-8">
                    <h2 class="serif text-4xl text-gray-900"><%= req.getItemName() %></h2>
                    <span class="text-xs font-bold px-4 py-2 bg-gray-100 rounded-full text-gray-500 uppercase tracking-widest"><%= req.getStatus() %></span>
                </div>

                <!-- Visual Status Tracker (CSS Only) -->
                <div class="bg-white border border-gray-100 rounded-3xl p-8 shadow-sm mb-8">
                    <div class="flex items-center justify-between relative">
                        <div class="absolute top-1/2 left-0 w-full h-0.5 bg-gray-100 -translate-y-1/2 z-0"></div>
                        <% 
                            String[] statuses = {"PENDING", "ACCEPTED", "IN_PROGRESS", "COMPLETED"};
                            int currentStep = 0;
                            for(int i=0; i<statuses.length; i++) {
                                if(req.getStatus().equals(statuses[i])) currentStep = i;
                            }
                            if("CANCELLED".equals(req.getStatus())) currentStep = -1;

                            for(int i=0; i<statuses.length; i++) {
                                boolean isPast = i <= currentStep;
                                boolean isCurrent = i == currentStep;
                        %>
                            <div class="relative z-10 flex flex-col items-center">
                                <div class="w-8 h-8 rounded-full flex items-center justify-center font-bold text-xs <%= isPast ? "bg-[#449E80] text-white" : "bg-white border-2 border-gray-100 text-gray-300" %>">
                                    <%= i + 1 %>
                                </div>
                                <span class="absolute top-10 text-[10px] font-bold uppercase tracking-widest <%= isCurrent ? "text-[#449E80]" : "text-gray-400" %> whitespace-nowrap">
                                    <%= statuses[i].replace("_", " ") %>
                                </span>
                            </div>
                        <% } %>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="bg-white border border-gray-100 rounded-3xl p-8 shadow-sm h-fit">
                        <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-4">Description</h3>
                        <p class="text-gray-700 leading-relaxed mb-8"><%= req.getDescription() %></p>
                        
                        <div class="pt-6 border-t border-gray-50">
                            <span class="text-[10px] font-bold text-gray-400 uppercase tracking-widest block mb-2">Category</span>
                            <span class="font-semibold text-gray-900"><%= req.getCategoryName() %></span>
                        </div>
                    </div>

                    <div class="space-y-8">
                        <!-- Rating Section (Only if COMPLETED) -->
                        <% if ("COMPLETED".equals(req.getStatus())) { %>
                            <div class="bg-white border border-gray-100 rounded-3xl p-8 shadow-sm">
                                <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-6">Rate this Repair</h3>
                                <form action="<%= request.getContextPath() %>/repair-request" method="POST">
                                    <input type="hidden" name="action" value="rate">
                                    <input type="hidden" name="requestId" value="<%= req.getRequestId() %>">
                                    
                                    <div class="mb-6">
                                        <label class="block text-xs font-bold text-gray-500 mb-3 uppercase tracking-widest">Score (1-5)</label>
                                        <div class="flex gap-4">
                                            <% for(int i=1; i<=5; i++) { %>
                                                <label class="cursor-pointer">
                                                    <input type="radio" name="rating" value="<%= i %>" class="hidden peer" required <%= i == 5 ? "checked" : "" %>>
                                                    <div class="w-10 h-10 rounded-xl bg-gray-50 text-gray-400 flex items-center justify-center font-bold peer-checked:bg-amber-100 peer-checked:text-amber-600 transition-all">
                                                        <%= i %>
                                                    </div>
                                                </label>
                                            <% } %>
                                        </div>
                                    </div>

                                    <div class="mb-6">
                                        <label class="block text-xs font-bold text-gray-500 mb-3 uppercase tracking-widest">Comment</label>
                                        <textarea name="comment" rows="3" class="w-full p-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-[#449E80] transition-all text-sm" placeholder="How was the service?"></textarea>
                                    </div>

                                    <button type="submit" class="w-full py-4 bg-[#449E80] text-white rounded-2xl font-bold hover:bg-[#3d8b70] transition-all shadow-lg shadow-[#449E80]/20">
                                        Submit Review
                                    </button>
                                </form>
                            </div>
                        <% } %>

                        <!-- Action Buttons (Only if PENDING) -->
                        <% if ("PENDING".equals(req.getStatus())) { %>
                            <div class="bg-white border border-gray-100 rounded-3xl p-8 shadow-sm">
                                <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-6">Manage Request</h3>
                                <form action="<%= request.getContextPath() %>/repair-request" method="POST">
                                    <input type="hidden" name="action" value="cancel">
                                    <input type="hidden" name="requestId" value="<%= req.getRequestId() %>">
                                    <button type="submit" class="w-full py-4 bg-red-50 text-red-600 rounded-2xl font-bold hover:bg-red-100 transition-all">
                                        Cancel Request
                                    </button>
                                </form>
                            </div>
                        <% } %>
                    </div>
                </div>
            <% } %>
        </div>
    </main>
</body>
</html>
