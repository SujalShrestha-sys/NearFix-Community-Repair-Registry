<%-- ============================================================ Component:
Contact Hero Description: Dark banner with main headline and quick info cards.
============================================================ --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<section
  class="pt-32 pb-20 px-4 sm:px-6 lg:px-8 bg-gray-900 overflow-hidden relative"
>
  <%-- Background Decoration --%>
  <div
    class="absolute top-0 right-0 -mr-20 -mt-20 w-96 h-96 bg-green-500/10 rounded-full blur-3xl"
  ></div>
  <div
    class="absolute bottom-0 left-0 -ml-20 -mb-20 w-80 h-80 bg-blue-500/5 rounded-full blur-3xl"
  ></div>

  <div class="max-w-7xl mx-auto relative z-10">
    <div class="flex flex-col lg:flex-row gap-12 items-start">
      <%-- ---- Left: Main Text ---- --%>
      <div class="lg:w-7/12">
        <%-- Badge --%>
        <div
          class="inline-flex items-center gap-2 mb-6 px-3 py-1.5 rounded-full bg-green-900/50 border border-green-800/50"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-4 h-4 text-green-400"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
            />
          </svg>
          <span
            class="text-xs font-bold text-green-400 uppercase tracking-widest"
            >Get in touch</span
          >
        </div>

        <h1
          class="text-6xl sm:text-7xl font-black text-white leading-tight mb-8"
        >
          Let's<br />
          talk<br />
          <span class="text-green-500">NearFix.</span>
        </h1>

        <p class="text-xl text-gray-400 leading-relaxed max-w-lg mb-10">
          Whether you have questions about using the platform, want to report an
          issue, or just want to tell us how we can improve &mdash; we'd love to
          hear from you.
        </p>

        <%-- Info Badges --%>
        <div class="flex flex-wrap gap-4">
          <div
            class="flex items-center gap-2 bg-gray-800/80 border border-gray-700 px-4 py-2 rounded-xl"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-5 h-5 text-green-500"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <circle cx="12" cy="12" r="10"></circle>
              <polyline points="12 6 12 12 16 14"></polyline>
            </svg>
            <span class="text-sm text-gray-300 font-medium"
              >Avg. response:
              <span class="text-white font-bold">24 hours</span></span
            >
          </div>
          <div
            class="flex items-center gap-2 bg-gray-800/80 border border-gray-700 px-4 py-2 rounded-xl"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-5 h-5 text-red-500"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
              <circle cx="12" cy="10" r="3"></circle>
            </svg>
            <span class="text-sm text-gray-300 font-medium"
              >Dharan, Nepal</span
            >
          </div>
        </div>
      </div>

      <%-- ---- Right: Creative Hub (Award Winning Visuals) ---- --%>
      <div class="lg:w-5/12 w-full relative min-h-[500px] flex items-center justify-center">
        
        <%-- Artistic Background Glows --%>
        <div class="absolute inset-0 z-0">
          <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-green-500/20 rounded-full blur-[120px] animate-pulse"></div>
          <div class="absolute top-1/4 right-0 w-40 h-40 bg-blue-500/10 rounded-full blur-[80px]"></div>
        </div>

        <%-- Central Hub (Floating Glass Card) --%>
        <div class="relative z-10 w-full max-w-sm aspect-square bg-gray-800/30 backdrop-blur-xl border border-white/10 rounded-[4rem] shadow-2xl flex items-center justify-center animate-float">
          
          <%-- Center Icon --%>
          <div class="relative">
            <div class="absolute inset-0 bg-green-500 rounded-full blur-2xl opacity-20"></div>
            <div class="w-32 h-32 bg-gradient-to-br from-green-500 to-green-700 rounded-[2.5rem] shadow-2xl flex items-center justify-center text-white relative z-10">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-16 h-16 animate-pulse" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
              </svg>
            </div>
          </div>

          <%-- Orbiting Items (Floating Contact Pills) --%>
          
          <%-- Pill 1: Email (Top Left) --%>
          <div class="absolute -top-6 -left-12 bg-white/5 backdrop-blur-md border border-white/10 px-5 py-3 rounded-2xl shadow-xl animate-float" style="animation-delay: -1s;">
            <div class="flex items-center gap-3">
              <div class="w-8 h-8 rounded-lg bg-green-500/20 flex items-center justify-center text-green-400">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
              </div>
              <div>
                <p class="text-[10px] font-black text-gray-500 uppercase tracking-widest">Email</p>
                <p class="text-xs font-bold text-white">hello@nearfix.com</p>
              </div>
            </div>
          </div>

          <%-- Pill 2: Phone (Bottom Right) --%>
          <div class="absolute -bottom-6 -right-12 bg-white/5 backdrop-blur-md border border-white/10 px-5 py-3 rounded-2xl shadow-xl animate-float" style="animation-delay: -2.5s;">
            <div class="flex items-center gap-3">
              <div class="w-8 h-8 rounded-lg bg-blue-500/20 flex items-center justify-center text-blue-400">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                </svg>
              </div>
              <div>
                <p class="text-[10px] font-black text-gray-500 uppercase tracking-widest">WhatsApp</p>
                <p class="text-xs font-bold text-white">+977 98 XXXX XXXX</p>
              </div>
            </div>
          </div>

          <%-- Pill 3: Location (Bottom Left) --%>
          <div class="absolute bottom-1/4 -left-20 bg-white/5 backdrop-blur-md border border-white/10 px-5 py-3 rounded-2xl shadow-xl animate-float" style="animation-delay: -4s;">
            <div class="flex items-center gap-3">
              <div class="w-8 h-8 rounded-lg bg-red-500/20 flex items-center justify-center text-red-400">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                </svg>
              </div>
              <div>
                <p class="text-[10px] font-black text-gray-500 uppercase tracking-widest">Office</p>
                <p class="text-xs font-bold text-white">Biratnagar, Nepal</p>
              </div>
            </div>
          </div>

          <%-- Pill 4: Hours (Top Right) --%>
          <div class="absolute top-1/4 -right-20 bg-white/5 backdrop-blur-md border border-white/10 px-5 py-3 rounded-2xl shadow-xl animate-float" style="animation-delay: -5.5s;">
            <div class="flex items-center gap-3">
              <div class="w-8 h-8 rounded-lg bg-yellow-500/20 flex items-center justify-center text-yellow-400">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
              </div>
              <div>
                <p class="text-[10px] font-black text-gray-500 uppercase tracking-widest">Support</p>
                <p class="text-xs font-bold text-white">24/7 Monitoring</p>
              </div>
            </div>
          </div>

          <%-- Floating Particles --%>
          <div class="absolute top-10 right-10 w-2 h-2 bg-green-500 rounded-full animate-ping"></div>
          <div class="absolute bottom-20 left-5 w-1 h-1 bg-blue-400 rounded-full animate-pulse"></div>
        </div>

        <%-- Artistic Background Shapes --%>
        <div class="absolute -z-10 w-[120%] h-[120%] border border-white/5 rounded-full rotate-45 scale-110"></div>
        <div class="absolute -z-10 w-[140%] h-[140%] border border-white/5 rounded-full -rotate-12 scale-125"></div>
      </div>
    </div>
  </div>
</section>
