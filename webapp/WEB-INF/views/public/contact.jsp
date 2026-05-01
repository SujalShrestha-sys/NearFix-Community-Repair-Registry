<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NearFix - Contact Us</title>
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
      .bg-form-section {
        background-color: #f5f4ef;
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
        <a href="<%= request.getContextPath() %>/about" class="hover:text-primary transition">About</a>
        <a href="<%= request.getContextPath() %>/contact" class="text-primary transition">Contact</a>
      </div>

      <div class="flex items-center space-x-4">
        <a href="<%= request.getContextPath() %>/login" class="text-sm font-semibold text-gray-700 hover:text-primary transition">Log in</a>
        <a href="<%= request.getContextPath() %>/register" class="bg-primary hover-bg-primary text-white text-sm px-5 py-2.5 rounded-lg font-semibold transition shadow-md">Get Started</a>
      </div>
    </nav>

    <!-- Header Section -->
    <section class="pt-32 pb-16 px-6 max-w-4xl mx-auto text-center">
      <span class="text-[10px] font-bold text-primary uppercase tracking-widest mb-4 block">CONTACT US</span>
      <h1 class="text-[40px] md:text-5xl font-bold text-gray-600 leading-tight mb-6">
        We'd Love to <span class="text-[#74b39a]">Hear From<br/>You</span>
      </h1>
      <p class="text-gray-400 max-w-xl mx-auto text-[15px] leading-relaxed">
        Have a question, suggestion, or partnership idea? Reach out and our team will get back to you promptly.
      </p>
    </section>

    <!-- Contact Info Cards -->
    <section class="pb-24 px-6 max-w-6xl mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <!-- Email -->
        <div class="bg-[#faf9f5] p-8 rounded-2xl text-center flex flex-col items-center shadow-sm">
          <div class="w-10 h-10 bg-[#b2dfcb] rounded-xl flex items-center justify-center mb-5 text-white">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
          </div>
          <h3 class="font-bold text-[13px] text-gray-800 mb-1">Email Us</h3>
          <p class="text-[11px] text-gray-800 font-medium mb-1">hello@nearfix.com</p>
          <p class="text-[10px] text-[#74b39a]">We reply within 24 hours</p>
        </div>

        <!-- Phone -->
        <div class="bg-[#faf9f5] p-8 rounded-2xl text-center flex flex-col items-center shadow-sm">
          <div class="w-10 h-10 bg-[#b2dfcb] rounded-xl flex items-center justify-center mb-5 text-white">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
          </div>
          <h3 class="font-bold text-[13px] text-gray-800 mb-1">Call Us</h3>
          <p class="text-[11px] text-gray-800 font-medium mb-1">+1 (555) 123-3456</p>
          <p class="text-[10px] text-gray-400">Mon-Fri, 9 AM - 6 PM</p>
        </div>

        <!-- Location -->
        <div class="bg-[#faf9f5] p-8 rounded-2xl text-center flex flex-col items-center shadow-sm">
          <div class="w-10 h-10 bg-[#e0f2eb] rounded-xl flex items-center justify-center mb-5 text-[#b2dfcb]">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.243-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
          </div>
          <h3 class="font-bold text-[13px] text-gray-400 mb-1">Visit Us</h3>
          <p class="text-[11px] text-gray-800 font-medium mb-1">123 Repair Lane, Suite 100</p>
          <p class="text-[10px] text-gray-400">San Francisco, CA 94102</p>
        </div>

        <!-- Working Hours -->
        <div class="bg-transparent p-8 rounded-2xl text-center flex flex-col items-center justify-center">
          <h3 class="font-bold text-[13px] text-gray-800 mb-1 mt-8">Monday - Friday</h3>
          <p class="text-[10px] text-gray-400">9:00 AM - 6:00 PM PST</p>
        </div>
      </div>
    </section>

    <!-- Form and FAQ Section -->
    <section class="bg-form-section py-24">
      <div class="max-w-6xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-2 gap-16">
        
        <!-- Form Column -->
        <div>
          <div class="flex items-center space-x-3 mb-8">
            <svg class="w-6 h-6 text-[#5cb892]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
            <h2 class="text-[22px] font-bold text-gray-800">Send a Message</h2>
          </div>

          <form action="#" method="POST" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-[11px] font-bold text-gray-800 mb-2">Full Name</label>
                <input type="text" class="w-full px-4 py-3 rounded-lg border border-gray-100 focus:outline-none focus:ring-1 focus:ring-primary/50 focus:border-primary transition bg-white text-sm" placeholder="John Doe" />
              </div>
              <div>
                <label class="block text-[11px] font-bold text-gray-800 mb-2">Email</label>
                <input type="email" class="w-full px-4 py-3 rounded-lg border border-gray-100 focus:outline-none focus:ring-1 focus:ring-primary/50 focus:border-primary transition bg-white text-sm" placeholder="john@example.com" />
              </div>
            </div>
            
            <div>
              <label class="block text-[11px] font-bold text-gray-800 mb-2">Subject</label>
              <input type="text" class="w-full px-4 py-3 rounded-lg border border-gray-100 focus:outline-none focus:ring-1 focus:ring-primary/50 focus:border-primary transition bg-white text-sm" placeholder="How can we help?" />
            </div>

            <div>
              <label class="block text-[11px] font-bold text-gray-800 mb-2">Message</label>
              <textarea rows="5" class="w-full px-4 py-3 rounded-lg border border-gray-100 focus:outline-none focus:ring-1 focus:ring-primary/50 focus:border-primary transition bg-white text-sm resize-none" placeholder="Tell us more about your inquiry..."></textarea>
            </div>

            <button type="submit" class="bg-[#54a482] hover:bg-[#439678] text-white font-bold py-[10px] px-6 rounded-lg transition flex items-center shadow-sm text-xs tracking-wide">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
              Send Message
            </button>
          </form>
        </div>

        <!-- FAQ Column -->
        <div>
          <div class="flex items-center space-x-3 mb-8">
            <svg class="w-6 h-6 text-[#5cb892]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
            <h2 class="text-[22px] font-bold text-gray-800">Frequently Asked</h2>
          </div>

          <div class="space-y-4">
            <div class="bg-white p-5 rounded-xl shadow-sm border border-gray-50">
              <h4 class="font-bold text-[13px] text-gray-800 mb-2">How do I book a repair?</h4>
              <p class="text-xs text-gray-500 leading-relaxed">Simply create an account, describe your repair need, and we'll match you with a skilled local repairer.</p>
            </div>

            <div class="bg-white p-5 rounded-xl shadow-sm border border-gray-50">
              <h4 class="font-bold text-[13px] text-gray-800 mb-2">How are repairers vetted?</h4>
              <p class="text-xs text-gray-500 leading-relaxed">Every repairer goes through identity verification, skills assessment, and background checks before joining.</p>
            </div>

            <div class="bg-white p-5 rounded-xl shadow-sm border border-gray-50">
              <h4 class="font-bold text-[13px] text-gray-800 mb-2">What if I'm not satisfied?</h4>
              <p class="text-xs text-gray-500 leading-relaxed">We offer a satisfaction guarantee. If the repair doesn't meet standards, we'll arrange a free follow-up.</p>
            </div>

            <div class="bg-white p-5 rounded-xl shadow-sm border border-gray-50">
              <h4 class="font-bold text-[13px] text-gray-800 mb-2">How do I become a repairer?</h4>
              <p class="text-xs text-gray-500 leading-relaxed">Sign up as a repairer, submit your credentials, and our team will review your application within 48 hours.</p>
            </div>
          </div>
        </div>

      </div>
    </section>

    <!-- Footer -->
    <footer class="py-16 bg-white">
      <div class="max-w-7xl mx-auto px-6 grid grid-cols-2 lg:grid-cols-5 gap-12">
        <div class="col-span-2">
          <div class="flex items-center space-x-2 mb-6">
            <div class="w-6 h-6 bg-[#5cb892] rounded-full flex items-center justify-center">
              <span class="text-white font-bold text-[10px]">N</span>
            </div>
            <span class="text-sm font-bold text-gray-800 tracking-tight">NearFix</span>
          </div>
          <p class="text-[11px] text-gray-500 max-w-[200px] mb-6 leading-relaxed">
            Connecting communities with skilled local repairers. Fix it, don't trash it.
          </p>
        </div>

        <div>
          <h5 class="font-bold text-[11px] mb-5 text-gray-800">Platform</h5>
          <ul class="text-[11px] text-gray-500 space-y-4">
            <li><a href="index.jsp#how-it-works" class="hover:text-primary transition">How It Works</a></li>
            <li><a href="index.jsp#categories" class="hover:text-primary transition">Categories</a></li>
            <li><a href="#" class="hover:text-primary transition">For Repairers</a></li>
            <li><a href="#" class="hover:text-primary transition">Pricing</a></li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-[11px] mb-5 text-gray-800">Company</h5>
          <ul class="text-[11px] text-gray-500 space-y-4">
            <li><a href="about.jsp" class="hover:text-primary transition">About Us</a></li>
            <li><a href="contact.jsp" class="hover:text-primary transition">Contact</a></li>
            <li><a href="#" class="hover:text-primary transition">Blog</a></li>
            <li><a href="#" class="hover:text-primary transition">Careers</a></li>
          </ul>
        </div>

        <div>
          <h5 class="font-bold text-[11px] mb-5 text-gray-800">Legal</h5>
          <ul class="text-[11px] text-gray-500 space-y-4">
            <li><a href="#" class="hover:text-primary transition">Privacy Policy</a></li>
            <li><a href="#" class="hover:text-primary transition">Terms of Service</a></li>
            <li><a href="#" class="hover:text-primary transition">Cookie Policy</a></li>
          </ul>
        </div>
      </div>

      <div class="max-w-7xl mx-auto px-6 mt-16 pt-6 border-t border-gray-100 flex flex-col md:flex-row justify-between items-center text-[10px] text-gray-400">
        <p>© 2026 NearFix. All rights reserved.</p>
        <p class="mt-4 md:mt-0">
          Built with <span class="text-[#5cb892]">♥</span> for sustainable communities
        </p>
      </div>
    </footer>
  </body>
</html>
