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

      <%-- ---- Right: Contact Cards ---- --%>
      <div class="lg:w-6/12 w-full grid grid-cols-1 gap-4">
        <%-- Email Card --%>
        <div
          class="group bg-gray-800/50 border border-gray-700 p-6 rounded-2xl flex items-center gap-6 hover:bg-gray-800 transition-all duration-300 hover:border-green-500/50"
        >
          <div
            class="w-10 h-10 rounded-2xl bg-green-500/10 flex items-center justify-center text-green-500 group-hover:scale-110 transition-transform duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"
              ></path>
              <polyline points="22,6 12,13 2,6"></polyline>
            </svg>
          </div>
          <div>
            <p
              class="text-xs font-bold text-gray-500 uppercase tracking-widest mb-1"
            >
              Email
            </p>
            <p class="text-lg font-bold text-white">hello@nearfix.com</p>
          </div>
        </div>

        <%-- Phone Card --%>
        <div
          class="group bg-gray-800/50 border border-gray-700 p-6 rounded-2xl flex items-center gap-6 hover:bg-gray-800 transition-all duration-300 hover:border-blue-500/50"
        >
          <div
            class="w-10 h-10 rounded-2xl bg-blue-500/10 flex items-center justify-center text-blue-500 group-hover:scale-110 transition-transform duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"
              ></path>
            </svg>
          </div>
          <div>
            <p
              class="text-xs font-bold text-gray-500 uppercase tracking-widest mb-1"
            >
              Phone / WhatsApp
            </p>
            <p class="text-lg font-bold text-white">+977 98 XXXX XXXX</p>
          </div>
        </div>

        <%-- Institution Card --%>
        <div
          class="group bg-gray-800/50 border border-gray-700 p-6 rounded-2xl flex items-center gap-6 hover:bg-gray-800 transition-all duration-300 hover:border-yellow-500/50"
        >
          <div
            class="w-10 h-10 rounded-2xl bg-yellow-500/10 flex items-center justify-center text-yellow-500 group-hover:scale-110 transition-transform duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
              <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
          </div>
          <div>
            <p
              class="text-xs font-bold text-gray-500 uppercase tracking-widest mb-1"
            >
              Institution
            </p>
            <p class="text-lg font-bold text-white">
              Your College Name, Biratnagar
            </p>
          </div>
        </div>

        <%-- Response Hours Card --%>
        <div
          class="group bg-gray-800/50 border border-gray-700 p-6 rounded-2xl flex items-center gap-6 hover:bg-gray-800 transition-all duration-300 hover:border-purple-500/50"
        >
          <div
            class="w-10 h-10 rounded-2xl bg-purple-500/10 flex items-center justify-center text-purple-500 group-hover:scale-110 transition-transform duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-6 h-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
              <line x1="16" y1="2" x2="16" y2="6"></line>
              <line x1="8" y1="2" x2="8" y2="6"></line>
              <line x1="3" y1="10" x2="21" y2="10"></line>
            </svg>
          </div>
          <div>
            <p
              class="text-xs font-bold text-gray-500 uppercase tracking-widest mb-1"
            >
              Response Hours
            </p>
            <p class="text-lg font-bold text-white">
              Sun &ndash; Fri, 9am &ndash; 5pm NST
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
