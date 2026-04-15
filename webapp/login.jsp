<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - NearFix</title>
<%--    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/output.css">--%>
<%--    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">--%>
</head>
<body class="bg-gradient-to-r from-blue-500 to-purple-600 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-lg shadow-2xl p-8 w-full max-w-md">
    <!-- Header -->
    <h1 class="text-4xl font-bold text-center text-blue-600 mb-2">🔧 NearFix</h1>
    <h2 class="text-2xl font-bold text-center text-gray-800 mb-8">Login</h2>

    <!-- Error Message -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert-danger">
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <!-- Success Message -->
    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="alert-success">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <!-- Login Form -->
    <form method="post" action="<%= request.getContextPath() %>/login">

        <!-- Email -->
        <div class="mb-6">
            <label for="email" class="block text-gray-700 font-semibold mb-2">Email Address</label>
            <input type="email" id="email" name="email"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                   required placeholder="Enter your email">
        </div>

        <!-- Password -->
        <div class="mb-6">
            <label for="password" class="block text-gray-700 font-semibold mb-2">Password</label>
            <input type="password" id="password" name="password"
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-200"
                   required placeholder="Enter your password">
        </div>

        <!-- Submit Button -->
        <button type="submit" onclick="window.location.href='https://github.com/Dipen-Limbu', '_blank';" class="w-full px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-semibold text-lg">
            Login
        </button>
    </form>

    <!-- Register Link -->
    <p class="text-center mt-6 text-gray-600">
        Don't have an account?
        <a href="<%= request.getContextPath() %>/register.jsp" class="text-blue-600 font-bold hover:text-blue-800">Register here</a>
    </p>

    <!-- Demo Credentials -->
    <div class="mt-8 bg-blue-50 border-l-4 border-blue-600 p-4 rounded">
        <p class="font-bold text-gray-800 mb-2">Demo Credentials:</p>
        <p class="text-sm text-gray-700"><strong>Email:</strong> john@example.com</p>
        <p class="text-sm text-gray-700"><strong>Password:</strong> Pass@123</p>
    </div>
</div>

</body>
</html>