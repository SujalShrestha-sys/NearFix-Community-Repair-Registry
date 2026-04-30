<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NearFix - User Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        serif: ['Playfair Display', 'serif'],
                    },
                    colors: {
                        primary: '#489574',
                        'primary-light': '#e8f3ee',
                        'bg-light': '#faf9f6',
                    }
                }
            }
        }
    </script>
    <style>
        body {
            background-color: #faf9f6;
        }
        .nav-item.active {
            background-color: #e8f3ee;
            color: #489574;
            font-weight: 600;
        }
        .nav-item.active i {
            color: #489574;
        }
        .section-container {
            display: none;
        }
        .section-container.active {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        /* Toast notification animation */
        #toast {
            visibility: hidden;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.3s ease-in-out;
        }
        #toast.show {
            visibility: visible;
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body class="text-gray-800 h-screen flex overflow-hidden">

    <!-- Sidebar -->
    <aside class="w-64 bg-white border-r border-gray-200 flex flex-col h-full flex-shrink-0">
        <!-- Logo Area -->
        <div class="h-16 flex items-center px-6 border-b border-gray-200">
            <div class="flex items-center gap-3">
                <div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-white">
                    <i class="fa-solid fa-wrench text-sm"></i>
                </div>
                <div>
                    <h1 class="font-bold text-gray-900 leading-tight">NearFix</h1>
                    <p class="text-[10px] font-semibold text-gray-500 tracking-wider">USER PORTAL</p>
                </div>
            </div>
        </div>

        <!-- Navigation -->
        <div class="p-4 flex-1">
            <p class="text-xs font-semibold text-gray-400 mb-4 px-2 uppercase tracking-wider">Navigation</p>
            <nav class="space-y-1">
                <a href="#" onclick="navigate('dashboard')" id="nav-dashboard" class="nav-item active flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition-colors">
                    <i class="fa-solid fa-border-all w-5 text-center text-gray-400"></i>
                    Dashboard
                </a>
                <a href="#" onclick="navigate('new-request')" id="nav-new-request" class="nav-item flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition-colors">
                    <i class="fa-regular fa-square-plus w-5 text-center text-gray-400"></i>
                    New Request
                </a>
                <a href="#" onclick="navigate('my-requests')" id="nav-my-requests" class="nav-item flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition-colors">
                    <i class="fa-regular fa-clipboard w-5 text-center text-gray-400"></i>
                    My Requests
                </a>
                <a href="#" onclick="navigate('profile')" id="nav-profile" class="nav-item flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition-colors">
                    <i class="fa-regular fa-user w-5 text-center text-gray-400"></i>
                    Profile
                </a>
            </nav>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 flex flex-col h-full overflow-hidden">
        <!-- Topbar -->
        <header class="h-16 bg-white border-b border-gray-200 flex items-center justify-between px-6 flex-shrink-0">
            <div class="flex items-center gap-3">
                <i class="fa-solid fa-table-columns text-gray-400"></i>
                <h2 class="font-serif font-bold text-lg text-gray-900">User Portal</h2>
            </div>
            <div class="flex items-center gap-6">
                <a href="#" class="text-gray-500 hover:text-gray-700">
                    <i class="fa-solid fa-house"></i>
                </a>
                <div class="flex items-center gap-2 bg-gray-50 px-3 py-1.5 rounded-full border border-gray-100">
                    <div class="w-6 h-6 rounded-full bg-primary flex items-center justify-center text-white text-xs font-medium">
                        R@
                    </div>
                    <span class="text-sm text-gray-600">r@gmail.com</span>
                </div>
                <a href="#" class="flex items-center gap-2 text-sm text-gray-500 hover:text-gray-800 transition-colors">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    Sign Out
                </a>
            </div>
        </header>

        <!-- Scrollable Content Area -->
        <div class="flex-1 overflow-y-auto p-8">
            <div class="max-w-6xl mx-auto">

                <!-- DASHBOARD SECTION -->
                <section id="dashboard" class="section-container active">
                    <div class="flex justify-between items-end mb-8">
                        <div>
                            <h1 class="text-3xl font-serif font-bold text-gray-900 mb-2">Welcome back <span class="inline-block wave">👋</span></h1>
                            <p class="text-gray-500">Here's an overview of your repair requests.</p>
                        </div>
                        <button onclick="navigate('new-request')" class="bg-primary hover:bg-emerald-700 text-white px-5 py-2.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-2">
                            <i class="fa-solid fa-circle-plus"></i> New Request
                        </button>
                    </div>

                    <!-- Stats Cards -->
                    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-10">
                        <div class="bg-[#ecf5f0] p-6 rounded-xl border border-[#d8ebe1]">
                            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center mb-4 text-primary shadow-sm">
                                <i class="fa-regular fa-clipboard"></i>
                            </div>
                            <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                            <p class="text-sm text-gray-500">Total Requests</p>
                        </div>
                        <div class="bg-[#fff6ef] p-6 rounded-xl border border-[#fce8da]">
                            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center mb-4 text-orange-400 shadow-sm">
                                <i class="fa-regular fa-clock"></i>
                            </div>
                            <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                            <p class="text-sm text-gray-500">Open</p>
                        </div>
                        <div class="bg-[#fff8eb] p-6 rounded-xl border border-[#fbebd0]">
                            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center mb-4 text-yellow-500 shadow-sm">
                                <i class="fa-solid fa-arrow-trend-up"></i>
                            </div>
                            <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                            <p class="text-sm text-gray-500">In Progress</p>
                        </div>
                        <div class="bg-[#ecf5f0] p-6 rounded-xl border border-[#d8ebe1]">
                            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center mb-4 text-primary shadow-sm">
                                <i class="fa-regular fa-circle-check"></i>
                            </div>
                            <h3 class="text-3xl font-bold text-gray-900 mb-1">0</h3>
                            <p class="text-sm text-gray-500">Completed</p>
                        </div>
                    </div>

                    <!-- Recent Requests -->
                    <div>
                        <div class="flex justify-between items-center mb-4">
                            <h2 class="text-lg font-serif font-bold text-gray-900">Recent Requests</h2>
                            <a href="#" onclick="navigate('my-requests')" class="text-sm text-primary font-medium hover:underline flex items-center gap-1">
                                View All <i class="fa-solid fa-arrow-right text-xs"></i>
                            </a>
                        </div>
                        <div class="bg-bg-light border border-gray-100 rounded-2xl py-16 flex flex-col items-center justify-center text-center shadow-sm">
                            <div class="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center mb-4 text-gray-500">
                                <i class="fa-solid fa-triangle-exclamation text-xl"></i>
                            </div>
                            <h3 class="text-lg font-serif font-bold text-gray-900 mb-2">No requests yet</h3>
                            <p class="text-sm text-gray-500 mb-6">Create your first repair request to get started!</p>
                            <button onclick="navigate('new-request')" class="bg-primary hover:bg-emerald-700 text-white px-5 py-2 rounded-lg text-sm font-medium transition-colors flex items-center gap-2">
                                <i class="fa-solid fa-circle-plus"></i> Create Request
                            </button>
                        </div>
                    </div>
                </section>

                <!-- NEW REQUEST SECTION -->
                <section id="new-request" class="section-container">
                    <div class="text-center mb-8">
                        <h1 class="text-3xl font-serif font-bold text-gray-900 mb-2">Submit a Repair Request</h1>
                        <p class="text-gray-500">Describe what needs fixing and we'll connect you with a local repairer.</p>
                    </div>

                    <div class="max-w-2xl mx-auto bg-[#faf9f6] border border-[#f0eee9] rounded-2xl p-8 shadow-sm">
                        <form onsubmit="event.preventDefault(); navigate('my-requests');">
                            <div class="space-y-6">
                                <!-- What needs repair -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-solid fa-wrench text-primary w-4"></i> What needs repair?
                                    </label>
                                    <input type="text" placeholder="e.g. Broken kitchen faucet, cracked phone screen..." class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white">
                                </div>

                                <!-- Describe the issue -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-solid fa-circle-info text-primary w-4"></i> Describe the issue
                                    </label>
                                    <textarea rows="4" placeholder="Provide details about the problem — when it started, what you've tried, any relevant specifics..." class="w-full border border-gray-200 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white resize-none"></textarea>
                                </div>

                                <!-- Category and Urgency -->
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                            <span class="text-primary font-bold w-4 text-center">≡</span> Category
                                        </label>
                                        <select class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white appearance-none cursor-pointer">
                                            <option value="" disabled selected>Select a category</option>
                                            <option>Plumbing</option>
                                            <option>Electrical</option>
                                            <option>Electronics</option>
                                            <option>Carpentry</option>
                                        </select>
                                    </div>
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                            <i class="fa-solid fa-bolt text-primary w-4 text-center"></i> Urgency
                                        </label>
                                        <select class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white appearance-none cursor-pointer">
                                            <option>Normal — Within a day or two</option>
                                            <option>Urgent — As soon as possible</option>
                                            <option>Low — Whenever available</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Location -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-solid fa-location-dot text-primary w-4"></i> Location
                                    </label>
                                    <input type="text" placeholder="e.g. 123 Main St, City" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white">
                                </div>

                                <!-- Submit Button -->
                                <div class="pt-2">
                                    <button type="submit" class="w-full bg-primary hover:bg-emerald-700 text-white py-3 rounded-lg font-medium transition-colors">
                                        Submit Request
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>

                <!-- MY REQUESTS SECTION -->
                <section id="my-requests" class="section-container">
                    <div class="flex justify-between items-end mb-8">
                        <div>
                            <h1 class="text-3xl font-serif font-bold text-gray-900 mb-2">My Requests</h1>
                            <p class="text-gray-500">Track and manage all your repair requests.</p>
                        </div>
                        <button onclick="navigate('new-request')" class="bg-primary hover:bg-emerald-700 text-white px-5 py-2.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-2">
                            <i class="fa-solid fa-circle-plus"></i> New Request
                        </button>
                    </div>

                    <div class="bg-bg-light border border-gray-100 rounded-2xl py-24 flex flex-col items-center justify-center text-center shadow-sm">
                        <div class="w-14 h-14 bg-gray-100 rounded-2xl flex items-center justify-center mb-5 text-gray-500">
                            <i class="fa-solid fa-box-open text-2xl"></i>
                        </div>
                        <h3 class="text-xl font-serif font-bold text-gray-900 mb-2">No requests yet</h3>
                        <p class="text-gray-500 mb-6">Submit your first repair request to get started.</p>
                        <button onclick="navigate('new-request')" class="bg-primary hover:bg-emerald-700 text-white px-5 py-2.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-2">
                            <i class="fa-solid fa-circle-plus"></i> Create Request
                        </button>
                    </div>
                </section>

                <!-- PROFILE SECTION -->
                <section id="profile" class="section-container">
                    <div class="text-center mb-8">
                        <h1 class="text-3xl font-serif font-bold text-gray-900 mb-2">My Profile</h1>
                        <p class="text-gray-500">Manage your personal information.</p>
                    </div>

                    <div class="max-w-xl mx-auto bg-[#faf9f6] border border-[#f0eee9] rounded-2xl p-8 shadow-sm">
                        <!-- Profile Header -->
                        <div class="flex items-center gap-4 mb-6">
                            <div class="w-16 h-16 rounded-full bg-primary flex items-center justify-center text-white text-xl font-medium">
                                R@
                            </div>
                            <div>
                                <h3 class="text-lg font-bold text-gray-900">Your Name</h3>
                                <p class="text-sm text-gray-500">r@gmail.com</p>
                            </div>
                        </div>

                        <hr class="border-gray-200 mb-6">

                        <form onsubmit="event.preventDefault(); showToast();">
                            <div class="space-y-6">
                                <!-- Email (Disabled) -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-regular fa-envelope text-primary w-4"></i> Email
                                    </label>
                                    <input type="email" value="r@gmail.com" disabled class="w-full border border-gray-200 rounded-lg px-4 py-2.5 bg-gray-50 text-gray-500 cursor-not-allowed">
                                </div>

                                <!-- Full Name -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-regular fa-circle-user text-primary w-4"></i> Full Name
                                    </label>
                                    <input type="text" placeholder="Enter your full name" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white">
                                </div>

                                <!-- Phone Number -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-2 flex items-center gap-2">
                                        <i class="fa-solid fa-phone text-primary w-4"></i> Phone Number
                                    </label>
                                    <input type="tel" placeholder="Enter your phone number" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-colors bg-white">
                                </div>

                                <!-- Save Button -->
                                <div class="pt-2">
                                    <button type="submit" class="w-full bg-primary hover:bg-emerald-700 text-white py-3 rounded-lg font-medium transition-colors flex items-center justify-center gap-2">
                                        <i class="fa-regular fa-floppy-disk"></i> Save Changes
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>

            </div>
        </div>
    </main>

    <!-- Toast Notification -->
    <div id="toast" class="fixed bottom-6 right-6 bg-white border border-gray-100 shadow-lg rounded-xl p-4 flex items-start gap-3 max-w-sm z-50">
        <div>
            <h4 class="font-bold text-gray-900 text-sm mb-0.5">Profile Updated</h4>
            <p class="text-sm text-gray-600">Your changes have been saved successfully.</p>
        </div>
    </div>

    <!-- JavaScript for Navigation and Interactions -->
    <script>
        function navigate(sectionId) {
            // Update active state in sidebar
            document.querySelectorAll('.nav-item').forEach(item => {
                item.classList.remove('active');
            });
            document.getElementById('nav-' + sectionId).classList.add('active');

            // Update visible section
            document.querySelectorAll('.section-container').forEach(section => {
                section.classList.remove('active');
            });
            document.getElementById(sectionId).classList.add('active');
        }

        let toastTimeout;
        function showToast() {
            const toast = document.getElementById('toast');
            toast.classList.add('show');

            clearTimeout(toastTimeout);
            toastTimeout = setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }

        // Ensure dropdowns have icons overlay where appropriate (pure css approach used above with fa icons next to labels)
    </script>
</body>
</html>
