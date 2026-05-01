<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">
    <div class="max-w-4xl mx-auto bg-white rounded-2xl p-8 shadow-sm">
        <h1 class="text-3xl font-bold mb-6">Admin Portal</h1>
        <p class="text-gray-600 mb-8">Welcome to the NearFix Administrative Dashboard.</p>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="p-6 bg-blue-50 rounded-xl border border-blue-100">
                <h2 class="font-bold text-blue-800 mb-2">User Management</h2>
                <p class="text-sm text-blue-600">Approve repairers and manage users.</p>
            </div>
            <div class="p-6 bg-green-50 rounded-xl border border-green-100">
                <h2 class="font-bold text-green-800 mb-2">System Stats</h2>
                <p class="text-sm text-green-600">View platform activity and metrics.</p>
            </div>
        </div>
        
        <div class="mt-12">
            <a href="<%= request.getContextPath() %>/logout" class="text-gray-500 hover:text-red-600 font-medium">Sign Out</a>
        </div>
    </div>
</body>
</html>
