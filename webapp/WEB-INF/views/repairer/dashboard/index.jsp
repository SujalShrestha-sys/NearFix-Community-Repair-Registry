<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NearFix Dashboard</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#0B7A53",
              "primary-light": "#EAF5EF",
              "primary-hover": "#F0F7F3",
              background: "#F3F8F5",
              dark: "#0D1F1A",
              border: "#E3ECE7",
              "border-light": "#D0E4DA",
              "border-extra-light": "#D8EAE1",
              muted: "#A0B4A8",
              "muted-dark": "#7D9087",
              "muted-light": "#EAF2EE",
              nav: "#3D5A50",
              yellow: "#F4B63D",
              "yellow-light": "#FFF5DC",
              pink: "#F87096",
              "pink-light": "#FFF0F3",
            },
            fontFamily: {
              inter: ["Inter", "sans-serif"],
            },
            boxShadow: {
              stat: "0 1px 4px rgba(11, 122, 83, 0.04)",
            },
          },
        },
      };
    </script>
    <style>
      .sidebar-open {
        transform: translateX(0) !important;
      }
    </style>
  </head>

  <body class="font-inter bg-background flex min-h-screen text-dark">
    <jsp:include page="../layout/sidebar.jsp" />

    <!-- MAIN -->
    <div
      class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full"
    >
      <jsp:include page="../layout/navbar.jsp" />

      <!-- CONTENT -->
      <div class="pt-[22px] px-4 md:px-9 pb-9">
        <jsp:include page="stats.jsp" />

        <!-- MAIN GRID -->
        <div class="grid grid-cols-1 lg:grid-cols-[1fr_420px] gap-5">
          <jsp:include page="active-jobs.jsp" />

          <jsp:include page="ratings.jsp" />
        </div>
      </div>
    </div>

    <script>
      const menuBtn = document.getElementById("mobile-menu-btn");
      const sidebar = document.querySelector("aside");

      if (menuBtn && sidebar) {
        menuBtn.addEventListener("click", () => {
          sidebar.classList.toggle("sidebar-open");
        });

        // Close sidebar when clicking outside on mobile
        document.addEventListener("click", (e) => {
          if (
            window.innerWidth < 1024 &&
            !sidebar.contains(e.target) &&
            !menuBtn.contains(e.target)
          ) {
            sidebar.classList.remove("sidebar-open");
          }
        });
      }
    </script>
  </body>
</html>
