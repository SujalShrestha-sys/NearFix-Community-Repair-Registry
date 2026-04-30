<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.Category, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Repair Request | NearFix</title>
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
            <div class="max-w-3xl w-full">
                <!-- Page Header -->
                <header class="mb-10 text-center">
                    <h2 class="serif text-4xl text-gray-900 mb-3">Submit a Repair Request</h2>
                    <p class="text-gray-500 max-w-lg mx-auto">Describe what needs fixing and we'll connect you with a local repairer.</p>
                </header>

                <!-- Form Card -->
                <div class="bg-white border border-gray-100 rounded-[2.5rem] p-10 shadow-sm relative overflow-hidden">
                    <!-- Subtle background decoration -->
                    <div class="absolute top-0 right-0 w-32 h-32 bg-gray-50 rounded-full -mr-16 -mt-16"></div>

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="mb-8 p-4 bg-red-50 border border-red-100 text-red-600 rounded-2xl flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                            <span class="text-sm font-medium"><%= request.getAttribute("errorMessage") %></span>
                        </div>
                    <% } %>

                    <form action="<%= request.getContextPath() %>/repair-request?action=create" method="POST" class="space-y-8 relative z-10">
                        <!-- What needs repair? -->
                        <div class="space-y-3">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
                                <span>What needs repair?</span>
                            </label>
                            <input type="text" name="itemName" required placeholder="e.g. Broken kitchen faucet, cracked phone screen..."
                                   class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all placeholder-gray-300 text-gray-900">
                        </div>

                        <!-- Describe the issue -->
                        <div class="space-y-3">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                                <span>Describe the issue</span>
                            </label>
                            <textarea name="description" rows="4" required placeholder="Provide details about the problem — when it started, what you've tried, any relevant specifics..."
                                      class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all placeholder-gray-300 text-gray-900 resize-none"></textarea>
                        </div>

                        <!-- Category & Urgency -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="space-y-3">
                                <label class="text-sm font-bold text-gray-900 ml-1">Category</label>
                                <div class="relative">
                                    <select name="category" required class="w-full appearance-none px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all text-gray-600">
                                        <option value="" disabled selected>Select a category</option>
                                        <% 
                                            List<Category> categories = (List<Category>) request.getAttribute("categories");
                                            if (categories != null) {
                                                for (Category c : categories) {
                                        %>
                                            <option value="<%= c.getCategoryId() %>"><%= c.getName() %></option>
                                        <% 
                                                }
                                            }
                                        %>
                                    </select>
                                    <div class="absolute inset-y-0 right-0 flex items-center pr-6 pointer-events-none text-gray-400">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
                                    </div>
                                </div>
                            </div>

                            <div class="space-y-3">
                                <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2 3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                                    <span>Urgency</span>
                                </label>
                                <div class="relative">
                                    <select name="urgency" required class="w-full appearance-none px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all text-gray-600">
                                        <option value="NORMAL">Normal — Within a day or two</option>
                                        <option value="MEDIUM">Medium — Needed soon</option>
                                        <option value="HIGH">High — Urgent fix required</option>
                                    </select>
                                    <div class="absolute inset-y-0 right-0 flex items-center pr-6 pointer-events-none text-gray-400">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Location -->
                        <div class="space-y-3">
                            <label class="flex items-center gap-2 text-sm font-bold text-gray-900 ml-1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#449E80" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>
                                <span>Location</span>
                            </label>
                            <input type="text" name="location" placeholder="e.g. 123 Main St, City"
                                   class="w-full px-6 py-4 bg-gray-50 border border-gray-100 rounded-2xl focus:bg-white focus:ring-4 focus:ring-[#449E80]/10 focus:border-[#449E80] outline-none transition-all placeholder-gray-300 text-gray-900">
                        </div>

                        <button type="submit" 
                                class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white py-5 rounded-2xl font-bold transition-all flex items-center justify-center gap-2 shadow-xl shadow-[#449E80]/20 active:scale-[0.98] mt-4">
                            <span>Submit Request</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </main>

</body>
</html>
