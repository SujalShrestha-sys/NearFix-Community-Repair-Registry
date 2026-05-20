<%-- ============================================================
     Page: Register (Signup)
     Description: Ultra-premium split-screen registration page.
     Award-winning aesthetics: Mesh gradients, Glassmorphism, 
     and Screen-fit layout.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join NearFix - The Future of Repair</title>
    
    <%-- Tailwind CSS --%>
    <script src="https://cdn.tailwindcss.com"></script>
    
    <%-- Google Fonts: Plus Jakarta Sans & Inter --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Plus+Jakarta+Sans:wght@700;800&display=swap" rel="stylesheet">

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        display: ['Plus Jakarta Sans', 'sans-serif'],
                    },
                    colors: {
                        nearfix: {
                            green: '#10b981',
                            darkGreen: '#064e3b',
                            accent: '#34d399',
                        }
                    },
                    animation: {
                        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                        'float': 'float 6s ease-in-out infinite',
                    },
                    keyframes: {
                        float: {
                            '0%, 100%': { transform: 'translateY(0)' },
                            '50%': { transform: 'translateY(-20px)' },
                        }
                    }
                }
            }
        }
    </script>

    <style>
        body { overflow: hidden; }
        
        /* Award Winning Mesh Gradient */
        .mesh-gradient {
            background-color: #064e3b;
            background-image: 
                radial-gradient(at 0% 0%, hsla(161, 84%, 48%, 0.15) 0px, transparent 50%),
                radial-gradient(at 100% 0%, hsla(158, 82%, 45%, 0.1) 0px, transparent 50%),
                radial-gradient(at 100% 100%, hsla(165, 85%, 40%, 0.15) 0px, transparent 50%),
                radial-gradient(at 0% 100%, hsla(160, 80%, 30%, 0.1) 0px, transparent 50%);
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .input-glow:focus {
            box-shadow: 0 0 20px rgba(16, 185, 129, 0.15);
            border-color: #10b981;
        }

        .role-card {
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .role-card.active-user {
            border-color: #10b981;
            background: #f0fdf4;
            transform: translateY(-4px);
            box-shadow: 0 10px 30px rgba(16, 185, 129, 0.1);
        }
        .role-card.active-repairer {
            border-color: #3b82f6;
            background: #eff6ff;
            transform: translateY(-4px);
            box-shadow: 0 10px 30px rgba(59, 130, 246, 0.1);
        }

        /* Hide scrollbar but allow scrolling if needed in form */
        .no-scrollbar::-webkit-scrollbar { display: none; }
        .no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    </style>
</head>
<body class="bg-white font-sans antialiased text-gray-900 h-screen">

    <div class="flex h-full w-full overflow-hidden">
        
        <%-- LEFT PANEL: Brand Immersion (Screen Fit) --%>
        <div class="hidden lg:flex lg:w-[45%] mesh-gradient p-16 flex-col justify-between relative">
            <%-- Abstract Noise Overlay --%>
            <div class="absolute inset-0 opacity-20 pointer-events-none mix-blend-overlay" 
                 style="background-image: url('https://grainy-gradients.vercel.app/noise.svg');"></div>
            
            <%-- Floating Decorative Elements --%>
            <div class="absolute top-1/4 -right-12 w-64 h-64 bg-nearfix-green/10 rounded-full blur-[100px] animate-pulse-slow"></div>
            <div class="absolute bottom-1/4 -left-12 w-64 h-64 bg-emerald-400/5 rounded-full blur-[80px] animate-pulse-slow"></div>

            <div class="relative z-10">
                <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3 text-white mb-24 group">
                    <div class="w-12 h-12 bg-nearfix-green rounded-2xl flex items-center justify-center shadow-lg shadow-nearfix-green/20 group-hover:rotate-12 transition-transform duration-500">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                            <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
                        </svg>
                    </div>
                    <span class="text-3xl font-display font-extrabold tracking-tight">NearFix</span>
                </a>

                <h1 class="text-[4rem] lg:text-[4.5rem] font-display font-extrabold text-white leading-[1] tracking-tighter mb-8">
                    Fix things.<br>
                    Build trust.<br>
                    Help <span class="text-nearfix-green">locals.</span>
                </h1>

                <div class="space-y-8 max-w-md">
                    <div class="flex items-start gap-5 group">
                        <div class="mt-1 w-10 h-10 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-nearfix-green shrink-0 group-hover:bg-nearfix-green group-hover:text-white transition-all">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M13 10V3L4 14h7v7l9-11h-7z"/></svg>
                        </div>
                        <div>
                            <h4 class="text-white font-bold text-lg mb-1">Instant Requests</h4>
                            <p class="text-gray-400 text-sm leading-relaxed">Post a repair request in under 60 seconds and get matched instantly.</p>
                        </div>
                    </div>
                    <div class="flex items-start gap-5 group">
                        <div class="mt-1 w-10 h-10 rounded-xl bg-white/5 border border-white/10 flex items-center justify-center text-nearfix-green shrink-0 group-hover:bg-nearfix-green group-hover:text-white transition-all">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                        </div>
                        <div>
                            <h4 class="text-white font-bold text-lg mb-1">Verified Trust</h4>
                            <p class="text-gray-400 text-sm leading-relaxed">Every repairer is admin-verified with real community ratings.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- RIGHT PANEL: centered form (Scrollable if needed, but fixed height) --%>
        <div class="w-full lg:w-[55%] h-full flex flex-col bg-white">
            
            <%-- Top Navigation --%>
            <div class="px-12 py-8 flex justify-between items-center shrink-0">
                <a href="${pageContext.request.contextPath}/" class="group flex items-center gap-2 text-gray-400 hover:text-nearfix-green transition-all font-bold text-sm">
                    <div class="w-8 h-8 rounded-full border border-gray-100 flex items-center justify-center group-hover:border-nearfix-green">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M10 19l-7-7m0 0l7-7m-7 7h18"/></svg>
                    </div>
                    Back to home
                </a>
                <div class="bg-gray-50 p-1.5 rounded-2xl flex gap-1 border border-gray-100">
                    <a href="${pageContext.request.contextPath}/login" class="px-8 py-2.5 text-sm font-bold text-gray-500 hover:text-gray-900 transition-all">Sign in</a>
                    <button class="px-8 py-2.5 text-sm font-bold bg-white text-nearfix-green rounded-[0.9rem] shadow-sm ring-1 ring-black/5">Create account</button>
                </div>
            </div>

            <%-- Centered Form Area --%>
            <div class="flex-1 overflow-y-auto no-scrollbar px-12 pb-12 flex flex-col items-center">
                <div class="max-w-xl w-full">
                    
                    <%-- Headline Area --%>
                    <div class="mb-8 text-center lg:text-left">
                        <h2 id="form-title" class="text-4xl font-display font-extrabold text-gray-900 tracking-tight mb-2">Create account</h2>
                        <p id="form-subtitle" class="text-gray-500 text-base font-medium opacity-80 italic">Join the movement &mdash; restore, repair, rebuild.</p>
                        
                        <%-- Notifications --%>
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="mt-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 rounded-2xl flex items-center gap-3">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                                <p class="text-sm font-bold"><%= request.getAttribute("errorMessage") %></p>
                            </div>
                        <% } %>
                    </div>

                    <%-- Role Switcher (Compact & Modern) --%>
                    <div class="grid grid-cols-2 gap-5 mb-10">
                        <button onclick="selectRole('USER')" id="role-user" class="role-card active-user border-2 border-gray-100 p-6 rounded-xl flex items-center gap-4 group">
                            <div class="w-14 h-14 bg-gray-50 rounded-2xl flex items-center justify-center text-gray-400 group-[.active-user]:bg-nearfix-green group-[.active-user]:text-white transition-all">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                            </div>
                            <div class="text-left">
                                <div class="font-black text-gray-900 leading-tight">Regular User</div>
                                <div class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mt-0.5">Post Requests</div>
                            </div>
                        </button>
                        <button onclick="selectRole('REPAIRER')" id="role-repairer" class="role-card border-2 border-gray-100 p-6 rounded-xl flex items-center gap-4 group">
                            <div class="w-14 h-14 bg-gray-50 rounded-2xl flex items-center justify-center text-gray-400 group-[.active-repairer]:bg-blue-600 group-[.active-repairer]:text-white transition-all">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
                            </div>
                            <div class="text-left">
                                <div class="font-black text-gray-900 leading-tight">Expert Repairer</div>
                                <div class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mt-0.5">Accept Jobs</div>
                            </div>
                        </button>
                    </div>

                    <%-- Interactive Form --%>
                    <form action="${pageContext.request.contextPath}/register" method="POST" class="space-y-6">
                        <input type="hidden" name="role" id="role-input" value="USER">

                        <%-- USER FIELDS --%>
                        <div id="user-fields" class="grid grid-cols-2 gap-4">
                            <div class="space-y-1.5">
                                <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">First Name</label>
                                <input type="text" name="firstName" value="${param.firstName}" placeholder="Anita" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-nearfix-green/20 outline-none transition-all input-glow">
                            </div>
                            <div class="space-y-1.5">
                                <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Last Name</label>
                                <input type="text" name="lastName" value="${param.lastName}" placeholder="Sharma" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-nearfix-green/20 outline-none transition-all input-glow">
                            </div>
                        </div>

                        <%-- REPAIRER FIELDS (Grid Optimized) --%>
                        <div id="repairer-fields" class="hidden space-y-6">
                            <div class="grid grid-cols-2 gap-4">
                                <div class="space-y-1.5">
                                    <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Full Name</label>
                                    <input type="text" name="fullName" value="${param.fullName}" placeholder="Ram Karki" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-blue-500/20 outline-none transition-all input-glow">
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Phone</label>
                                    <input type="text" name="repairerPhone" value="${param.repairerPhone}" placeholder="98XXXXXXXX" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-blue-500/20 outline-none transition-all input-glow">
                                </div>
                            </div>
                            <div class="grid grid-cols-2 gap-4">
                                <div class="space-y-1.5">
                                    <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Category</label>
                                    <select name="category" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-blue-500/20 outline-none transition-all">
                                        <c:forEach var="cat" items="${categories}">
                                            <option value="${cat.name}" ${param.category == cat.name ? 'selected' : ''}>${cat.name}</option>
                                        </c:forEach>
                                        <c:if test="${empty categories}">
                                            <option value="ELECTRONICS" ${param.category == 'ELECTRONICS' ? 'selected' : ''}>Electronics</option>
                                            <option value="FURNITURE" ${param.category == 'FURNITURE' ? 'selected' : ''}>Furniture</option>
                                            <option value="PLUMBING" ${param.category == 'PLUMBING' ? 'selected' : ''}>Plumbing</option>
                                            <option value="CARPENTER" ${param.category == 'CARPENTER' ? 'selected' : ''}>Carpenter</option>
                                        </c:if>
                                    </select>
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Service Area</label>
                                    <input type="text" name="serviceArea" value="${param.serviceArea}" placeholder="Thamel, Ktm" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-blue-500/20 outline-none transition-all input-glow">
                                </div>
                            </div>
                        </div>

                        <%-- COMMON FIELDS --%>
                        <div class="space-y-5">
                            <div class="space-y-1.5">
                                <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Email Address</label>
                                <input type="email" name="email" value="${param.email}" placeholder="you@example.com" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-nearfix-green/20 outline-none transition-all input-glow">
                            </div>
                            
                            <div id="user-phone-wrap" class="space-y-1.5">
                                <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Contact Number</label>
                                <input type="text" name="userPhone" value="${param.userPhone}" placeholder="98XXXXXXXX" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-nearfix-green/20 outline-none transition-all input-glow">
                            </div>

                            <div class="space-y-1.5 relative">
                                <label class="text-[11px] font-black uppercase tracking-[0.1em] text-gray-400 ml-1">Secure Password</label>
                                <input type="password" name="password" placeholder="••••••••" class="w-full px-6 py-4 bg-gray-50 border-none rounded-2xl focus:ring-2 focus:ring-nearfix-green/20 outline-none transition-all input-glow">
                            </div>
                        </div>

                        <button type="submit" id="submit-btn" class="w-full py-4 bg-nearfix-green text-white font-black text-lg rounded-2xl shadow-2xl shadow-nearfix-green/30 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3">
                            <span id="btn-text">Create Account</span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3"><path d="M14 5l7 7m0 0l-7 7m7-7H3"/></svg>
                        </button>
                    </form>

                    <p class="mt-8 text-center text-sm font-bold text-gray-400">
                        Already have an account? <a href="${pageContext.request.contextPath}/login" class="text-nearfix-green hover:underline decoration-2">Sign in here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectRole(role) {
            const userCard = document.getElementById('role-user');
            const repairerCard = document.getElementById('role-repairer');
            const userFields = document.getElementById('user-fields');
            const repairerFields = document.getElementById('repairer-fields');
            const userPhoneWrap = document.getElementById('user-phone-wrap');
            const roleInput = document.getElementById('role-input');
            const title = document.getElementById('form-title');
            const btnText = document.getElementById('btn-text');
            const submitBtn = document.getElementById('submit-btn');

            roleInput.value = role;

            if (role === 'USER') {
                userCard.classList.add('active-user');
                repairerCard.classList.remove('active-repairer');
                userFields.classList.remove('hidden');
                repairerFields.classList.add('hidden');
                userPhoneWrap.classList.remove('hidden');
                
                title.innerText = "Create account";
                btnText.innerText = "Create Account";
                submitBtn.className = "w-full py-5 bg-nearfix-green text-white font-black text-lg rounded-[2rem] shadow-2xl shadow-nearfix-green/30 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3";
            } else {
                repairerCard.classList.add('active-repairer');
                userCard.classList.remove('active-user');
                userFields.classList.add('hidden');
                repairerFields.classList.remove('hidden');
                userPhoneWrap.classList.add('hidden');

                title.innerText = "Join as Expert";
                btnText.innerText = "Submit Application";
                submitBtn.className = "w-full py-5 bg-blue-600 text-white font-black text-lg rounded-[2rem] shadow-2xl shadow-blue-500/30 hover:scale-[1.02] active:scale-95 transition-all flex items-center justify-center gap-3";
            }
        }

        // Initialize required fields on load
        window.onload = () => selectRole('${not empty param.role ? param.role : "USER"}');
    </script>
</body>
</html>
