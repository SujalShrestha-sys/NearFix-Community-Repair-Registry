<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - NearFix</title>
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

    <jsp:include page="dashboard/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="dashboard/navbar.jsp" />

        <div class="pt-[22px] px-4 md:px-9 pb-9 max-w-4xl">
            <h2 class="text-2xl font-bold text-dark mb-6">Repairer Profile</h2>
            
            <c:if test="${not empty successMessage}">
                <div class="bg-green-100 border border-green-200 text-green-700 px-4 py-3 rounded-xl mb-6 text-sm font-medium">
                    ${successMessage}
                    <% session.removeAttribute("successMessage"); %>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/repairer/profile" method="POST" class="bg-white rounded-2xl border border-border p-5 md:p-8 shadow-sm">
                <input type="hidden" name="action" value="update-profile">
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-bold text-dark">Full Name</label>
                        <input type="text" name="fullName" value="${repairer.name}" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors">
                    </div>
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-bold text-dark">Phone Number</label>
                        <input type="text" name="repairerPhone" value="${repairer.phone}" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors">
                    </div>
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-bold text-dark">Category / Specialization</label>
                        <input type="text" name="category" value="${repairer.specialization}" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors">
                    </div>
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-bold text-dark">Experience (Years)</label>
                        <input type="number" name="experience" value="${repairer.yearsOfExperience}" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors">
                    </div>
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-bold text-dark">Service Area (e.g. Kathmandu)</label>
                        <input type="text" name="serviceArea" value="${repairer.serviceArea}" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors">
                    </div>
                </div>

                <div class="flex flex-col gap-2 mb-8">
                    <label class="text-sm font-bold text-dark">Bio / Expertise Details</label>
                    <textarea name="bio" rows="4" class="bg-background border border-border rounded-xl px-4 py-3 text-sm outline-none focus:border-primary transition-colors resize-none">${repairer.expertise}</textarea>
                </div>

                <div class="flex justify-end">
                    <button type="submit" class="w-full md:w-auto bg-primary text-white px-8 py-3 rounded-xl text-sm font-bold hover:bg-opacity-90 transition-all shadow-md shadow-primary/20">Save Profile Changes</button>
                </div>
            </form>
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
