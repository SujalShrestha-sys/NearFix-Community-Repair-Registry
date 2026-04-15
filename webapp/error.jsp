<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - NearFix</title>
<%--    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/output.css">--%>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center">

<div class="bg-white rounded-lg shadow-2xl p-8 w-full max-w-md text-center">
    <h1 class="text-6xl font-bold text-red-600 mb-4">⚠️</h1>
    <h2 class="text-2xl font-bold text-gray-800 mb-4">Access Denied</h2>
    <p class="text-gray-600 mb-6">You don't have permission to access this page.</p>

    <% String message = request.getParameter("message"); %>
    <% if (message != null) { %>
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-6">
        <%= message %>
    </div>
    <% } %>

<%--    <a href="<%= request.getContextPath() %>/index.jsp" class="inline-block px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-semibold">--%>
        Back to Home
<%--    </a>--%>
</div>

</body>
</html>