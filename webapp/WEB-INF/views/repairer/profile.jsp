<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expert Profile - NearFix</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: '#0B7A53',
              'primary-light': '#EAF5EF',
              background: '#F3F8F5',
              dark: '#0D1F1A',
              border: '#E3ECE7',
              muted: '#A0B4A8',
              'muted-dark': '#7D9087',
              nav: '#3D5A50',
              yellow: '#F4B63D',
            }
          }
        }
      }
    </script>
    <style>
        body { font-family: 'Plus Jakarta Sans', sans-serif; }
        .mesh-gradient {
            background-color: #0B7A53;
            background-image: radial-gradient(at 0% 0%, hsla(161, 84%, 48%, 0.1) 0px, transparent 50%), radial-gradient(at 100% 100%, hsla(165, 85%, 40%, 0.1) 0px, transparent 50%);
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }
        .input-focus:focus {
            border-color: #0B7A53;
            box-shadow: 0 0 0 4px rgba(11, 122, 83, 0.05);
        }
        .sidebar-open { transform: translateX(0) !important; }
    </style>
</head>
<body class="bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-8 px-6 md:px-12 pb-16 max-w-5xl">
            <!-- Header Section -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-10">
                <div>
                    <h2 class="text-4xl font-black tracking-tighter text-dark mb-1">Expert Identity</h2>
                    <p class="text-xs font-bold text-muted-dark uppercase tracking-widest">Public credentials & specialization</p>
                </div>
                
                <c:if test="${not empty successMessage}">
                    <div class="bg-primary/10 border border-primary/20 text-primary px-6 py-3 rounded-2xl text-xs font-black uppercase tracking-widest flex items-center gap-3 animate-pulse">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                        ${successMessage}
                        <% session.removeAttribute("successMessage"); %>
                    </div>
                </c:if>
            </div>

            <form action="${pageContext.request.contextPath}/repairer/profile" method="POST" class="space-y-8">
                <input type="hidden" name="action" value="update-profile">
                
                <!-- Main Credentials -->
                <div class="glass-card rounded-[32px] p-8 md:p-10 shadow-sm border border-border relative overflow-hidden">
                    <div class="absolute top-0 right-0 p-8 opacity-[0.03] pointer-events-none">
                        <svg class="w-32 h-32 text-primary" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/></svg>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 relative z-10">
                        <div class="space-y-2.5">
                            <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Professional Name</label>
                            <input type="text" name="fullName" value="${repairer.name}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" required>
                        </div>
                        <div class="space-y-2.5">
                            <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Expertise Category</label>
                            <input type="text" name="category" value="${repairer.specialization}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" placeholder="e.g. Electronics, Plumbing" required>
                        </div>
                        <div class="space-y-2.5">
                            <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Direct Contact</label>
                            <input type="tel" name="repairerPhone" value="${repairer.phone}" maxlength="10" pattern="\d{10}" title="Please enter exactly 10 digits" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" required>
                        </div>
                        <div class="space-y-2.5">
                            <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Years of Practice</label>
                            <input type="number" name="experience" value="${repairer.yearsOfExperience}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" required>
                        </div>
                        <div class="md:col-span-2 space-y-2.5">
                            <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Primary Service Area</label>
                            <input type="text" name="serviceArea" value="${repairer.serviceArea}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" placeholder="e.g. Kathmandu Valley" required>
                        </div>
                    </div>
                </div>

                <!-- Professional Bio -->
                <div class="glass-card rounded-[32px] p-8 md:p-10 shadow-sm border border-border">
                    <div class="flex flex-col gap-2.5">
                        <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Professional Biography & Expertise</label>
                        <textarea name="bio" rows="5" class="w-full bg-background/50 px-6 py-4 rounded-[24px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all resize-none" placeholder="Describe your specialized repair skills and experience...">${repairer.expertise}</textarea>
                    </div>

                    <div class="mt-10 flex justify-end">
                        <button type="submit" class="mesh-gradient text-white px-12 py-5 rounded-[20px] font-black text-xs uppercase tracking-[0.2em] shadow-xl shadow-primary/20 hover:scale-[1.02] active:scale-[0.98] transition-all">
                            Synchronize Credentials
                        </button>
                    </div>
                </div>
            </form>
        </main>
    </div>

    <script>
        const menuBtn = document.getElementById("mobile-menu-btn");
        const sidebar = document.querySelector("aside");
        if (menuBtn && sidebar) {
            menuBtn.addEventListener("click", () => sidebar.classList.toggle("sidebar-open"));
            document.addEventListener("click", (e) => {
                if (window.innerWidth < 1024 && !sidebar.contains(e.target) && !menuBtn.contains(e.target)) {
                    sidebar.classList.remove("sidebar-open");
                }
            });
        }
    </script>
</body>
</html>

