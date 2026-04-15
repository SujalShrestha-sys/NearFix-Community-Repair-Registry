<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - NearFix</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/output.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/responsive.css">
</head>
<body class="bg-gradient-to-r from-blue-500 to-purple-600 min-h-screen flex items-center justify-center py-8">

<div class="bg-white rounded-lg shadow-2xl p-8 w-full max-w-md">
    <h1 class="text-4xl font-bold text-center text-blue-600 mb-2">🔧 NearFix</h1>
    <h2 class="text-2xl font-bold text-center text-gray-800 mb-8">Create Account</h2>

    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mb-4">
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <% if (request.getAttribute("successMessage") != null) { %>
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-4">
        <%= request.getAttribute("successMessage") %>
    </div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/register" onsubmit="return validateForm()">

        <div class="mb-4">
            <label class="block text-gray-700 font-semibold mb-2">Full Name</label>
            <label>
                <input type="text" name="name" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
            </label>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-semibold mb-2">Email Address</label>
            <label>
                <input type="email" name="email" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
            </label>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-semibold mb-2">Phone Number</label>
            <label>
                <input type="tel" name="phone" pattern="[0-9]{10}" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
            </label>
            <small class="text-gray-500">10 digits</small>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-semibold mb-2">Password</label>
            <label>
                <input type="password" name="password" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
            </label>
            <small class="text-gray-500">Min 8 chars, 1 uppercase, 1 digit, 1 special char</small>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-semibold mb-2">Confirm Password</label>
            <label>
                <input type="password" name="confirmPassword" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
            </label>
        </div>

        <div class="mb-6">
            <label class="block text-gray-700 font-semibold mb-2">Register As</label>
            <label>
                <select name="role" class="w-full px-4 py-2 border border-gray-300 rounded-lg" required>
                    <option value="">-- Select Role --</option>
                    <option value="USER">Regular User</option>
                    <option value="REPAIRER">Repairer</option>
                </select>
            </label>
        </div>

        <button type="submit" class="w-full px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-semibold text-lg">
            Register
        </button>
    </form>
</div>

<script>
    function validateForm() {
        const name = document.querySelector('input[name="name"]').value;
        const password = document.querySelector('input[name="password"]').value;
        const phone = document.querySelector('input[name="phone"]').value;

        if (!/^[a-zA-Z\s]+$/.test(name)) {
            alert("Name must contain only letters and spaces");
            return false;
        }

        if (!/^\d{10}$/.test(phone)) {
            alert("Phone must be 10 digits");
            return false;
        }

        if (!/^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$/.test(password)) {
            alert("Password must have 8+ chars, 1 uppercase, 1 digit, 1 special char");
            return false;
        }

        return true;
    }
</script>

</body>
</html>