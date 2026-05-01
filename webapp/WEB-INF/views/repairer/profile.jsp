<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="nearfix.nearfix.model.Repairer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | NearFix</title>
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
            <% Repairer repairer = (Repairer) request.getAttribute("repairer"); %>
            <div id="profile" class="page-content active">
                <div class="text-center mb-8 pt-8">
                    <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">My Profile</h1>
                    <p class="text-gray-500 text-[15px]">Manage your repairer profile information.</p>
                </div>
                <div class="bg-white border border-gray-100 rounded-[28px] p-8 max-w-2xl mx-auto shadow-sm">
                    <div class="flex items-center gap-5 mb-8">
                        <div class="bg-[#409074] rounded-full w-20 h-20 flex items-center justify-center text-white text-2xl font-bold shadow-sm">
                            <%= (repairer != null && repairer.getName() != null) ? repairer.getName().substring(0, 2).toUpperCase() : "RP" %>
                        </div>
                        <div>
                            <h2 class="text-xl font-bold text-gray-900"><%= (repairer != null) ? repairer.getName() : "" %></h2>
                            <p class="text-sm text-gray-500 mt-0.5"><%= (repairer != null) ? repairer.getEmail() : "" %></p>
                        </div>
                    </div>
                    <form action="<%= request.getContextPath() %>/repairer/" method="POST" class="space-y-6">
                        <input type="hidden" name="action" value="update-profile">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-bold text-gray-900 mb-2">Full Name</label>
                                <input type="text" name="name" value="<%= (repairer != null) ? repairer.getName() : "" %>" class="w-full bg-gray-50 border border-gray-100 rounded-xl px-4 py-3 outline-none">
                            </div>
                            <div>
                                <label class="block text-sm font-bold text-gray-900 mb-2">Phone</label>
                                <input type="tel" name="phone" value="<%= (repairer != null) ? repairer.getPhone() : "" %>" class="w-full bg-gray-50 border border-gray-100 rounded-xl px-4 py-3 outline-none">
                            </div>
                        </div>
                        <button type="submit" class="w-full bg-[#409074] hover:bg-[#2F6C56] text-white rounded-xl py-4 font-bold transition-all">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
