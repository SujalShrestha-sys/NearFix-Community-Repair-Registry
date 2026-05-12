<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .font-inter { font-family: 'Inter', sans-serif; }
        .mesh-gradient {
            background: linear-gradient(135deg, #0B7A53 0%, #1A2E28 100%);
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border: 1px solid #E3ECE7;
        }
        .sidebar-open { transform: translateX(0) !important; }
        
        /* Grain Effect */
        .grain::after {
            content: "";
            position: absolute;
            inset: 0;
            background-image: url('https://grainy-gradients.vercel.app/noise.svg');
            opacity: 0.05;
            pointer-events: none;
            z-index: 1;
        }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark selection:bg-primary selection:text-white">
    <!-- Role-based Sidebar Include -->
    <c:choose>
        <c:when test="${user.role == 'REPAIRER'}">
            <jsp:include page="../repairer/layout/sidebar.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="layout/sidebar.jsp" />
        </c:otherwise>
    </c:choose>

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen w-full overflow-x-hidden">
        <!-- Navbar Include -->
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-8 px-6 md:px-12 pb-16 max-w-7xl mx-auto w-full">
            
            <!-- Hero Section -->
            <div class="mesh-gradient rounded-[32px] p-10 md:p-14 mb-10 relative overflow-hidden shadow-xl shadow-primary/10 group">
                <div class="absolute -top-32 -right-32 w-80 h-80 bg-white/10 rounded-full blur-[100px] animate-pulse-slow"></div>
                <div class="absolute -bottom-32 -left-32 w-64 h-64 bg-emerald-400/5 rounded-full blur-[80px] animate-pulse-slow"></div>
                
                <div class="relative z-10 flex flex-col md:flex-row items-center gap-10">
                    <!-- Profile Avatar with creative ring -->
                    <div class="relative group">
                        <div class="absolute inset-0 bg-white/20 rounded-[24px] blur-2xl group-hover:blur-3xl transition-all duration-500"></div>
                        <div class="w-32 h-32 bg-white rounded-[24px] flex items-center justify-center text-4xl font-black text-primary shadow-xl relative z-10 transform group-hover:rotate-6 transition-all duration-500">
                            ${user.name.substring(0, 1)}${user.name.contains(' ') ? user.name.split(' ')[1].substring(0, 1) : ''}
                        </div>
                        <div class="absolute -bottom-1 -right-1 w-9 h-9 bg-yellow rounded-[12px] border-4 border-primary flex items-center justify-center shadow-lg z-20">
                            <svg class="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                        </div>
                    </div>

                    <div class="text-center md:text-left flex-1">
                        <div class="flex flex-col md:flex-row md:items-end gap-3 mb-4">
                            <h2 class="text-3xl font-bold text-white tracking-tight">${user.name}</h2>
                            <span class="px-4 py-1 bg-white/20 backdrop-blur-xl rounded-full text-[10px] font-bold text-white uppercase tracking-[0.2em] border border-white/20 mb-1.5">
                                Verified Member
                            </span>
                        </div>
                        
                        <div class="flex flex-wrap justify-center md:justify-start gap-6 opacity-90">
                            <div class="flex items-center gap-3 text-white/80 group/info">
                                <div class="w-8 h-8 rounded-[12px] bg-white/10 flex items-center justify-center border border-white/10 group-hover/info:bg-white group-hover/info:text-primary transition-all">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
                                </div>
                                <span class="font-bold text-sm tracking-tight">${user.email}</span>
                            </div>
                            <div class="flex items-center gap-3 text-white/80 group/info">
                                <div class="w-8 h-8 rounded-[12px] bg-white/10 flex items-center justify-center border border-white/10 group-hover/info:bg-white group-hover/info:text-primary transition-all">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
                                </div>
                                <span class="font-bold text-sm tracking-tight">${user.phone}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Impact Snippets -->
                    <div class="grid grid-cols-2 gap-4">
                        <div class="glass-card bg-white/10 border-white/20 p-5 rounded-[24px] text-center min-w-[110px] backdrop-blur-2xl">
                            <div class="text-2xl font-black text-white tracking-tighter">${stats.totalRequests != null ? stats.totalRequests : '0'}</div>
                            <div class="text-[8px] font-black uppercase tracking-widest text-emerald-100/60 mt-1">Impact Units</div>
                        </div>
                        <div class="glass-card bg-white/10 border-white/20 p-5 rounded-[24px] text-center min-w-[110px] backdrop-blur-2xl">
                            <div class="text-2xl font-black text-white tracking-tighter">${stats.completedTasks != null ? stats.completedTasks : '0'}</div>
                            <div class="text-[8px] font-black uppercase tracking-widest text-emerald-100/60 mt-1">Repairs Done</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Success/Error Notifications -->
            <c:if test="${not empty successMessage}">
                <div class="mb-8 glass-card bg-emerald-50/50 border-emerald-100 rounded-[24px] p-5 flex items-center gap-5">
                    <div class="w-10 h-10 mesh-gradient rounded-[12px] flex items-center justify-center">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path></svg>
                    </div>
                    <div>
                        <h4 class="text-xs font-black text-primary uppercase tracking-widest leading-none mb-1">Update Success</h4>
                        <p class="text-[11px] font-bold text-muted-dark opacity-80">${successMessage}</p>
                    </div>
                </div>
                <c:remove var="successMessage" scope="session" />
            </c:if>

            <div class="grid grid-cols-1 xl:grid-cols-3 gap-10">
                <!-- Personal Information -->
                <div class="xl:col-span-2 space-y-8">
                    <div class="glass-card rounded-[32px] p-10 md:p-12 border border-border shadow-sm relative overflow-hidden">
                        <div class="flex items-center gap-5 mb-10">
                            <div class="w-12 h-12 bg-primary/10 rounded-[16px] flex items-center justify-center text-primary">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                            </div>
                            <div>
                                <h3 class="text-xl font-bold tracking-tight">Identity Settings</h3>
                                <p class="text-[9px] font-bold text-muted-dark uppercase tracking-[0.2em] mt-1">Core account credentials</p>
                            </div>
                        </div>

                        <form action="${pageContext.request.contextPath}/profile" method="POST" class="grid grid-cols-1 md:grid-cols-2 gap-8">
                            <input type="hidden" name="action" value="update_profile">
                            
                            <div class="space-y-2.5">
                                <label class="text-[9px] font-black uppercase tracking-widest text-muted-dark ml-4">Full Name</label>
                                <input type="text" name="name" value="${user.name}" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all shadow-inner" placeholder="Your full name" required>
                            </div>

                            <div class="space-y-2.5">
                                <label class="text-[9px] font-black uppercase tracking-widest text-muted-dark ml-4">Electronic Mail</label>
                                <input type="email" name="email" value="${user.email}" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all shadow-inner" placeholder="name@domain.com" required>
                            </div>

                            <div class="space-y-2.5">
                                <label class="text-[9px] font-black uppercase tracking-widest text-muted-dark ml-4">Contact Phone</label>
                                <input type="tel" name="phone" value="${user.phone}" maxlength="10" pattern="\d{10}" title="Please enter exactly 10 digits" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all shadow-inner" placeholder="98XXXXXXXX" required>
                            </div>

                            <div class="space-y-2.5">
                                <label class="text-[9px] font-black uppercase tracking-widest text-muted-dark ml-4">Account Role</label>
                                <div class="w-full bg-primary/5 px-6 py-4 rounded-[16px] font-black text-[10px] uppercase tracking-widest text-primary/60 border border-dashed border-primary/20 cursor-not-allowed">
                                    ${user.role}
                                </div>
                            </div>

                            <div class="md:col-span-2 space-y-2.5">
                                <label class="text-[9px] font-black uppercase tracking-widest text-muted-dark ml-4">Primary Address</label>
                                <textarea name="address" rows="3" class="w-full bg-background/40 px-6 py-4 rounded-[20px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all shadow-inner resize-none" placeholder="Where are you located?">${user.address}</textarea>
                            </div>

                            <div class="md:col-span-2 pt-4">
                                <button type="submit" class="mesh-gradient text-white px-10 py-4 rounded-[16px] font-black text-[11px] uppercase tracking-[0.2em] shadow-lg shadow-primary/20 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center gap-4">
                                    Change Profile
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Security Panel -->
                <div class="space-y-8">
                    <div class="glass-card rounded-[32px] p-10 border border-border shadow-sm relative overflow-hidden">
                        <div class="flex items-center gap-4 mb-8">
                            <div class="w-12 h-12 bg-yellow/10 rounded-[16px] flex items-center justify-center text-yellow">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                            </div>
                            <div>
                                <h3 class="text-xl font-black tracking-tighter">Security Vault</h3>
                                <p class="text-[8px] font-black text-muted-dark uppercase tracking-[0.3em] mt-1">Access control</p>
                            </div>
                        </div>

                        <form action="${pageContext.request.contextPath}/profile" method="POST" class="space-y-6">
                            <input type="hidden" name="action" value="change_password">
                            
                            <div class="space-y-2">
                                <label class="text-[8px] font-black uppercase tracking-widest text-muted-dark ml-4">Current Key</label>
                                <input type="password" name="oldPassword" placeholder="••••••••" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus focus:border-yellow/30 outline-none transition-all shadow-inner" required>
                            </div>

                            <div class="space-y-2">
                                <label class="text-[8px] font-black uppercase tracking-widest text-muted-dark ml-4">New Key</label>
                                <input type="password" name="newPassword" placeholder="••••••••" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus focus:border-yellow/30 outline-none transition-all shadow-inner" required>
                            </div>

                            <div class="space-y-2">
                                <label class="text-[8px] font-black uppercase tracking-widest text-muted-dark ml-4">Confirm Key</label>
                                <input type="password" name="confirmPassword" placeholder="••••••••" class="w-full bg-background/40 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus focus:border-yellow/30 outline-none transition-all shadow-inner" required>
                            </div>

                            <div class="pt-4">
                                <button type="submit" class="mesh-gradient w-full text-white py-5 rounded-[16px] font-black text-[10px] uppercase tracking-[0.2em] hover:bg-black transition-all">
                                    Update Password
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Safety Card -->
                    <div class="glass-card rounded-[32px] p-8 bg-primary/5 border-primary/10">
                        <div class="flex items-center gap-4 mb-4 text-primary">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            <span class="text-[9px] font-black uppercase tracking-[0.2em]">Safety Protocol</span>
                        </div>
                        <p class="text-[10px] font-bold text-muted-dark leading-relaxed opacity-90">
                            Your profile data is strictly protected under our end-to-end encryption policy.
                        </p>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        const menuBtn = document.getElementById("mobile-menu-btn");
        const sidebar = document.querySelector("aside");
        if (menuBtn && sidebar) {
            menuBtn.addEventListener("click", () => {
                sidebar.classList.toggle("sidebar-open");
            });
            document.addEventListener("click", (e) => {
                if (window.innerWidth < 1024 && !sidebar.contains(e.target) && !menuBtn.contains(e.target)) {
                    sidebar.classList.remove("sidebar-open");
                }
            });
        }
    </script>
</body>
</html>
