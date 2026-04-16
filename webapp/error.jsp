<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - NearFix</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
    </style>
</head>
<body class="bg-[#FDFBF7] min-h-screen flex items-center justify-center px-6">

<div class="bg-white rounded-3xl shadow-xl p-10 w-full max-w-lg text-center border border-gray-100">
    <div class="w-20 h-20 bg-red-50 text-red-500 rounded-full flex items-center justify-center mx-auto mb-6">
        <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
    </div>
    
    <h2 class="text-3xl font-bold text-gray-900 mb-4">Something went wrong</h2>
    <p class="text-gray-600 mb-8">We encountered an error while processing your request. Please see the details below or try again later.</p>

    <% 
        String message = (String) request.getAttribute("errorMessage");
        if (message == null) message = request.getParameter("message");
        if (message == null) message = "An unexpected error occurred.";
    %>
    
    <div class="bg-red-50 border border-red-100 text-red-700 px-6 py-4 rounded-2xl mb-10 text-sm font-medium">
        <%= message %>
    </div>

    <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4 justify-center">
        <a href="index.jsp" class="px-8 py-3 bg-[#2D6A4F] text-white rounded-xl hover:bg-[#1B4332] font-bold transition shadow-lg shadow-green-100">
            Back to Home
        </a>
        <button onclick="window.history.back()" class="px-8 py-3 border-2 border-gray-200 text-gray-600 rounded-xl hover:bg-gray-50 font-bold transition">
            Go Back
        </button>
    </div>
</div>

</body>
</html>