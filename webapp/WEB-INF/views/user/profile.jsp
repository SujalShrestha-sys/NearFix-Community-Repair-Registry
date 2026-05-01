<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | NearFix</title>
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

        <div class="flex-1 flex items-center justify-center p-8">
            <div class="max-w-2xl w-full">
                <!-- Page Header -->
                <header class="mb-10 text-center">
                    <h2 class="serif text-4xl text-gray-900 mb-3">My Profile</h2>
                    <p class="text-gray-500 max-w-lg mx-auto">Manage your personal information and account settings.</p>
                </header>

                <% 
                    User user = (User) request.getAttribute("user");
                    if (user == null) {
                        // Fallback to session if attribute not set (should be set by servlet)
                        // But for demonstration, we can simulate or redirect
                    }
                %>

                <!-- Profile Card -->
                <div class="bg-white border border-gray-100 rounded-[2.5rem] p-10 shadow-sm relative overflow-hidden">
                    <!-- Subtle background decoration -->
                    <div class="absolute top-0 right-0 w-32 h-32 bg-emerald-50 rounded-full -mr-16 -mt-16"></div>

                    <% if (request.getAttribute("successMessage") != null) { %>
                        <div class="mb-8 p-4 bg-emerald-50 border border-emerald-100 text-emerald-600 rounded-2xl flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                            <span class="text-sm font-medium"><%= request.getAttribute("successMessage") %></span>
                        </div>
                    <% } %>

                    <!-- Avatar & Summary -->
                    <div class="flex items-center gap-6 mb-12 relative z-10">
                        <div class="w-24 h-24 bg-[#449E80] rounded-[2rem] flex items-center justify-center text-white text-3xl font-bold shadow-xl shadow-[#449E80]/20">
                            <%= (user != null && user.getName() != null) ? user.getName().substring(0, 2).toUpperCase() : "U" %>
                        </div>
                        <div>
                            <h3 class="text-2xl font-bold text-gray-900"><%= (user != null) ? user.getName() : "Your Name" %></h3>
                            <p class="text-gray-400 font-medium"><%= (user != null) ? user.getEmail() : "user@example.com" %></p>
                        </div>
                    </div>

                    <div class="h-px bg-gray-50 w-full mb-12"></div>

                    <form action="<%= request.getContextPath() %>/user/profile?action=update" method="POST" class="space-y-8 relative z-10">
                        <!-- Email (Read Only) -->
                        <div class="space-y-3 opacity-60">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                                <span>Email</span>
                            </label>
                            <input type="email" value="<%= (user != null) ? user.getEmail() : "" %>" disabled
                                   class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl cursor-not-allowed text-gray-500">
                        </div>

                        <!-- Full Name -->
                        <div class="space-y-3">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 2a7 7 0 0 0-7 7c0 5.25 7 13 7 13s7-7.75 7-13a7 7 0 0 0-7-7Z"/></svg>
                                <span>Full Name</span>
                            </label>
                            <input type="text" name="name" value="<%= (user != null) ? user.getName() : "" %>" required placeholder="Enter your full name"
                                   class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all placeholder-gray-300 text-gray-900 font-medium">
                        </div>

                        <!-- Phone Number -->
                        <div class="space-y-3">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                                <span>Phone Number</span>
                            </label>
                            <input type="tel" name="phone" value="<%= (user != null) ? user.getPhone() : "" %>" required placeholder="Enter your phone number"
                                   class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all placeholder-gray-300 text-gray-900 font-medium">
                        </div>

                        <button type="submit" 
                                class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white py-5 rounded-2xl font-bold transition-all flex items-center justify-center gap-3 shadow-xl shadow-[#449E80]/20 active:scale-[0.98] mt-4 group">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" class="group-hover:rotate-12 transition-transform"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/><polyline points="17 21 17 13 7 13 7 21"/><polyline points="7 3 7 8 15 8"/></svg>
                            <span>Save Changes</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </main>

</body>
</html>
