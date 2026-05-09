<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - NearFix</title>
            <!-- Tailwind CSS CDN -->
            <script src="https://cdn.tailwindcss.com"></script>
            <!-- Google Fonts: Outfit -->
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <style>
                body {
                    font-family: 'Outfit', sans-serif;
                }

                .plus-pattern {
                    background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M29 29V25H31V29H35V31H31V35H29V31H25V29H29Z' fill='%23ffffff' fill-opacity='0.1'/%3E%3C/svg%3E");
                    background-size: 60px 60px;
                }

                @media (min-width: 1024px) {
                    .no-scroll {
                        overflow: hidden;
                        height: 100vh;
                    }
                }
            </style>
        </head>

        <body class="bg-white no-scroll">
            <div class="flex flex-col lg:flex-row h-full">

                <!-- Left Side: Brand & Impact -->
                <div class="lg:w-1/2 bg-[#059669] text-white p-6 lg:p-12 flex flex-col justify-between relative overflow-hidden h-full">
                    <!-- Plus Pattern Background -->
                    <div class="absolute inset-0 plus-pattern pointer-events-none"></div>

                    <div class="relative z-10 flex flex-col h-full justify-center">
                        <div class="space-y-6">
                            <!-- Logo -->
                            <div class="flex items-center gap-3 mb-10">
                                <div class="bg-white/10 p-2 rounded-xl backdrop-blur-sm border border-white/10">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" class="text-white"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
                                </div>
                                <span class="text-2xl font-bold tracking-tight">NearFix</span>
                            </div>

                            <!-- Headline -->
                            <h1 class="text-4xl lg:text-5xl font-extrabold leading-tight tracking-tight">
                                Fix things. Build trust.<br>
                                Help communities.
                            </h1>

                            <p class="text-emerald-50 max-w-md text-lg opacity-80 leading-relaxed">
                                NearFix connects broken items with local repairers — reducing waste and supporting local craftspeople.
                            </p>

                            <!-- Features -->
                            <div class="space-y-5 max-w-lg">
                                <div class="flex items-center gap-4">
                                    <div class="bg-[#F97316] p-2.5 rounded-xl shadow-lg flex-shrink-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="m13 2-2 10h8l-2 10"></path></svg>
                                    </div>
                                    <span class="text-lg font-medium">Post a request in 60s</span>
                                </div>
                                <div class="flex items-center gap-4">
                                    <div class="bg-[#EC4899] p-2.5 rounded-xl shadow-lg flex-shrink-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                    </div>
                                    <span class="text-lg font-medium">Match with local experts</span>
                                </div>
                                <div class="flex items-center gap-4">
                                    <div class="bg-[#F59E0B] p-2.5 rounded-xl shadow-lg flex-shrink-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    </div>
                                    <span class="text-lg font-medium">Verified ratings & trust</span>
                                </div>
                                <div class="flex items-center gap-4">
                                    <div class="bg-[#10B981] p-2.5 rounded-xl shadow-lg flex-shrink-0">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22a7 7 0 0 0 7-7c0-2-1-3.9-3-5.5s-3.5-4-4-6.5c-.5 2.5-2 4.9-4 6.5C6 11.1 5 13 5 15a7 7 0 0 0 7 7z"></path><path d="M12 17.5c1.4-1.4 3-2.1 3-3.5"></path></svg>
                                    </div>
                                    <span class="text-lg font-medium">Reduce landfill waste</span>
                                </div>
                            </div>
                        </div>

                        <!-- Impact Card -->
                        <div class="mt-10">
                            <div class="bg-white/10 backdrop-blur-xl rounded-2xl p-6 inline-block border border-white/20 shadow-xl">
                                <h3 class="text-3xl font-bold mb-1">8,240</h3>
                                <p class="text-emerald-50 text-base opacity-80">items saved from landfill 🌿</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Login Form -->
                <div class="lg:w-1/2 bg-white flex flex-col p-6 lg:p-12 relative h-full overflow-y-auto">
                    <!-- Back Button -->
                    <div class="absolute top-6 left-6 lg:top-10 lg:left-10">
                        <a href="${pageContext.request.contextPath}/home" class="flex items-center gap-2 px-4 py-2 border border-gray-300 rounded-xl text-sm font-bold text-gray-700 hover:bg-gray-50 transition-all shadow-sm">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"></path></svg>
                            Back home
                        </a>
                    </div>

                    <div class="max-w-md w-full mx-auto my-auto pt-16 lg:pt-0">
                        <!-- Tabs -->
                        <div class="bg-gray-100/50 p-1 rounded-xl flex mb-8 border border-gray-200">
                            <button class="flex-1 py-2.5 text-sm font-bold rounded-lg bg-white shadow-md text-[#059669]">Sign in</button>
                            <a href="${pageContext.request.contextPath}/register" class="flex-1 py-2.5 text-sm font-bold text-gray-400 text-center hover:text-gray-600 transition-colors">Create account</a>
                        </div>

                        <h2 class="text-3xl font-extrabold text-gray-900 mb-2 tracking-tight">Welcome back</h2>
                        <p class="text-gray-500 text-base mb-8">Sign in to your NearFix account to continue</p>

                        <!-- Messages -->
                        <c:if test="${not empty errorMessage}">
                            <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 rounded-r-xl text-red-700 text-sm">
                                ${errorMessage}
                            </div>
                        </c:if>
                        <c:if test="${not empty successMessage}">
                            <div class="mb-6 p-4 bg-emerald-50 border-l-4 border-emerald-500 rounded-r-xl text-emerald-700 text-sm">
                                ${successMessage}
                            </div>
                        </c:if>

                        <!-- Form -->
                        <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-6">
                            <div>
                                <label for="email" class="block text-sm font-bold text-gray-700 mb-2">Email address</label>
                                <input type="email" id="email" name="email" value="${prefillEmail}" placeholder="you@email.com" 
                                    class="w-full px-4 py-3 rounded-xl border-2 border-gray-100 bg-gray-50/30 focus:bg-white focus:outline-none focus:ring-4 focus:ring-emerald-500/5 focus:border-[#059669] transition-all" required>
                            </div>

                            <div>
                                <label for="password" class="block text-sm font-bold text-gray-700 mb-2">Password</label>
                                <div class="relative">
                                    <input type="password" id="password" name="password" placeholder="••••••••" 
                                        class="w-full px-4 py-3 rounded-xl border-2 border-gray-100 bg-gray-50/30 focus:bg-white focus:outline-none focus:ring-4 focus:ring-emerald-500/5 focus:border-[#059669] transition-all" required>
                                    <button type="button" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-[#059669] transition-colors">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                    </button>
                                </div>
                            </div>

                            <div class="flex items-center justify-between">
                                <label class="flex items-center gap-2 cursor-pointer group">
                                    <input type="checkbox" class="w-4 h-4 rounded text-[#059669] focus:ring-[#059669] border-gray-300 cursor-pointer">
                                    <span class="text-sm font-bold text-gray-500 group-hover:text-gray-700">Remember me</span>
                                </label>
                                <a href="#" class="text-sm font-bold text-[#059669] hover:underline underline-offset-4">Forgot password?</a>
                            </div>

                            <button type="submit" class="w-full bg-[#059669] hover:bg-[#047857] text-white font-extrabold py-3.5 rounded-xl shadow-lg shadow-emerald-100 transition-all flex items-center justify-center gap-2 text-base">
                                Sign in to NearFix
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"></path><path d="m12 5 7 7-7 7"></path></svg>
                            </button>
                        </form>

                        <p class="text-center mt-8 text-sm text-gray-500">
                            Don't have an account?
                            <a href="${pageContext.request.contextPath}/register" class="font-extrabold text-[#059669] hover:underline underline-offset-4">Register here</a>
                        </p>
                    </div>
                </div>
            </div>
        </body>
    </html>