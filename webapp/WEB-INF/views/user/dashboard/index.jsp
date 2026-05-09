<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard - NearFix</title>
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
            },
          },
        },
      };
    </script>
    <style>
      .font-inter {
        font-family: "Inter", sans-serif;
      }
      .sidebar-open {
        transform: translateX(0) !important;
      }
      ::-webkit-scrollbar {
        width: 6px;
      }
      ::-webkit-scrollbar-track {
        background: transparent;
      }
      ::-webkit-scrollbar-thumb {
        background: #d0e4da;
        border-radius: 10px;
      }
      ::-webkit-scrollbar-thumb:hover {
        background: #a0b4a8;
      }
    </style>
  </head>
  <body class="bg-background flex min-h-screen text-dark">
    <jsp:include page="../layout/sidebar.jsp" />

    <div
      class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden"
    >
      <jsp:include page="../layout/navbar.jsp" />

      <main class="pt-[22px] px-4 md:px-9 pb-9">
        <jsp:include page="impact-card.jsp" />
        <jsp:include page="stats.jsp" />

        <!-- Main Content Grid -->
        <div class="grid grid-cols-1 lg:grid-cols-[1fr_400px] gap-8">
          <div>
            <jsp:include page="recent-requests.jsp" />
          </div>
          <div>
            <jsp:include page="rate-repairer.jsp" />
          </div>
        </div>
      </main>
    </div>

    <script>
      const menuBtn = document.getElementById("mobile-menu-btn");
      const sidebar = document.querySelector("aside");
      if (menuBtn && sidebar) {
        menuBtn.addEventListener("click", () => {
          sidebar.classList.toggle("sidebar-open");
        });
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
