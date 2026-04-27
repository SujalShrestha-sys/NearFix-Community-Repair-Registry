<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repairer Portal - Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background-color: #FAFAFA;
        }
        .font-serif-custom {
            font-family: 'Playfair Display', serif;
        }

        /* Toast Animation */
        @keyframes slideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        @keyframes slideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }
        .toast-enter {
            animation: slideIn 0.3s cubic-bezier(0.4, 0, 0.2, 1) forwards;
        }
        .toast-exit {
            animation: slideOut 0.3s cubic-bezier(0.4, 0, 0.2, 1) forwards;
        }

        /* SPA Pages display control */
        .page-content { display: none; }
        .page-content.active { display: block; }
    </style>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#F0F9F5',
                            100: '#D1FAE5',
                            500: '#10B981',
                            600: '#409074',
                            700: '#2F6C56',
                            900: '#064E3B',
                        }
                    }
                }
            }
        }

        // Toast functionality
        function showToast() {
            const toast = document.getElementById('toast');

            // Remove hidden and exit classes if present
            toast.classList.remove('hidden', 'toast-exit');
            toast.classList.add('toast-enter');

            // Hide after 3 seconds
            setTimeout(() => {
                toast.classList.remove('toast-enter');
                toast.classList.add('toast-exit');

                // Set to hidden after animation completes
                setTimeout(() => {
                    toast.classList.add('hidden');
                }, 300);
            }, 3000);
        }

        // Single Page Navigation functionality
        function navigateTo(pageId) {
            // Hide all pages
            document.querySelectorAll('.page-content').forEach(el => el.classList.remove('active'));
            // Show target page
            document.getElementById(pageId).classList.add('active');

            // Update Page Title
            const titles = {
                'dashboard': 'Dashboard',
                'availablejobs': 'Available Jobs',
                'myjobs': 'My Jobs',
                'profile': 'Profile'
            };
            document.title = `Repairer Portal - ${titles[pageId]}`;

            // Update navigation styles
            const navLinks = {
                'dashboard': document.getElementById('nav-dashboard'),
                'availablejobs': document.getElementById('nav-availablejobs'),
                'myjobs': document.getElementById('nav-myjobs'),
                'profile': document.getElementById('nav-profile')
            };

            const activeClass = ['bg-brand-50', 'text-brand-700'];
            const inactiveClass = ['text-gray-500', 'hover:bg-gray-50', 'hover:text-gray-900'];

            const icons = {
                'dashboard': 'ph-squares-four',
                'availablejobs': 'ph-magnifying-glass',
                'myjobs': 'ph-clipboard-text',
                'profile': 'ph-user'
            };

            for (const [id, el] of Object.entries(navLinks)) {
                const icon = el.querySelector('i');
                if (id === pageId) {
                    el.classList.remove(...inactiveClass);
                    el.classList.add(...activeClass);
                    // Active icon is filled
                    icon.className = `ph-fill ${icons[id]} text-xl`;
                } else {
                    el.classList.remove(...activeClass);
                    el.classList.add(...inactiveClass);
                    // Inactive icon is outlined
                    icon.className = `ph ${icons[id]} text-xl`;
                }
            }
        }
    </script>
</head>
<body class="flex h-screen overflow-hidden text-gray-800">

    <!-- Sidebar -->
    <aside class="w-64 bg-white border-r border-gray-100 flex flex-col hidden md:flex z-10 shadow-[2px_0_8px_-4px_rgba(0,0,0,0.05)]">
        <!-- Logo -->
        <div class="h-20 flex items-center px-6 border-b border-transparent">
            <div class="flex items-center gap-3">
                <div class="bg-brand-600 rounded-full w-9 h-9 flex items-center justify-center text-white shadow-sm">
                    <i class="ph-fill ph-wrench text-lg"></i>
                </div>
                <div>
                    <h1 class="font-bold text-gray-900 text-lg leading-tight">NearFix</h1>
                    <p class="text-[10px] font-bold text-gray-400 tracking-widest mt-0.5 uppercase">Repairer Portal</p>
                </div>
            </div>
        </div>

        <!-- Navigation -->
        <div class="flex-1 py-6 px-4">
            <p class="text-[11px] font-bold text-gray-400 mb-4 px-2 tracking-wider">NAVIGATION</p>
            <nav class="space-y-1">
                <button id="nav-dashboard" onclick="navigateTo('dashboard')" class="w-full flex items-center gap-3 px-3 py-2.5 bg-brand-50 text-brand-700 rounded-xl font-medium transition-colors text-left">
                    <i class="ph-fill ph-squares-four text-xl"></i>
                    <span class="text-sm">Dashboard</span>
                </button>
                <button id="nav-availablejobs" onclick="navigateTo('availablejobs')" class="w-full flex items-center gap-3 px-3 py-2.5 text-gray-500 hover:bg-gray-50 hover:text-gray-900 rounded-xl font-medium transition-colors text-left">
                    <i class="ph ph-magnifying-glass text-xl"></i>
                    <span class="text-sm">Available Jobs</span>
                </button>
                <button id="nav-myjobs" onclick="navigateTo('myjobs')" class="w-full flex items-center gap-3 px-3 py-2.5 text-gray-500 hover:bg-gray-50 hover:text-gray-900 rounded-xl font-medium transition-colors text-left">
                    <i class="ph ph-clipboard-text text-xl"></i>
                    <span class="text-sm">My Jobs</span>
                </button>
                <button id="nav-profile" onclick="navigateTo('profile')" class="w-full flex items-center gap-3 px-3 py-2.5 text-gray-500 hover:bg-gray-50 hover:text-gray-900 rounded-xl font-medium transition-colors text-left">
                    <i class="ph ph-user text-xl"></i>
                    <span class="text-sm">Profile</span>
                </button>
            </nav>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 flex flex-col h-full relative bg-[#FAFAFA]">
        <!-- Header -->
        <header class="h-20 flex items-center justify-between px-8 z-10">
            <div class="flex items-center gap-4">
                <button class="text-gray-500 hover:text-gray-700 transition-colors">
                    <i class="ph ph-sidebar-simple text-2xl"></i>
                </button>
                <h2 class="font-bold text-gray-900 text-lg font-serif-custom">Repairer Portal</h2>
            </div>
            <div class="flex items-center gap-5">
                <button class="text-gray-600 hover:text-gray-900 transition-colors">
                    <i class="ph ph-house text-xl"></i>
                </button>
                <div class="flex items-center gap-2 bg-gray-100/80 rounded-full py-1.5 px-1.5 pr-4 border border-gray-200/60">
                    <div class="bg-[#D3E8E0] text-brand-700 rounded-full w-7 h-7 flex items-center justify-center text-[11px] font-bold tracking-wide">
                        SU
                    </div>
                    <span class="text-sm text-gray-600 font-medium">sujak555@gmail.com</span>
                </div>
                <button class="flex items-center gap-2 text-gray-500 hover:text-gray-800 text-sm font-medium transition-colors border-l border-gray-200 pl-5">
                    <i class="ph ph-sign-out text-lg"></i>
                    Sign Out
                </button>
            </div>
        </header>

        <!-- Content Area -->
        <div class="flex-1 overflow-y-auto px-8 pb-12">

            <!-- Dashboard Page -->
            <div id="dashboard" class="page-content active">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">Repairer Dashboard</h1>
                        <p class="text-gray-500 text-[15px]">Find jobs and manage your repairs.</p>
                    </div>
                    <button onclick="navigateTo('availablejobs')" class="bg-brand-600 hover:bg-brand-700 text-white px-5 py-2.5 rounded-xl flex items-center gap-2 font-medium transition-colors shadow-sm text-sm">
                        <i class="ph ph-magnifying-glass text-lg"></i>
                        Browse Jobs
                    </button>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
                    <div class="bg-[#FCF5F0] p-6 rounded-2xl border border-[#FBE8DB] shadow-[0_2px_10px_-4px_rgba(0,0,0,0.02)]">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-magnifying-glass text-[#E08A56] text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Available Jobs</p>
                    </div>
                    <div class="bg-[#F2F7F5] p-6 rounded-2xl border border-[#E3ECE7] shadow-[0_2px_10px_-4px_rgba(0,0,0,0.02)]">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-wrench text-brand-600 text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Active Jobs</p>
                    </div>
                    <div class="bg-[#F0F9F3] p-6 rounded-2xl border border-[#DCF0E3] shadow-[0_2px_10px_-4px_rgba(0,0,0,0.02)]">
                        <div class="bg-white w-11 h-11 rounded-full flex items-center justify-center mb-5 shadow-sm">
                            <i class="ph ph-check-circle text-brand-600 text-xl"></i>
                        </div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                        <p class="text-gray-500 text-[13px] font-medium uppercase tracking-wide">Completed</p>
                    </div>
                </div>

                <div>
                    <div class="flex justify-between items-center mb-5">
                        <h2 class="text-xl font-bold text-gray-900 font-serif-custom">My Recent Jobs</h2>
                        <button onclick="navigateTo('myjobs')" class="text-brand-600 text-sm font-medium hover:text-brand-700 flex items-center gap-1.5 transition-colors">
                            View All <i class="ph ph-arrow-right"></i>
                        </button>
                    </div>

                    <div class="bg-[#FAFAFA] border border-gray-200 rounded-3xl py-24 flex flex-col items-center justify-center text-center shadow-[inset_0_2px_10px_-5px_rgba(0,0,0,0.02)]">
                        <div class="bg-white w-14 h-14 rounded-2xl flex items-center justify-center mb-5 shadow-sm border border-gray-100">
                            <i class="ph ph-briefcase text-brand-600 text-2xl"></i>
                        </div>
                        <h3 class="text-[19px] font-bold text-gray-900 font-serif-custom mb-1.5">No jobs yet</h3>
                        <p class="text-gray-500 text-[15px]">Browse available jobs to start repairing!</p>
                    </div>
                </div>
            </div>

            <!-- Available Jobs Page -->
            <div id="availablejobs" class="page-content">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">Available Jobs</h1>
                        <p class="text-gray-500 text-[15px]">Browse open repair requests in your area.</p>
                    </div>
                </div>

                <div class="bg-[#FAFAFA] border border-gray-200 rounded-3xl py-28 flex flex-col items-center justify-center text-center shadow-[inset_0_2px_10px_-5px_rgba(0,0,0,0.02)] mt-6">
                    <div class="bg-white w-14 h-14 rounded-2xl flex items-center justify-center mb-5 shadow-sm border border-gray-100">
                        <i class="ph ph-tray text-brand-600 text-2xl"></i>
                    </div>
                    <h3 class="text-[19px] font-bold text-gray-900 font-serif-custom mb-1.5">No open jobs right now</h3>
                    <p class="text-gray-500 text-[15px]">Check back later for new repair requests.</p>
                </div>
            </div>

            <!-- My Jobs Page -->
            <div id="myjobs" class="page-content">
                <div class="flex justify-between items-end mb-8 pt-4">
                    <div>
                        <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">My Jobs</h1>
                        <p class="text-gray-500 text-[15px]">Manage your accepted repair jobs.</p>
                    </div>
                </div>

                <div class="bg-[#FAFAFA] border border-gray-200 rounded-3xl py-28 flex flex-col items-center justify-center text-center shadow-[inset_0_2px_10px_-5px_rgba(0,0,0,0.02)] mt-6">
                    <div class="bg-white w-14 h-14 rounded-2xl flex items-center justify-center mb-5 shadow-sm border border-gray-100">
                        <i class="ph ph-package text-brand-600 text-2xl"></i>
                    </div>
                    <h3 class="text-[19px] font-bold text-gray-900 font-serif-custom mb-1.5">No jobs accepted yet</h3>
                    <p class="text-gray-500 text-[15px]">Browse available jobs to start working.</p>
                </div>
            </div>

            <!-- Profile Page -->
            <div id="profile" class="page-content">
                <div class="text-center mb-8 pt-8">
                    <h1 class="text-[32px] font-bold text-gray-900 font-serif-custom mb-1">My Profile</h1>
                    <p class="text-gray-500 text-[15px]">Manage your repairer profile information.</p>
                </div>

                <div class="bg-[#F8F9F8] border border-gray-100 rounded-[28px] p-8 max-w-xl mx-auto shadow-[inset_0_1px_5px_rgba(0,0,0,0.01)] mt-2">
                    <div class="flex items-center gap-5 mb-6">
                        <div class="bg-brand-600 rounded-full w-16 h-16 flex items-center justify-center text-white text-xl font-bold shadow-sm">
                            SU
                        </div>
                        <div>
                            <h2 class="text-lg font-bold text-gray-900">Sujal Shrestha</h2>
                            <p class="text-sm text-gray-500 mt-0.5">sujalx555@gmail.com</p>
                        </div>
                    </div>

                    <hr class="border-gray-200/60 mb-6">

                    <div class="space-y-5">
                        <div>
                            <label class="flex items-center gap-1.5 text-sm font-bold text-gray-900 mb-2">
                                <i class="ph ph-envelope text-brand-600 text-lg"></i>
                                Email
                            </label>
                            <input type="email" value="sujalx555@gmail.com" readonly class="w-full bg-[#F5F5F5] border border-gray-100/50 text-gray-500 rounded-xl px-4 py-3 outline-none cursor-not-allowed text-[15px]">
                        </div>

                        <div>
                            <label class="flex items-center gap-1.5 text-sm font-bold text-gray-900 mb-2">
                                <i class="ph ph-user-circle text-brand-600 text-lg"></i>
                                Full Name
                            </label>
                            <input type="text" value="Sujal Shrestha" class="w-full bg-white border border-gray-200/60 text-gray-800 rounded-xl px-4 py-3 outline-none focus:border-brand-500 focus:ring-1 focus:ring-brand-500 transition-shadow text-[15px] shadow-[0_1px_2px_rgba(0,0,0,0.02)]">
                        </div>

                        <div>
                            <label class="flex items-center gap-1.5 text-sm font-bold text-gray-900 mb-2">
                                <i class="ph ph-phone text-brand-600 text-lg"></i>
                                Phone Number
                            </label>
                            <input type="tel" value="9800925222" class="w-full bg-white border border-gray-200/60 text-gray-800 rounded-xl px-4 py-3 outline-none focus:border-brand-500 focus:ring-1 focus:ring-brand-500 transition-shadow text-[15px] shadow-[0_1px_2px_rgba(0,0,0,0.02)]">
                        </div>

                        <div class="pt-4">
                            <button onclick="showToast()" class="w-full bg-brand-600 hover:bg-brand-700 text-white rounded-xl px-4 py-3.5 flex items-center justify-center gap-2 font-bold transition-colors shadow-sm text-[15px]">
                                <i class="ph ph-floppy-disk text-lg"></i>
                                Save Changes
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <!-- Toast Notification -->
    <div id="toast" class="fixed top-8 right-8 bg-white border border-gray-100 rounded-xl shadow-[0_4px_20px_-4px_rgba(0,0,0,0.1)] p-4 flex flex-col gap-1 z-50 hidden min-w-[300px]">
        <h4 class="font-bold text-[#0A2540] text-[15px]">Profile Updated</h4>
        <p class="text-gray-600 text-sm">Your changes have been saved.</p>
    </div>

</body>
</html>
