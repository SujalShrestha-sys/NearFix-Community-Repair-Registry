<%-- ============================================================
     Page: Landing Page (index.jsp)
     Route: GET /home  or  GET /
     Servlet: HomeServlet.java
     Description: Main entry point. Assembles all landing page
                  components using JSP includes. Data passed from
                  the servlet via request attributes:
                    - ${itemsSaved}   - total completed repairs
                    - ${totalFixers}  - total repairer count
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- SEO: Title and description --%>
    <title>NearFix - Fix It. Don't Toss It.</title>
    <meta name="description"
          content="Connect with skilled local repairers near you. Post a repair request,
                   track progress in real-time, and save items from landfill with NearFix.">

    <%-- Tailwind CSS CDN (play.tailwindcss.com / CDN for development) --%>
    <script src="https://cdn.tailwindcss.com"></script>

    <%-- Google Fonts: Inter --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <%-- Apply Inter font globally via Tailwind config --%>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif']
                    }
                }
            }
        }
    </script>

    <%-- Global styles: smooth scroll + reusable hover effect classes --%>
    <style>
        html { scroll-behavior: smooth; }

        /* --- Primary dark button (Hero CTA) --- */
        .nf-btn-dark {
            background: #111827;
            transition: background 0.25s ease, transform 0.15s ease, box-shadow 0.2s ease;
        }
        .nf-btn-dark:hover {
            background: linear-gradient(135deg, #374151 0%, #111827 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
        }

        /* --- Green button (Get started / navbar CTA) --- */
        .nf-btn-green {
            background: #16a34a;
            transition: background 0.25s ease, transform 0.15s ease, box-shadow 0.2s ease;
        }
        .nf-btn-green:hover {
            background: linear-gradient(135deg, #15803d 0%, #16a34a 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(22, 163, 74, 0.35);
        }

        /* --- Floating card (Hero preview card) --- */
        .nf-card-float {
            transition: transform 0.28s ease, box-shadow 0.28s ease;
        }
        .nf-card-float:hover {
            transform: translateY(-5px) rotate(0.4deg);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.18);
        }

        /* --- Stat number scale on parent hover --- */
        .nf-stat-item { cursor: default; }
        .nf-stat-num {
            display: inline-block;
            transition: transform 0.2s ease, color 0.2s ease;
        }
        .nf-stat-item:hover .nf-stat-num {
            transform: scale(1.1);
        }

        /* --- How-it-works step icon gradient hover --- */
        .nf-step-icon {
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }
        .nf-step-icon:hover { transform: scale(1.1); }
        .nf-step-green:hover {
            background: linear-gradient(135deg, #d1fae5, #6ee7b7);
            box-shadow: 0 4px 14px rgba(52, 211, 153, 0.35);
        }
        .nf-step-blue:hover {
            background: linear-gradient(135deg, #dbeafe, #93c5fd);
            box-shadow: 0 4px 14px rgba(96, 165, 250, 0.35);
        }
        .nf-step-yellow:hover {
            background: linear-gradient(135deg, #fef9c3, #fde68a);
            box-shadow: 0 4px 14px rgba(251, 191, 36, 0.35);
        }

        /* --- Portal cards lift + colored glow --- */
        .nf-portal-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
        }
        .nf-portal-card:hover { transform: translateY(-4px); }
        .nf-portal-green:hover  { box-shadow: 0 10px 40px rgba(22, 163, 74, 0.22); }
        .nf-portal-blue:hover   { box-shadow: 0 10px 40px rgba(59, 130, 246, 0.22); }
        .nf-portal-purple:hover { box-shadow: 0 10px 40px rgba(168, 85, 247, 0.22); }

        /* --- Navbar link underline slide-in --- */
        .nf-nav-link {
            position: relative;
            transition: color 0.2s ease;
        }
        .nf-nav-link::after {
            content: '';
            position: absolute;
            left: 0; bottom: -2px;
            width: 0; height: 1.5px;
            background: #16a34a;
            transition: width 0.25s ease;
        }
        .nf-nav-link:hover::after { width: 100%; }
    </style>
</head>

<body class="bg-white font-sans antialiased">

    <%-- ================================================
         COMPONENT 1: Navigation Bar
         File: navbar.jsp
         ================================================ --%>
    <jsp:include page="navbar.jsp" />

    <%-- ================================================
         COMPONENT 2: Hero Section
         File: hero.jsp
         Uses: ${itemsSaved}
         ================================================ --%>
    <main>
        <jsp:include page="hero.jsp" />

        <%-- ================================================
             COMPONENT 3: Stats / Impact Banner
             File: stats.jsp
             Uses: ${itemsSaved}, ${totalFixers}
             ================================================ --%>
        <jsp:include page="stats.jsp" />

        <%-- ================================================
             COMPONENT 4: How It Works (3 steps)
             File: how-it-works.jsp
             ================================================ --%>
        <jsp:include page="how-it-works.jsp" />

        <%-- ================================================
             COMPONENT 5: Three Portals Section
             File: portals.jsp
             ================================================ --%>
        <jsp:include page="portals.jsp" />
    </main>

    <%-- ================================================
         COMPONENT 6: Footer
         File: footer.jsp
         Uses: ${itemsSaved}
         ================================================ --%>
    <jsp:include page="footer.jsp" />

</body>
</html>
