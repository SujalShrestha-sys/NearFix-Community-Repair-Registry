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
                <h2 class="serif text-4xl text-gray-900 mb-8"><%= req.getItemName() %></h2>
                <div class="bg-white border border-gray-100 rounded-3xl p-8 shadow-sm">
                    <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-4">Description</h3>
                    <p class="text-gray-700 leading-relaxed"><%= req.getDescription() %></p>
                </div>
            <% } %>
        </div>
    </main>
</body>
</html>
