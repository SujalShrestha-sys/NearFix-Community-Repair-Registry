<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | NearFix</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts: Inter & Playfair Display -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .serif { font-family: 'Playfair Display', serif; }
        .glass-effect {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        /* Custom scrollbar for desktop form side */
        @media (min-width: 768px) {
            .side-scroll::-webkit-scrollbar { width: 4px; }
            .side-scroll::-webkit-scrollbar-track { background: transparent; }
            .side-scroll::-webkit-scrollbar-thumb { background: #e5e7eb; border-radius: 10px; }
        }
    </style>
</head>
<body class="bg-white antialiased">

<div class="flex flex-col md:flex-row md:h-screen md:overflow-hidden">
    <!-- Left Sidebar: Branding (Visible on Desktop) -->
    <div class="hidden md:flex md:w-5/12 lg:w-1/2 bg-[#449E80] p-12 lg:p-20 flex-col justify-center text-white relative overflow-hidden h-full">
        <!-- Abstract background shapes -->
        <div class="absolute top-0 right-0 -mr-24 -mt-24 w-96 h-96 bg-white/10 rounded-full blur-3xl"></div>
        <div class="absolute bottom-0 left-0 -ml-24 -mb-24 w-96 h-96 bg-white/10 rounded-full blur-3xl"></div>

        <div class="relative z-10">
            <div class="flex items-center gap-3 mb-10">
                <div class="p-2.5 bg-white/20 rounded-xl glass-effect">
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-white"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
                </div>
                <span class="text-2xl font-bold tracking-tight">NearFix</span>
            </div>

            <h1 class="serif text-5xl lg:text-4xl xl:text-5xl mb-6 leading-tight">
                Join the repair<br>revolution today.
            </h1>
            <p class="text-lg text-white/80 max-w-sm leading-relaxed font-light">
                Create your free account and start connecting with skilled local repairers in your neighborhood.
            </p>
        </div>

        <div class="mt-auto relative z-10 text-xs text-white/50 tracking-widest uppercase">
            &copy; 2024 NearFix Platform
        </div>
    </div>

    <!-- Right Section: Registration Form -->
    <div class="flex-1 flex flex-col justify-center bg-gray-50/30 h-full overflow-y-auto side-scroll">
        <div class="max-w-md w-full mx-auto px-6 py-10 md:py-8">
            <!-- Mobile Logo -->
            <div class="md:hidden flex items-center gap-2 mb-8 text-[#449E80]">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg>
                <span class="text-xl font-bold">NearFix</span>
            </div>

            <header class="mb-6 md:mb-5">
                <h2 class="serif text-3xl md:text-3xl lg:text-4xl text-gray-900 mb-1">Create your account</h2>
                <p class="text-gray-500 text-sm md:text-base">Start your repair journey with NearFix</p>
            </header>

            <!-- JSP Messages -->
            <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="mb-5 p-3.5 bg-red-50 border border-red-100 text-red-600 rounded-xl flex items-center gap-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="flex-shrink-0"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                <span class="text-xs font-semibold uppercase tracking-wide pt-0.5"><%= request.getAttribute("errorMessage") %></span>
            </div>
            <% } %>

            <% if (request.getAttribute("successMessage") != null) { %>
            <div class="mb-5 p-3.5 bg-emerald-50 border border-emerald-100 text-emerald-600 rounded-xl flex items-center gap-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="flex-shrink-0"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                <span class="text-xs font-semibold uppercase tracking-wide pt-0.5"><%= request.getAttribute("successMessage") %></span>
            </div>
            <% } %>

            <form method="post" action="register" onsubmit="return validateForm()" class="space-y-3.5 md:space-y-3 lg:space-y-3.5">
                <!-- Full Name -->
                <div class="group">
                    <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Full Name</label>
                    <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                        <input type="text" name="name" placeholder="Full name" 
                            class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 placeholder-gray-300 text-sm" required>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-3.5 md:gap-3 lg:gap-3.5">
                    <!-- Email Address -->
                    <div class="group">
                        <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Email</label>
                        <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                            <input type="email" name="email" placeholder="Email" 
                                class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 placeholder-gray-300 text-sm" required>
                        </div>
                    </div>

                    <!-- Phone Number -->
                    <div class="group">
                        <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Phone</label>
                        <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                            <input type="tel" name="phone" pattern="[0-9]{10}" placeholder="Phone" 
                                class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 placeholder-gray-300 text-sm" required>
                        </div>
                    </div>
                </div>

                <!-- Role Selection -->
                <div class="group">
                    <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Account Type</label>
                    <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/></svg>
                        <select name="role" class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 text-sm appearance-none cursor-pointer" required>
                            <option value="">Select your role</option>
                            <option value="USER">USER</option>
                            <option value="REPAIRER">REPAIRER</option>
                        </select>
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300 pointer-events-none absolute right-4"><polyline points="6 9 12 15 18 9"/></svg>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-3.5 md:gap-3 lg:gap-3.5">
                    <!-- Password -->
                    <div class="group">
                        <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Password</label>
                        <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                            <input type="password" name="password" placeholder="••••••••" 
                                class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 placeholder-gray-300 text-sm" required>
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="group">
                        <label class="block text-[11px] font-bold text-gray-400 uppercase tracking-[0.1em] mb-1 ml-1">Confirm</label>
                        <div class="relative transition-all flex items-center bg-white border border-gray-200 rounded-xl px-4 py-3 md:py-2.5">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-300"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                            <input type="password" name="confirmPassword" placeholder="••••••••" 
                                class="ml-3 block w-full bg-transparent border-none outline-none focus:outline-none focus:ring-0 text-gray-900 placeholder-gray-300 text-sm" required>
                        </div>
                    </div>
                </div>

                <div class="pt-4 md:pt-3 lg:pt-4">
                    <button type="submit" class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white font-bold py-3.5 md:py-3 lg:py-4 px-6 rounded-xl transition-all duration-300 transform hover:-translate-y-0.5 hover:shadow-lg flex items-center justify-center gap-2">
                        <span>Create Account</span>
                    </button>
                </div>
            </form>

            <footer class="mt-8 md:mt-6 text-center">
                <p class="text-gray-400 text-xs md:text-sm">
                    Already have an account? 
                    <a href="login.jsp" class="text-[#449E80] font-bold hover:underline">Sign In</a>
                </p>
            </footer>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        const password = document.querySelector('input[name="password"]').value;
        const confirm = document.querySelector('input[name="confirmPassword"]').value;

        if (password.length < 8 || !/^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])/.test(password)) {
            alert("Password must be 8+ chars with uppercase, digit, and special char.");
            return false;
        }

        if (password !== confirm) {
            alert("Passwords do not match.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>