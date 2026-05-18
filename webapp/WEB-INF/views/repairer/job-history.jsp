<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="nearfix.nearfix.model.RepairRequest, nearfix.nearfix.model.Rating, nearfix.nearfix.service.impl.RepairService, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job History - NearFix</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: '#0B7A53',
              'primary-light': '#EAF5EF',
              'primary-hover': '#F0F7F3',
              background: '#F3F8F5',
              dark: '#0D1F1A',
              border: '#E3ECE7',
              'border-light': '#D0E4DA',
              'border-extra-light': '#D8EAE1',
              muted: '#A0B4A8',
              'muted-dark': '#7D9087',
              'muted-light': '#EAF2EE',
              nav: '#3D5A50',
              yellow: '#F4B63D',
              'yellow-light': '#FFF5DC',
            }
          }
        }
      }
    </script>
    <style>
      .sidebar-open { transform: translateX(0) !important; }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <div class="pt-[22px] px-4 md:px-9 pb-9">
            <div class="mb-6">
                <h2 class="text-xl md:text-2xl font-bold text-dark">Job History</h2>
                <p class="text-xs md:text-sm text-muted-dark mt-1">All completed and past jobs</p>
            </div>

            <%
                List<RepairRequest> jobHistory = (List<RepairRequest>) request.getAttribute("jobHistory");
                RepairService repairService = new RepairService();
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMM d, yyyy", java.util.Locale.ENGLISH);
            %>

            <div class="bg-white rounded-2xl border border-border shadow-sm overflow-hidden">
                <% if (jobHistory == null || jobHistory.isEmpty()) { %>
                    <div class="px-8 py-32 flex flex-col items-center justify-center text-center">
                        <div class="w-20 h-20 bg-muted-light rounded-2xl flex items-center justify-center text-muted mb-6">
                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                        <h4 class="font-bold text-xl text-dark mb-2">No job history yet</h4>
                        <p class="text-sm text-muted-dark mb-8 max-w-sm">Your completed and past repair jobs will appear here once they are completed.</p>
                    </div>
                <% } else { %>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="bg-gray-50/50">
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Request</th>
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Customer</th>
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Category</th>
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Completed</th>
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Rating</th>
                                    <th class="text-[11px] font-bold text-muted uppercase tracking-wider px-6 py-4 border-b border-border">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-border/40">
                                <% for (RepairRequest r : jobHistory) { %>
                                    <tr class="hover:bg-gray-50/30 transition-colors">
                                        <td class="px-6 py-5 align-middle">
                                            <div class="flex flex-col">
                                                <span class="text-sm font-bold text-dark hover:text-primary transition-colors"><%= r.getItemName() %></span>
                                                <span class="text-xs text-muted mt-0.5">#<%= r.getRequestId() %></span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-5 align-middle">
                                            <span class="text-sm font-semibold text-dark"><%= r.getUserName() != null ? r.getUserName() : "Unknown User" %></span>
                                        </td>
                                        <td class="px-6 py-5 align-middle">
                                            <%
                                                String cat = r.getCategoryName();
                                                String catClass = "bg-primary-light text-primary";
                                                if ("Furniture".equalsIgnoreCase(cat)) {
                                                    catClass = "bg-gray-100 text-gray-500";
                                                } else if ("Electronics".equalsIgnoreCase(cat)) {
                                                    catClass = "bg-blue-50 text-blue-600 border border-blue-100/50";
                                                } else if ("Clothing".equalsIgnoreCase(cat)) {
                                                    catClass = "bg-gray-100 text-gray-500";
                                                }
                                            %>
                                            <span class="<%= catClass %> text-xs font-semibold px-3 py-1 rounded-full"><%= cat %></span>
                                        </td>
                                        <td class="px-6 py-5 align-middle">
                                            <span class="text-sm font-medium text-muted-dark">
                                                <%= r.getCreatedAt() != null ? sdf.format(r.getCreatedAt()) : "" %>
                                            </span>
                                        </td>
                                        <td class="px-6 py-5 align-middle">
                                            <%
                                                Rating rtg = null;
                                                try {
                                                    rtg = repairService.getRatingByRequest(r.getRequestId());
                                                } catch(Exception ignored) {}
                                                int score = (rtg != null) ? rtg.getRatingScore() : 5;
                                            %>
                                            <div class="flex items-center gap-0.5 text-yellow">
                                                <% for (int i = 1; i <= 5; i++) { %>
                                                    <% if (i <= score) { %>
                                                        <svg class="w-4 h-4 fill-current" viewBox="0 0 20 20">
                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                    <% } else { %>
                                                        <svg class="w-4 h-4 text-gray-200 fill-current" viewBox="0 0 20 20">
                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                    <% } %>
                                                <% } %>
                                            </div>
                                        </td>
                                        <td class="px-6 py-5 align-middle">
                                            <%
                                                boolean isCompleted = "COMPLETED".equals(r.getStatus());
                                                String statusText = isCompleted ? "Done" : "Cancelled";
                                                String statusClass = isCompleted ? "bg-primary-light text-primary" : "bg-gray-100 text-gray-500";
                                            %>
                                            <span class="<%= statusClass %> px-3 py-1 rounded-lg text-xs font-bold"><%= statusText %></span>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
    <script>
      const menuBtn = document.getElementById('mobile-menu-btn');
      const sidebar = document.querySelector('aside');
      if (menuBtn && sidebar) {
        menuBtn.addEventListener('click', () => sidebar.classList.toggle('sidebar-open'));
        document.addEventListener('click', (e) => {
          if (window.innerWidth < 1024 && !sidebar.contains(e.target) && !menuBtn.contains(e.target)) {
            sidebar.classList.remove('sidebar-open');
          }
        });
      }
    </script>
</body>
</html>
