<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .serif { font-family: 'Playfair Display', serif; }
    </style>
</head>
<body class="bg-[#F9FAFB] min-h-screen p-8">

    <div class="max-w-6xl mx-auto">
        <header class="mb-12 flex justify-between items-end">
            <div>
                <h1 class="serif text-5xl text-gray-900 mb-3">Admin Dashboard</h1>
                <p class="text-gray-500 text-lg font-medium">Welcome back. Here's what's happening with NearFix.</p>
            </div>
            <a href="<%= request.getContextPath() %>/logout" class="bg-white border border-gray-100 text-red-500 px-6 py-3 rounded-xl font-bold hover:bg-red-50 transition-all flex items-center gap-2 shadow-sm">
                <i class="ph ph-sign-out text-xl"></i> Sign Out
            </a>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- User Management Card -->
            <a href="<%= request.getContextPath() %>/admin/users" class="group bg-white border border-gray-100 rounded-[2.5rem] p-8 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all">
                <div class="w-16 h-16 bg-blue-50 rounded-2xl flex items-center justify-center text-blue-500 mb-6 group-hover:scale-110 transition-transform">
                    <i class="ph ph-users-three text-3xl"></i>
                </div>
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Users</h2>
                <p class="text-gray-500 mb-6">Manage platform users, approve repairers, and handle account statuses.</p>
                <div class="flex items-center text-blue-500 font-bold gap-2">
                    Manage Users <i class="ph ph-arrow-right"></i>
                </div>
            </a>

            <!-- Requests Card -->
            <a href="<%= request.getContextPath() %>/admin/requests" class="group bg-white border border-gray-100 rounded-[2.5rem] p-8 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all">
                <div class="w-16 h-16 bg-emerald-50 rounded-2xl flex items-center justify-center text-emerald-500 mb-6 group-hover:scale-110 transition-transform">
                    <i class="ph ph-wrench text-3xl"></i>
                </div>
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Repair Requests</h2>
                <p class="text-gray-500 mb-6">Monitor all ongoing and completed repair tasks across the platform.</p>
                <div class="flex items-center text-emerald-500 font-bold gap-2">
                    View Requests <i class="ph ph-arrow-right"></i>
                </div>
            </a>

            <!-- Categories Card -->
            <a href="<%= request.getContextPath() %>/admin/categories" class="group bg-white border border-gray-100 rounded-[2.5rem] p-8 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all">
                <div class="w-16 h-16 bg-purple-50 rounded-2xl flex items-center justify-center text-purple-500 mb-6 group-hover:scale-110 transition-transform">
                    <i class="ph ph-list-bullets text-3xl"></i>
                </div>
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Categories</h2>
                <p class="text-gray-500 mb-6">Update and organize the service categories available for repair requests.</p>
                <div class="flex items-center text-purple-500 font-bold gap-2">
                    Manage Categories <i class="ph ph-arrow-right"></i>
                </div>
            </a>
        </div>

        <div class="mt-12 bg-[#449E80] rounded-[3rem] p-12 text-white flex flex-col md:flex-row items-center justify-between gap-8 shadow-2xl shadow-[#449E80]/20">
            <div class="max-w-xl">
                <h2 class="serif text-4xl mb-4">System Overview</h2>
                <p class="text-emerald-50/80 text-lg">Use this portal to maintain the integrity of the NearFix platform and ensure high-quality service for all users.</p>
            </div>
            <div class="flex gap-8">
                <div class="text-center">
                    <div class="text-4xl font-bold mb-1">NearFix</div>
                    <div class="text-emerald-100/60 text-sm font-bold uppercase tracking-widest">Platform</div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
