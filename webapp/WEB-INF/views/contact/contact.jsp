<%-- ============================================================
     Page: Contact Us (contact.jsp)
     Route: GET /contact
     Servlet: ContactServlet.java
     Description: The main Contact Us page. Assembles components.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- SEO --%>
    <title>Contact Us - NearFix</title>
    <meta name="description" content="Get in touch with the NearFix team. We're here to help with your repair needs or answer any questions about our platform.">

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
    </style>
</head>

<body class="bg-white font-sans antialiased text-gray-900">

    <%-- Navbar (Shared from landing) --%>
    <jsp:include page="../landing/navbar.jsp" />

    <main>
        <%-- Hero Section --%>
        <jsp:include page="hero.jsp" />

        <%-- Form and Sidebar Section --%>
        <section class="py-24 px-4 sm:px-6 lg:px-8 bg-white">
            <div class="max-w-7xl mx-auto">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-16">
                    
                    <%-- Left: Form Component --%>
                    <jsp:include page="form.jsp" />

                    <%-- Right: FAQ & Info Component --%>
                    <jsp:include page="faq.jsp" />

                </div>
            </div>
        </section>
    </main>

    <%-- Footer (Shared from landing) --%>
    <jsp:include page="../landing/footer.jsp" />

</body>
</html>
