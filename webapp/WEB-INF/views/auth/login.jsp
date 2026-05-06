<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | NearFix</title>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Google Fonts: Inter & Playfair Display -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap"
            rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }

            .serif {
                font-family: 'Playfair Display', serif;
            }

            .glass-effect {
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
        </style>
    </head>

    <body class="bg-white antialiased">

        <div class="flex flex-col md:flex-row md:h-screen md:overflow-hidden">
            <!-- Left Sidebar: Branding (Visible on Desktop) -->
            <div
                class="hidden md:flex md:w-5/12 lg:w-1/2 bg-[#449E80] p-12 lg:p-20 flex-col justify-center text-white relative overflow-hidden h-full">
                <!-- Abstract background shapes -->
                <div class="absolute top-0 right-0 -mr-24 -mt-24 w-96 h-96 bg-white/10 rounded-full blur-3xl"></div>
                <div class="absolute bottom-0 left-0 -ml-24 -mb-24 w-96 h-96 bg-white/10 rounded-full blur-3xl"></div>

                <div class="relative z-10">
                    <div class="flex items-center gap-3 mb-10">
                        <div class="p-2.5 bg-white/20 rounded-xl glass-effect">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="text-white">
                                <path
                                    d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                            </svg>
                        </div>
                        <span class="text-2xl font-bold tracking-tight">NearFix</span>
                    </div>

                    <h1 class="serif text-4xl lg:text-5xl mb-6 leading-tight">
                        Fix it locally,<br>strengthen your community.
                    </h1>
                    <p class="text-lg text-white/80 max-w-sm leading-relaxed font-light">
                        Be part of a growing community that prefers fixing items instead of replacing them. Connect with trusted local fixers
                        today.
                    </p>
                </div>

                <div class="mt-auto relative z-10 text-xs text-white/50 tracking-widest uppercase">
                    &copy; 2024 NearFix Platform
                </div>
            </div>

            <!-- Right Section: Login Form -->
            <div class="flex-1 flex flex-col justify-center bg-white h-full overflow-y-auto">
                <div class="max-w-md w-full mx-auto px-6 py-10">
                    <!-- Mobile Logo -->
                    <div class="md:hidden flex items-center gap-2 mb-8 text-[#449E80]">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="w-6 h-6">
                            <path
                                d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
                        </svg>
                        <span class="text-xl font-bold">NearFix</span>
                    </div>

                    <header class="mb-10">
                        <h2 class="serif text-3xl md:text-4xl text-gray-900 mb-2">Welcome back</h2>
                        <p class="text-gray-500">Sign in to your account to continue</p>
                    </header>

                    <!-- Error Message -->
                    <% if (request.getAttribute("errorMessage") !=null) { %>
                        <div
                            class="mb-6 p-4 bg-red-50 border border-red-100 text-red-600 rounded-xl flex items-center gap-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="flex-shrink-0">
                                <circle cx="12" cy="12" r="10" />
                                <line x1="12" y1="8" x2="12" y2="12" />
                                <line x1="12" y1="16" x2="12.01" y2="16" />
                            </svg>
                            <span class="text-sm font-medium">
                                <%= request.getAttribute("errorMessage") %>
                            </span>
                        </div>
                        <% } %>

                            <!-- Success Message -->
                            <% if (request.getAttribute("successMessage") !=null) { %>
                                <div
                                    class="mb-6 p-4 bg-emerald-50 border border-emerald-100 text-emerald-600 rounded-xl flex items-center gap-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="flex-shrink-0">
                                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
                                        <polyline points="22 4 12 14.01 9 11.01" />
                                    </svg>
                                    <span class="text-sm font-medium">
                                        <%= request.getAttribute("successMessage") %>
                                    </span>
                                </div>
                                <% } %>

                                    <form method="post" action="<%= request.getContextPath() %>/login"
                                        class="space-y-6">
                                        <!-- Email -->
                                        <div class="space-y-2">
                                            <label for="email"
                                                class="block text-sm font-semibold text-gray-700">Email</label>
                                            <div class="relative flex items-center">
                                                <div
                                                    class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="text-gray-400">
                                                        <path
                                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                                                        <polyline points="22,6 12,13 2,6" />
                                                    </svg>
                                                </div>
                                                <input type="email" id="email" name="email"
                                                    value="<%= request.getAttribute("prefillEmail") != null ? request.getAttribute("prefillEmail") : "" %>"
                                                    placeholder="Enter your email address" required
                                                    class="block w-full pl-11 pr-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#449E80]/20 focus:border-[#449E80] outline-none transition-all text-gray-900 placeholder-gray-400">
                                            </div>
                                        </div>

                                        <!-- Password -->
                                        <div class="space-y-2">
                                            <div class="flex items-center justify-between">
                                                <label for="password"
                                                    class="block text-sm font-semibold text-gray-700">Password</label>
                                                <a href="#"
                                                    class="text-xs font-semibold text-[#449E80] hover:underline">Forgot
                                                    password?</a>
                                            </div>
                                            <div class="relative flex items-center">
                                                <div
                                                    class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="text-gray-400">
                                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                                        <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                                    </svg>
                                                </div>
                                                <input type="password" id="password" name="password"
                                                    placeholder="Enter your password" required
                                                    class="block w-full pl-11 pr-4 py-3 border border-gray-200 rounded-xl focus:ring-2 focus:ring-[#449E80]/20 focus:border-[#449E80] outline-none transition-all text-gray-900 placeholder-gray-400">
                                            </div>
                                        </div>

                                        <button type="submit"
                                            class="w-full bg-[#449E80] hover:bg-[#3d8b70] text-white font-bold py-4 px-6 rounded-xl transition-all flex items-center justify-center gap-2 group">
                                            <span>Sign In</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="transition-transform group-hover:translate-x-1">
                                                <line x1="5" y1="12" x2="19" y2="12" />
                                                <polyline points="12 5 19 12 12 19" />
                                            </svg>
                                        </button>
                                    </form>

                                    <footer class="mt-8 text-center text-sm text-gray-500">
                                        Don't have an account?
                                        <a href="<%= request.getContextPath() %>/register"
                                            class="text-[#449E80] font-bold hover:underline">Create one</a>
                                    </footer>
                </div>
            </div>
        </div>

    </body>

    </html>
