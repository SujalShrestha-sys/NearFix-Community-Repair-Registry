<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NearFix - Community Repair Registry</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts: Inter -->
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <style>
      body {
        font-family: "Inter", sans-serif;
        scroll-behavior: smooth;
      }
      .bg-soft {
        background-color: #fdfbf7;
      }
      .text-primary {
        color: #2d6a4f;
      }
      .bg-primary {
        background-color: #2d6a4f;
      }
      .hover-bg-primary:hover {
        background-color: #1b4332;
      }
      .glass-card {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
      }
    </style>
  </head>
  <body class="bg-soft text-gray-800">
    <!-- Navigation -->
    <nav
      class="fixed top-0 w-full z-50 glass-card px-6 py-4 flex items-center justify-between shadow-sm"
    >
      <div class="flex items-center space-x-2">
        <div
          class="w-8 h-8 bg-primary rounded-full flex items-center justify-center"
        >
          <span class="text-white font-bold text-lg">N</span>
        </div>
        <span class="text-xl font-bold text-primary tracking-tight"
          >NearFix</span
        >
      </div>

      <div
        class="hidden md:flex items-center space-x-8 text-sm font-medium text-gray-600"
      >
        <a href="#how-it-works" class="hover:text-primary transition"
          >How it Works</a
        >
        <a href="#categories" class="hover:text-primary transition"
          >Categories</a
        >
        <a href="about.jsp" class="hover:text-primary transition">About</a>
        <a href="contact.jsp" class="hover:text-primary transition">Contact</a>
      </div>

      <div class="flex items-center space-x-4">
        <a
          href="login.jsp"
          class="text-sm font-semibold text-gray-700 hover:text-primary transition"
          >Log in</a
        >
        <a
          href="register.jsp"
          class="bg-primary hover-bg-primary text-white text-sm px-5 py-2.5 rounded-lg font-semibold transition shadow-md"
          >Get Started</a
        >
      </div>
    </nav>

    <!-- Hero Section -->
    <section
      class="pt-32 pb-20 px-6 max-w-7xl mx-auto grid lg:grid-cols-2 gap-12 items-center"
    >
      <div>
        <div
          class="inline-flex items-center px-3 py-1 bg-green-50 text-primary text-xs font-semibold rounded-full border border-green-100 mb-6"
        >
          <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
            <path
              d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
            ></path>
          </svg>
          Community Repair Registry
        </div>
        <h1 class="text-5xl lg:text-7xl font-bold leading-tight mb-6">
          Fix it locally.<br />
          <span class="text-primary italic">Save it from landfill.</span>
        </h1>
        <p class="text-lg text-gray-600 mb-10 max-w-lg leading-relaxed">
          NearFix connects you with skilled local repairers — cobblers, tailors,
          phone technicians, carpenters — so your broken items get a second
          life.
        </p>

        <div
          class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4 mb-12"
        >
          <a
            href="register.jsp"
            class="bg-primary hover-bg-primary text-white px-8 py-4 rounded-xl font-bold text-center transition shadow-lg flex items-center justify-center group"
          >
            Post a Repair Request
            <svg
              class="w-5 h-5 ml-2 group-hover:translate-x-1 transition"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M14 5l7 7m0 0l-7 7m7-7H3"
              ></path>
            </svg>
          </a>
          <a
            href="register.jsp?role=REPAIRER"
            class="border-2 border-primary text-primary hover:bg-green-50 px-8 py-4 rounded-xl font-bold text-center transition flex items-center justify-center"
          >
            Join as Repairer
          </a>
        </div>

        <div class="flex items-center space-x-8 pt-6 border-t border-gray-100">
          <div>
            <span class="block text-2xl font-bold">2,500+</span>
            <span
              class="text-xs text-gray-500 uppercase tracking-wider font-semibold"
              >Items Repaired</span
            >
          </div>
          <div>
            <span class="block text-2xl font-bold">340+</span>
            <span
              class="text-xs text-gray-500 uppercase tracking-wider font-semibold"
              >Fixers</span
            >
          </div>
          <div>
            <span class="block text-2xl font-bold"
              >4.8<span class="text-primary">★</span></span
            >
            <span
              class="text-xs text-gray-500 uppercase tracking-wider font-semibold"
              >Avg Rating</span
            >
          </div>
        </div>
      </div>

      <div class="relative">
        <div
          class="absolute -top-12 -left-12 w-64 h-64 bg-green-100 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse"
        ></div>
        <div
          class="absolute -bottom-12 -right-12 w-64 h-64 bg-yellow-100 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse"
          style="animation-delay: 2s"
        ></div>
        <div
          class="relative bg-white p-4 rounded-[40px] shadow-2xl overflow-hidden transform hover:scale-[1.02] transition duration-500"
        >
          <img
            src="images/landing.png"
            alt="Community Repair"
            class="rounded-[28px] w-full"
          />
          <div
            class="absolute bottom-10 left-10 bg-white/90 backdrop-blur p-4 rounded-2xl shadow-lg border border-white/50 animate-bounce cursor-default"
          >
            <div class="flex items-center space-x-3">
              <div class="p-2 bg-green-100 rounded-lg">
                <svg
                  class="w-6 h-6 text-primary"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"
                  ></path>
                </svg>
              </div>
              <div>
                <p class="text-xs text-gray-500 font-medium">
                  Saved from landfill
                </p>
                <p class="text-lg font-bold text-primary">4,547 items</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- How it Works -->
    <section id="how-it-works" class="py-24 bg-white">
      <div class="max-w-7xl mx-auto px-6 text-center">
        <span
          class="text-xs font-bold text-primary uppercase tracking-widest mb-4 block"
          >How it Works</span
        >
        <h2 class="text-4xl font-bold mb-16">
          Four simple steps to a fixed item
        </h2>

        <div class="grid md:grid-cols-4 gap-12">
          <div class="group">
            <div
              class="w-16 h-16 bg-green-50 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-primary transition-colors duration-300"
            >
              <svg
                class="w-8 h-8 text-primary group-hover:text-white"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                ></path>
              </svg>
            </div>
            <h3 class="text-lg font-bold mb-3">Post a Request</h3>
            <p class="text-sm text-gray-600">
              Describe your broken item, select a category and set the urgency
              level.
            </p>
          </div>

          <div class="group">
            <div
              class="w-16 h-16 bg-green-50 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-primary transition-colors duration-300"
            >
              <svg
                class="w-8 h-8 text-primary group-hover:text-white"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                ></path>
              </svg>
            </div>
            <h3 class="text-lg font-bold mb-3">Get Matched</h3>
            <p class="text-sm text-gray-600">
              Nearby skilled repairers see your request and accept the job.
            </p>
          </div>

          <div class="group">
            <div
              class="w-16 h-16 bg-green-50 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-primary transition-colors duration-300"
            >
              <svg
                class="w-8 h-8 text-primary group-hover:text-white"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M13 10V3L4 14h7v7l9-11h-7z"
                ></path>
              </svg>
            </div>
            <h3 class="text-lg font-bold mb-3">Track Progress</h3>
            <p class="text-sm text-gray-600">
              Follow your repair from Accepted → In Progress → Completion in
              real-time.
            </p>
          </div>

          <div class="group">
            <div
              class="w-16 h-16 bg-green-50 rounded-2xl flex items-center justify-center mx-auto mb-6 group-hover:bg-primary transition-colors duration-300"
            >
              <svg
                class="w-8 h-8 text-primary group-hover:text-white"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M5 13l4 4L19 7"
                ></path>
              </svg>
            </div>
            <h3 class="text-lg font-bold mb-3">Rate & Review</h3>
            <p class="text-sm text-gray-600">
              Once done, rate your repair and help build community trust.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Categories Section -->
    <section id="categories" class="py-24 bg-gray-50">
      <div class="max-w-7xl mx-auto px-6">
        <div class="text-center mb-16">
          <span
            class="text-xs font-bold text-primary uppercase tracking-widest mb-4 block"
            >Repair Categories</span
          >
          <h2 class="text-4xl font-bold">
            Whatever's broken, we've got a fixer
          </h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- Category Card -->
          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-blue-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Phone Repair</h4>
              <p class="text-sm text-gray-500">542 repairers available</p>
            </div>
          </div>

          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-pink-50 text-pink-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-pink-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M14.121 14.121L19 19m-7-7l7-7m-7 7l-2.879 2.879M12 12L9.121 9.121m0 5.758L5 19m0-14l4.121 4.121"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Clothing & Tailoring</h4>
              <p class="text-sm text-gray-500">118 repairers available</p>
            </div>
          </div>

          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-orange-50 text-orange-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-orange-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Furniture</h4>
              <p class="text-sm text-gray-500">155 repairers available</p>
            </div>
          </div>

          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-yellow-50 text-yellow-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-yellow-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Cobbler & Shoes</h4>
              <p class="text-sm text-gray-500">89 repairers available</p>
            </div>
          </div>

          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-indigo-50 text-indigo-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-indigo-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h10a2 2 0 012 2v14a2 2 0 01-2 2z"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Electronics</h4>
              <p class="text-sm text-gray-500">215 repairers available</p>
            </div>
          </div>

          <div
            class="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition flex items-center space-x-6 group"
          >
            <div
              class="w-14 h-14 bg-purple-50 text-purple-600 rounded-xl flex items-center justify-center flex-shrink-0 group-hover:bg-purple-600 group-hover:text-white transition"
            >
              <svg
                class="w-7 h-7"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
                ></path>
              </svg>
            </div>
            <div>
              <h4 class="font-bold text-lg">Carpentry</h4>
              <p class="text-sm text-gray-500">121 repairers available</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Portals Section -->
    <section class="py-24 bg-white">
      <div class="max-w-7xl mx-auto px-6">
        <div class="text-center mb-16">
          <span
            class="text-xs font-bold text-primary uppercase tracking-widest mb-4 block"
            >Three Portals</span
          >
          <h2 class="text-4xl font-bold">
            Built for everyone in the ecosystem
          </h2>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
          <!-- User Portal -->
          <div
            class="bg-soft p-8 rounded-3xl border border-gray-100 flex flex-col h-full"
          >
            <div
              class="w-12 h-12 bg-green-50 text-primary rounded-xl flex items-center justify-center mb-10"
            >
              <svg
                class="w-6 h-6"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                ></path>
              </svg>
            </div>
            <h3 class="text-2xl font-bold mb-4">User Portal</h3>
            <p class="text-gray-600 mb-8 flex-grow leading-relaxed">
              Post repair requests, track progress, and rate your repairer when
              the job is done.
            </p>
            <ul class="text-sm text-gray-500 space-y-3 mb-10">
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Post repair requests
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Track status in real-time
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Rate & review repairers
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Search by skill & location
              </li>
            </ul>
            <a
              href="register.jsp"
              class="w-full py-3 bg-primary text-white rounded-xl font-bold text-center hover-bg-primary transition"
              >Get Started</a
            >
          </div>

          <!-- Repairer Portal -->
          <div
            class="bg-primary p-8 rounded-3xl border border-primary/20 flex flex-col h-full text-white shadow-xl shadow-green-100"
          >
            <div
              class="w-12 h-12 bg-white/20 backdrop-blur text-white rounded-xl flex items-center justify-center mb-10"
            >
              <svg
                class="w-6 h-6"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 11-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z"
                ></path>
              </svg>
            </div>
            <h3 class="text-2xl font-bold mb-4">Repairer Portal</h3>
            <p class="text-green-100 mb-8 flex-grow leading-relaxed">
              Browse open jobs, accept work, manage your profile, and build your
              reputation.
            </p>
            <ul class="text-sm text-green-100/80 space-y-3 mb-10">
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-green-300"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Browse open repair jobs
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-green-300"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Accept & manage jobs
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-green-300"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Build ratings & reviews
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-green-300"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Show your expertise
              </li>
            </ul>
            <a
              href="register.jsp"
              class="w-full py-3 bg-white text-primary rounded-xl font-bold text-center hover:bg-green-50 transition"
              >Join as Repairer</a
            >
          </div>

          <!-- Admin Dashboard -->
          <div
            class="bg-soft p-8 rounded-3xl border border-gray-100 flex flex-col h-full"
          >
            <div
              class="w-12 h-12 bg-green-50 text-primary rounded-xl flex items-center justify-center mb-10"
            >
              <svg
                class="w-6 h-6"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"
                ></path>
              </svg>
            </div>
            <h3 class="text-2xl font-bold mb-4">Admin Dashboard</h3>
            <p class="text-gray-600 mb-8 flex-grow leading-relaxed">
              Approve repairers, manage categories, view analytics and system
              reports.
            </p>
            <ul class="text-sm text-gray-500 space-y-3 mb-10">
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Approve repairer profiles
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Manage skill categories
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                View system reports
              </li>
              <li class="flex items-center">
                <svg
                  class="w-4 h-4 mr-2 text-primary"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
                Monitor impact metrics
              </li>
            </ul>
            <a
              href="login.jsp"
              class="w-full py-3 border-2 border-primary text-primary rounded-xl font-bold text-center hover:bg-green-50 transition"
              >Admin Login</a
            >
          </div>
        </div>
      </div>
    </section>

    <!-- Community Impact -->
    <section class="py-24 bg-primary relative overflow-hidden">
      <div class="absolute inset-0 opacity-10">
        <svg class="w-full h-full" fill="currentColor" viewBox="0 0 800 400">
          <defs>
            <pattern
              id="dots"
              x="0"
              y="0"
              width="40"
              height="40"
              patternUnits="userSpaceOnUse"
            >
              <circle cx="2" cy="2" r="2"></circle>
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#dots)"></rect>
        </svg>
      </div>
      <div class="max-w-7xl mx-auto px-6 relative text-center">
        <span
          class="text-xs font-bold text-green-300 uppercase tracking-widest mb-4 block"
          >Our Community Impact</span
        >
        <h2 class="text-4xl font-bold text-white mb-16">Every repair counts</h2>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
          <div>
            <div
              class="w-16 h-16 bg-white/10 rounded-2xl flex items-center justify-center mx-auto mb-6"
            >
              <svg
                class="w-8 h-8 text-green-300"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3"
                ></path>
              </svg>
            </div>
            <span class="block text-4xl font-bold text-white mb-2">1,965</span>
            <span
              class="text-sm text-green-200 uppercase tracking-wider font-semibold"
              >Items Saved from Landfill</span
            >
          </div>

          <div>
            <div
              class="w-16 h-16 bg-white/10 rounded-2xl flex items-center justify-center mx-auto mb-6"
            >
              <svg
                class="w-8 h-8 text-green-300"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                ></path>
              </svg>
            </div>
            <span class="block text-4xl font-bold text-white mb-2">262+</span>
            <span
              class="text-sm text-green-200 uppercase tracking-wider font-semibold"
              >Active Repairers</span
            >
          </div>

          <div>
            <div
              class="w-16 h-16 bg-white/10 rounded-2xl flex items-center justify-center mx-auto mb-6"
            >
              <svg
                class="w-8 h-8 text-green-300"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 002 2h.293m1.414 0l1.586 1.586m-4-1.414l-1.586-1.586m5.858 2.828A9.99 9.99 0 0112 20c-4.418 0-8-3.582-8-8 0-4.418 3.582-8 8-8a9.99 9.99 0 019.288 5.828"
                ></path>
              </svg>
            </div>
            <span class="block text-4xl font-bold text-white mb-2">926+</span>
            <span
              class="text-sm text-green-200 uppercase tracking-wider font-semibold"
              >kg CO2 Avoided</span
            >
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="py-16 bg-white border-t border-gray-100">
      <div
        class="max-w-7xl mx-auto px-6 grid grid-cols-2 lg:grid-cols-5 gap-12"
      >
        <div class="col-span-2">
          <div class="flex items-center space-x-2 mb-6">
            <div
              class="w-6 h-6 bg-primary rounded-full flex items-center justify-center"
            >
              <span class="text-white font-bold text-[10px]">N</span>
            </div>
            <span class="text-lg font-bold text-primary tracking-tight"
              >NearFix</span
            >
          </div>
          <p class="text-sm text-gray-500 max-w-xs mb-6">
            Connecting communities with skilled local repairers. Fix it, don't
            trash it.
          </p>
          <div class="flex space-x-4">
            <a
              href="#"
              class="w-8 h-8 bg-gray-50 rounded-full flex items-center justify-center text-gray-400 hover:text-primary transition"
              ><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path
                  d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"
                ></path></svg
            ></a>
            <a
              href="#"
              class="w-8 h-8 bg-gray-50 rounded-full flex items-center justify-center text-gray-400 hover:text-primary transition"
              ><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                <path
                  d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.84 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"
                ></path></svg
            ></a>
          </div>
        </div>

        <div>
          <h5 class="font-bold text-sm mb-6">Platform</h5>
          <ul class="text-sm text-gray-500 space-y-4">
            <li>
              <a href="#" class="hover:text-primary transition">How it Works</a>
            </li>
            <li>
              <a href="#" class="hover:text-primary transition">Categories</a>
            </li>
            <li>
              <a href="#" class="hover:text-primary transition"
                >For Repairers</a
              >
            </li>
            <li>
              <a href="#" class="hover:text-primary transition">Pricing</a>
            </li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-sm mb-6">Company</h5>
          <ul class="text-sm text-gray-500 space-y-4">
            <li>
              <a href="about.jsp" class="hover:text-primary transition">About Us</a>
            </li>
            <li>
              <a href="contact.jsp" class="hover:text-primary transition">Contact</a>
            </li>
            <li><a href="#" class="hover:text-primary transition">Blog</a></li>
            <li>
              <a href="#" class="hover:text-primary transition">Careers</a>
            </li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-sm mb-6">Legal</h5>
          <ul class="text-sm text-gray-500 space-y-4">
            <li>
              <a href="#" class="hover:text-primary transition"
                >Privacy Policy</a
              >
            </li>
            <li>
              <a href="#" class="hover:text-primary transition"
                >Terms of Service</a
              >
            </li>
            <li>
              <a href="#" class="hover:text-primary transition"
                >Cookie Policy</a
              >
            </li>
          </ul>
        </div>
      </div>

      <div
        class="max-w-7xl mx-auto px-6 mt-16 pt-8 border-t border-gray-50 flex flex-col md:flex-row justify-between items-center text-xs text-gray-400"
      >
        <p>© 2026 NearFix. All rights reserved.</p>
        <p class="mt-4 md:mt-0 font-medium">
          Built with <span class="text-red-400">♥</span> for sustainable
          communities
        </p>
      </div>
    </footer>
  </body>
</html>
