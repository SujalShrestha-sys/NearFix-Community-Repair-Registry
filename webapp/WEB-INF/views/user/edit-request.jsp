<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Repair Request - NearFix</title>
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
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.6);
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

        <main class="pt-8 px-6 md:px-12 pb-16 max-w-5xl mx-auto w-full">
            <div class="flex items-center gap-4 mb-10">
                <a href="${pageContext.request.contextPath}/user/my-requests" class="w-10 h-10 bg-white rounded-full flex items-center justify-center text-dark border border-border hover:bg-muted-light transition-all no-underline shadow-sm">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M15 19l-7-7 7-7"></path></svg>
                </a>
                <div>
                    <h2 class="text-3xl font-black tracking-tighter text-dark">Edit Request</h2>
                    <p class="text-xs font-bold text-muted-dark uppercase tracking-widest mt-1">Refining your repair task details</p>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-[1fr_350px] gap-10">
                <div class="space-y-8">
                    <div class="glass-card rounded-[32px] p-8 md:p-10 border border-border shadow-sm">
                        <form action="${pageContext.request.contextPath}/user/repair-request" method="POST" class="space-y-8">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="requestId" value="${req.requestId}">

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                <div class="space-y-2.5">
                                    <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Item Identity</label>
                                    <input type="text" name="itemName" value="${req.itemName}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" placeholder="e.g. Broken Laptop Screen" required>
                                </div>

                                <div class="space-y-2.5">
                                    <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Category</label>
                                    <select name="category" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all appearance-none cursor-pointer">
                                        <c:forEach var="cat" items="${categories}">
                                            <option value="${cat.categoryId}" ${req.categoryId == cat.categoryId ? 'selected' : ''}>${cat.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="space-y-2.5">
                                    <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Urgency Protocol</label>
                                    <select name="urgency" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all appearance-none cursor-pointer">
                                        <option value="NORMAL" ${req.urgency == 'NORMAL' ? 'selected' : ''}>Normal Routine</option>
                                        <option value="URGENT" ${req.urgency == 'URGENT' ? 'selected' : ''}>Urgent Attention</option>
                                        <option value="EMERGENCY" ${req.urgency == 'EMERGENCY' ? 'selected' : ''}>Emergency Fixing</option>
                                    </select>
                                </div>

                                <div class="space-y-2.5">
                                    <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Repair Location</label>
                                    <input type="text" name="location" value="${req.location}" class="w-full bg-background/50 px-6 py-4 rounded-[16px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all" placeholder="e.g. My Home, Near Downtown">
                                </div>
                            </div>

                            <div class="space-y-2.5">
                                <label class="text-[10px] font-black uppercase tracking-widest text-muted-dark ml-4">Problem Description</label>
                                <textarea name="description" rows="5" class="w-full bg-background/50 px-6 py-4 rounded-[12px] font-bold text-sm border-2 border-transparent input-focus outline-none transition-all resize-none" placeholder="Explain the issue in detail..." required>${req.description}</textarea>
                            </div>

                            <div class="pt-6 flex gap-4 justify-center">
                                <button type="submit" class="mesh-gradient text-white px-10 py-4 rounded-[16px] font-black text-xs uppercase tracking-[0.2em] shadow-xl shadow-primary/20 hover:scale-[1.02] active:scale-[0.98] transition-all flex items-center gap-4">
                                    Save Changes
                                </button>
                                <a href="${pageContext.request.contextPath}/user/my-requests" class="px-10 py-4 rounded-[16px] font-black text-xs uppercase tracking-[0.2em] border-2 border-border text-muted-dark hover:bg-muted-light transition-all no-underline text-center">
                                    Cancel
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Info Side -->
                <div class="space-y-8">
                    <div class="glass-card rounded-[32px] p-8 border border-primary/20 bg-primary/5 relative overflow-hidden">
                        <div class="absolute -top-10 -right-10 w-32 h-32 bg-primary/10 rounded-full blur-3xl"></div>
                        <h4 class="text-sm font-black uppercase tracking-widest text-primary mb-4 flex items-center gap-3">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            Expert Advice
                        </h4>
                        <p class="text-[11px] font-bold text-muted-dark leading-relaxed">
                            Updating your request details can help repairers better understand the task. Be as specific as possible in your description to get more accurate quotes.
                        </p>
                    </div>

                    <div class="glass-card rounded-[32px] p-8 border border-border">
                        <h4 class="text-sm font-black uppercase tracking-widest text-dark mb-6">Current Status</h4>
                        <div class="flex items-center gap-4">
                            <div class="w-12 h-12 bg-primary/10 rounded-2xl flex items-center justify-center text-primary">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                            </div>
                            <div>
                                <div class="text-lg font-black tracking-tighter text-primary">${req.status}</div>
                                <div class="text-[9px] font-black uppercase tracking-widest text-muted-dark">Only pending tasks are editable</div>
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
