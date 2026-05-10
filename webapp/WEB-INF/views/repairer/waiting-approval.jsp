<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Awaiting Approval - NearFix</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .font-display { font-family: 'Plus Jakarta Sans', sans-serif; }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen p-6">
    <div class="max-w-md w-full bg-white rounded-[2.5rem] p-12 shadow-2xl shadow-blue-500/10 border border-blue-50 text-center">
        <div class="w-24 h-24 bg-blue-50 rounded-full flex items-center justify-center mx-auto mb-8 animate-pulse">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-12 h-12 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </div>
        
        <h1 class="text-3xl font-display font-black text-gray-900 mb-4">Application Pending</h1>
        
        <p class="text-gray-500 leading-relaxed mb-8">
            Hello <span class="font-bold text-gray-900">${repairer.name}</span>, your expert profile is currently being reviewed by our admin team. This usually takes less than 24 hours.
        </p>
        
        <div class="bg-blue-50/50 rounded-2xl p-6 mb-8 text-left">
            <div class="flex items-center gap-3 mb-3">
                <div class="w-2 h-2 rounded-full bg-blue-600"></div>
                <span class="text-xs font-black uppercase tracking-widest text-blue-700">Status: ${repairer.approvalStatus}</span>
            </div>
            <p class="text-sm text-blue-900/70">Once approved, you'll gain access to the dashboard where you can start accepting local repair jobs.</p>
        </div>
        
        <div class="flex flex-col gap-3">
            <a href="${pageContext.request.contextPath}/repairer/profile" class="w-full py-4 bg-gray-900 text-white font-bold rounded-2xl hover:bg-black transition-all">
                View My Profile
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="text-sm font-bold text-gray-400 hover:text-gray-600">
                Sign out
            </a>
        </div>
    </div>
</body>
</html>
