<%-- ============================================================
     Page: About Us (about.jsp)
     Route: GET /about
     Servlet: PublicPagesServlet.java
     Description: The main About Us page. Assembles components.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- SEO --%>
    <title>About Us - NearFix</title>
    <meta name="description" content="Learn about the mission, values, and the team behind NearFix &mdash; the platform empowering local repairers and sustainable living.">

    <%-- Tailwind CSS CDN --%>
    <script src="https://cdn.tailwindcss.com"></script>

    <%-- Google Fonts: Inter --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <%-- Tailwind Config --%>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: { sans: ['Inter', 'sans-serif'] }
                }
            }
        }
    </script>

    <%-- Global Styles --%>
    <style>
        html { scroll-behavior: smooth; }
        .nf-btn-dark {
            background: #111827;
            transition: all 0.2s ease;
        }
        .nf-btn-dark:hover {
            background: #1f2937;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }
        .nf-nav-link { position: relative; transition: color 0.2s ease; }
        .nf-nav-link::after {
            content: ''; position: absolute; left: 0; bottom: -2px;
            width: 0; height: 1.5px; background: #16a34a; transition: width 0.25s ease;
        }
        .nf-nav-link:hover::after { width: 100%; }

        /* Award Winning Design Animations */
        @keyframes float {
            0% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(2deg); }
            100% { transform: translateY(0px) rotate(0deg); }
        }
        .animate-float {
            animation: float 6s ease-in-out infinite;
        }
    </style>
</head>

<body class="bg-white font-sans antialiased text-gray-900">

    <%-- Navbar (Shared from landing) --%>
    <jsp:include page="../landing/navbar.jsp" />

    <main>
        <%-- Hero Section --%>
        <jsp:include page="hero.jsp" />

        <%-- Mission Section --%>
        <jsp:include page="mission.jsp" />

        <%-- Team Section --%>
        <jsp:include page="team.jsp" />

        <%-- Tech Stack Section --%>
        <jsp:include page="tech-stack.jsp" />
    </main>

    <%-- Footer (Shared from landing) --%>
    <jsp:include page="../landing/footer.jsp" />

</body>
</html>
