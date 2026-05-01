<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NearFix - About Us</title>
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
        background-color: #fcfaf6;
      }
      .bg-mission {
        background-color: #faf5eb;
      }
      .bg-values {
        background-color: #fafafa;
      }
      .bg-team {
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
    <nav class="fixed top-0 w-full z-50 glass-card px-6 py-4 flex items-center justify-between shadow-sm bg-white/90">
      <div class="flex items-center space-x-2">
        <a href="<%= request.getContextPath() %>/" class="flex items-center space-x-2">
            <div class="w-8 h-8 bg-primary rounded-full flex items-center justify-center">
              <span class="text-white font-bold text-lg">N</span>
            </div>
            <span class="text-xl font-bold text-primary tracking-tight">NearFix</span>
        </a>
      </div>

      <div class="hidden md:flex items-center space-x-8 text-sm font-medium text-gray-600">
        <a href="<%= request.getContextPath() %>/#how-it-works" class="hover:text-primary transition">How it Works</a>
        <a href="<%= request.getContextPath() %>/#categories" class="hover:text-primary transition">Categories</a>
        <a href="<%= request.getContextPath() %>/about" class="text-primary transition">About</a>
        <a href="<%= request.getContextPath() %>/contact" class="hover:text-primary transition">Contact</a>
      </div>

      <div class="flex items-center space-x-4">
        <a href="<%= request.getContextPath() %>/login" class="text-sm font-semibold text-gray-700 hover:text-primary transition">Log in</a>
        <a href="<%= request.getContextPath() %>/register" class="bg-primary hover-bg-primary text-white text-sm px-5 py-2.5 rounded-lg font-semibold transition shadow-md">Get Started</a>
      </div>
    </nav>

    <!-- Hero Section -->
    <section class="pt-32 pb-20 px-6 max-w-7xl mx-auto grid lg:grid-cols-2 gap-12 items-center">
      <div>
        <span class="text-[10px] font-bold text-primary uppercase tracking-widest mb-4 block">ABOUT NEARFIX</span>
        <h1 class="text-5xl lg:text-[56px] font-bold text-primary leading-[1.1] mb-6">
          Fixing Things,<br />
          Building Community
        </h1>
        <p class="text-lg text-gray-600 mb-10 leading-relaxed max-w-md">
          NearFix was born from a simple idea: the best repairer for your broken item is probably right around the corner. We connect people who need repairs with skilled local fixers — reducing waste, saving money, and strengthening communities.
        </p>
      </div>

      <div class="relative">
        <div class="relative rounded-[2rem] overflow-hidden shadow-2xl">
          <!-- Fallback image from unsplash if hero.png not found -->
          <img src="images/hero.png" alt="About NearFix Workshop" class="w-full h-80 object-cover" onerror="this.src='https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'" />
          <div class="absolute bottom-4 left-4 bg-primary text-white p-4 px-6 rounded-xl shadow-lg">
            <p class="font-bold text-sm">Since 2023</p>
            <p class="text-xs text-green-100 mt-1">Making repair accessible</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Mission Section -->
    <section class="py-24 bg-[#faf5ec] text-center">
      <div class="max-w-3xl mx-auto px-6">
        <span class="text-[10px] font-bold text-primary uppercase tracking-widest mb-6 block">OUR MISSION</span>
        <h2 class="text-[32px] md:text-4xl font-bold mb-8 text-gray-800 leading-snug">
          A world where repair is the first choice, not the last resort
        </h2>
        <p class="text-base text-gray-600 leading-relaxed max-w-2xl mx-auto">
          We're on a mission to make repair convenient, affordable, and rewarding. By empowering local repairers and giving consumers an easy way to fix instead of replace, we're building a more sustainable future — one repair at a time.
        </p>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="py-16 bg-white">
      <div class="max-w-5xl mx-auto px-6 grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
        <div>
          <div class="text-5xl font-bold text-[#4ade80] mb-3">50K+</div>
          <div class="text-xs text-gray-400 font-medium">Repairs Completed</div>
        </div>
        <div>
          <div class="text-5xl font-bold text-gray-300 mb-3">3,200+</div>
          <div class="text-xs text-gray-400 font-medium">Skilled Repairers</div>
        </div>
        <div>
          <div class="text-5xl font-bold text-gray-200 mb-3">120+</div>
          <div class="text-xs text-gray-200 font-medium">Communities Served</div>
        </div>
      </div>
    </section>

    <!-- Values Section -->
    <section class="py-24 bg-[#fafafa]">
      <div class="max-w-7xl mx-auto px-6">
        <div class="text-center mb-16">
          <span class="text-[10px] font-bold text-primary uppercase tracking-widest mb-4 block">OUR VALUES</span>
          <h2 class="text-3xl font-bold text-gray-400">What drives us every day</h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-6">
          <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-50">
            <div class="w-10 h-10 bg-green-50 rounded-xl flex items-center justify-center mb-5 text-[#86efac]">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 002 2h.293m1.414 0l1.586 1.586m-4-1.414l-1.586-1.586m5.858 2.828A9.99 9.99 0 0112 20c-4.418 0-8-3.582-8-8 0-4.418 3.582-8 8-8a9.99 9.99 0 019.288 5.828"></path></svg>
            </div>
            <h4 class="font-bold text-sm mb-3 text-gray-700">Sustainability First</h4>
            <p class="text-xs text-gray-400 leading-relaxed">Every repair prevents waste. We believe in extending the life of products to protect our planet.</p>
          </div>
          
          <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-50">
            <div class="w-10 h-10 bg-green-50 rounded-xl flex items-center justify-center mb-5 text-[#86efac]">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
            </div>
            <h4 class="font-bold text-sm mb-3 text-gray-300">Community Power</h4>
            <p class="text-xs text-gray-200 leading-relaxed">Local repairs build neighborhood resilience, build connections, and keep skills alive.</p>
          </div>

          <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-50">
            <div class="w-10 h-10 bg-green-50 rounded-xl flex items-center justify-center mb-5 text-primary">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path></svg>
            </div>
            <h4 class="font-bold text-sm mb-3 text-gray-800">Quality Guaranteed</h4>
            <p class="text-xs text-gray-500 leading-relaxed">Every repairer is vetted. Every job is backed by our satisfaction promise.</p>
          </div>

          <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-50">
            <div class="w-10 h-10 bg-green-50 rounded-xl flex items-center justify-center mb-5 text-primary">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
            </div>
            <h4 class="font-bold text-sm mb-3 text-gray-800">Innovation</h4>
            <p class="text-xs text-gray-500 leading-relaxed">We use technology to make finding and booking repair services effortless.</p>
          </div>

          <div class="bg-white p-6 rounded-2xl shadow-sm border border-gray-50">
            <div class="w-10 h-10 bg-green-50 rounded-xl flex items-center justify-center mb-5 text-primary">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
            </div>
            <h4 class="font-bold text-sm mb-3 text-gray-800">Trust & Safety</h4>
            <p class="text-xs text-gray-500 leading-relaxed">Verified profiles, secure payments, and real reviews you can count on.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section class="py-24 bg-soft">
      <div class="max-w-4xl mx-auto px-6 text-center">
        <span class="text-[10px] font-bold text-primary uppercase tracking-widest mb-4 block">OUR TEAM</span>
        <h2 class="text-3xl font-bold mb-16">Meet the people behind NearFix</h2>

        <div class="flex flex-wrap justify-center gap-16">
          <div class="flex flex-col items-center">
            <div class="w-[100px] h-[100px] bg-[#86efac] rounded-full flex items-center justify-center text-white text-xl font-bold mb-5 shadow-sm">
              SC
            </div>
            <h4 class="font-bold text-[15px] text-gray-800 mb-1">Sarah Chen</h4>
            <p class="text-[13px] text-gray-400">Co-founder & CEO</p>
          </div>

          <div class="flex flex-col items-center">
            <div class="w-[100px] h-[100px] bg-[#d1fae5] rounded-full flex items-center justify-center text-[#86efac] text-xl font-bold mb-5 shadow-sm">
              MJ
            </div>
            <h4 class="font-bold text-[15px] text-gray-300 mb-1">Marcus Johnson</h4>
            <p class="text-[13px] text-gray-200">Head of Community</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="py-16 bg-white border-t border-gray-100">
      <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 lg:grid-cols-5 gap-12">
        <div class="col-span-2">
          <div class="flex items-center space-x-2 mb-6">
            <div class="w-6 h-6 bg-primary rounded-full flex items-center justify-center">
              <span class="text-white font-bold text-[10px]">N</span>
            </div>
            <span class="text-lg font-bold text-primary tracking-tight">NearFix</span>
          </div>
          <p class="text-xs text-gray-500 max-w-xs mb-6 leading-relaxed">
            Connecting communities with skilled local repairers. Fix it, don't trash it.
          </p>
        </div>

        <div>
          <h5 class="font-bold text-xs mb-6 text-gray-800">Platform</h5>
          <ul class="text-xs text-gray-500 space-y-4">
            <li><a href="index.jsp#how-it-works" class="hover:text-primary transition">How it Works</a></li>
            <li><a href="index.jsp#categories" class="hover:text-primary transition">Categories</a></li>
            <li><a href="#" class="hover:text-primary transition">For Repairers</a></li>
            <li><a href="#" class="hover:text-primary transition">Pricing</a></li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-xs mb-6 text-gray-800">Company</h5>
          <ul class="text-xs text-gray-500 space-y-4">
            <li><a href="about.jsp" class="hover:text-primary transition">About Us</a></li>
            <li><a href="contact.jsp" class="hover:text-primary transition">Contact</a></li>
            <li><a href="#" class="hover:text-primary transition">Blog</a></li>
            <li><a href="#" class="hover:text-primary transition">Careers</a></li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-xs mb-6 text-gray-800">Legal</h5>
          <ul class="text-xs text-gray-500 space-y-4">
            <li><a href="#" class="hover:text-primary transition">Privacy Policy</a></li>
            <li><a href="#" class="hover:text-primary transition">Terms of Service</a></li>
            <li><a href="#" class="hover:text-primary transition">Cookie Policy</a></li>
          </ul>
        </div>
      </div>

      <div class="max-w-7xl mx-auto px-6 mt-16 pt-8 border-t border-gray-50 flex flex-col md:flex-row justify-between items-center text-[11px] text-gray-400">
        <p>© 2026 NearFix. All rights reserved.</p>
        <p class="mt-4 md:mt-0 font-medium">
          Built with <span class="text-primary">♥</span> for sustainable communities
        </p>
      </div>
    </footer>
  </body>
</html>
