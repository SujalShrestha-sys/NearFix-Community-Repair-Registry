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
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Outfit', sans-serif; }
        .plus-pattern {
            background-image: radial-gradient(circle, #ffffff20 1px, transparent 1px);
            background-size: 30px 30px;
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">
    <div class="flex flex-col lg:flex-row min-h-screen">
        
        <!-- Left Side: Brand & Impact -->
        <div class="lg:w-1/2 bg-[#059669] text-white p-8 lg:p-16 flex flex-col justify-between relative overflow-hidden">
            <!-- Plus Pattern Background -->
            <div class="absolute inset-0 plus-pattern pointer-events-none opacity-50"></div>
            
            <div class="relative z-10">
                <!-- Logo -->
                <div class="flex items-center gap-2 mb-16">
                    <div class="bg-white/20 p-2 rounded-lg backdrop-blur-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-white"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
                    </div>
                    <span class="text-2xl font-bold tracking-tight">NearFix</span>
                </div>

                <!-- Headline -->
                <h1 class="text-5xl lg:text-7xl font-bold leading-tight mb-8">
                    Fix things.<br>
                    Build trust.<br>
                    Help communities.
                </h1>
                
                <p class="text-emerald-50 max-w-md text-lg mb-12 opacity-90">
                    NearFix connects broken items with skilled local repairers — creating accountability, reducing waste, and supporting local craftspeople.
                </p>

                <!-- Features -->
                <div class="space-y-6 max-w-lg">
                    <div class="flex items-center gap-4">
                        <div class="bg-white/10 p-2 rounded-lg"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m12 3-1.912 5.813a2 2 0 0 1-1.275 1.275L3 12l5.813 1.912a2 2 0 0 1 1.275 1.275L12 21l1.912-5.813a2 2 0 0 1 1.275-1.275L21 12l-5.813-1.912a2 2 0 0 1-1.275-1.275L12 3Z"></path></svg></div>
                        <span class="text-lg">Post a repair request in under 60 seconds</span>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="bg-white/10 p-2 rounded-lg"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path><circle cx="12" cy="10" r="3"></circle></svg></div>
                        <span class="text-lg">Match with verified repairers in your area</span>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="bg-white/10 p-2 rounded-lg"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg></div>
                        <span class="text-lg">Admin-verified repairers with real ratings</span>
                    </div>
                    <div class="flex items-center gap-4">
                        <div class="bg-white/10 p-2 rounded-lg"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v10"></path><path d="m16 8-4 4-4-4"></path><path d="M3 21h18"></path></svg></div>
                        <span class="text-lg">Every repair reduces landfill waste</span>
                    </div>
                </div>
            </div>

            <!-- Impact Card -->
            <div class="relative z-10 mt-12">
                <p class="text-sm uppercase tracking-wider mb-3 opacity-70">Platform impact so far</p>
                <div class="bg-emerald-500/20 backdrop-blur-md rounded-2xl p-6 inline-block border border-white/10">
                    <h3 class="text-4xl font-bold mb-1">8,240</h3>
                    <p class="text-emerald-100 flex items-center gap-2">items saved from landfill 🌿</p>
                </div>
            </div>
        </div>

        <!-- Right Side: Login Form -->
        <div class="lg:w-1/2 bg-white flex flex-col p-8 lg:p-16">
            <!-- Back Button -->
            <div class="flex justify-end mb-8">
                <a href="${pageContext.request.contextPath}/home" class="flex items-center gap-2 px-4 py-2 border border-gray-200 rounded-lg text-sm text-gray-600 hover:bg-gray-50 transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"></path></svg>
                    Back to home
                </a>
            </div>

            <div class="max-w-md w-full mx-auto my-auto">
                <!-- Tabs -->
                <div class="bg-gray-100 p-1 rounded-xl flex mb-12">
                    <button class="flex-1 py-2 text-sm font-semibold rounded-lg bg-white shadow-sm">Sign in</button>
                    <a href="${pageContext.request.contextPath}/register" class="flex-1 py-2 text-sm font-semibold text-gray-500 text-center">Create account</a>
                </div>

                <h2 class="text-3xl font-bold text-gray-900 mb-2">Welcome back</h2>
                <p class="text-gray-500 mb-8">Sign in to your NearFix account to continue</p>

                <!-- Messages -->
                <c:if test="${not empty errorMessage}">
                    <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 text-sm">
                        ${errorMessage}
                    </div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="mb-6 p-4 bg-emerald-50 border-l-4 border-emerald-500 text-emerald-700 text-sm">
                        ${successMessage}
                    </div>
                </c:if>

                <!-- Form -->
                <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-6">
                    <div>
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-2">Email address</label>
                        <input type="email" id="email" name="email" value="${prefillEmail}" placeholder="you@email.com" 
                            class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-[#059669] focus:border-transparent transition-all" required>
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
                        <div class="relative">
                            <input type="password" id="password" name="password" placeholder="••••••••" 
                                class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-[#059669] focus:border-transparent transition-all" required>
                            <button type="button" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            </button>
                        </div>
                    </div>

                    <div class="flex items-center justify-between">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" class="w-4 h-4 rounded text-[#059669] focus:ring-[#059669] border-gray-300">
                            <span class="text-sm text-gray-600">Remember me</span>
                        </label>
                        <a href="#" class="text-sm font-semibold text-[#059669] hover:underline">Forgot password?</a>
                    </div>

                    <button type="submit" class="w-full bg-[#059669] hover:bg-[#047857] text-white font-bold py-3 rounded-xl shadow-lg shadow-emerald-200 transition-all flex items-center justify-center gap-2">
                        Sign in to NearFix
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"></path><path d="m12 5 7 7-7 7"></path></svg>
                    </button>
                </form>

                <!-- Divider -->
                <div class="relative my-8">
                    <div class="absolute inset-0 flex items-center"><div class="w-full border-t border-gray-100"></div></div>
                    <div class="relative flex justify-center text-xs uppercase"><span class="bg-white px-4 text-gray-400 tracking-widest">or sign in as</span></div>
                </div>

                <!-- Role Buttons -->
                <div class="grid grid-cols-3 gap-4">
                    <button class="flex items-center justify-center gap-2 py-2.5 border border-gray-200 rounded-xl text-sm font-semibold text-gray-600 hover:bg-gray-50 transition-colors">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-purple-500"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                        User
                    </button>
                    <button class="flex items-center justify-center gap-2 py-2.5 border border-gray-200 rounded-xl text-sm font-semibold text-gray-600 hover:bg-gray-50 transition-colors">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-emerald-500"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
                        Repairer
                    </button>
                    <button class="flex items-center justify-center gap-2 py-2.5 border border-gray-200 rounded-xl text-sm font-semibold text-gray-600 hover:bg-gray-50 transition-colors">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-blue-500"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                        Admin
                    </button>
                </div>

                <p class="text-center mt-8 text-sm text-gray-500">
                    Don't have an account? 
                    <a href="${pageContext.request.contextPath}/register" class="font-bold text-[#059669] hover:underline">Register here</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
