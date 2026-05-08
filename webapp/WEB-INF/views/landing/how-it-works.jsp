<%-- ============================================================ Component: How
It Works Section Description: Three-step process explaining the platform flow.
============================================================ --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<section id="how-it-works" class="py-20 px-4 sm:px-6 lg:px-8 bg-white">
  <div class="max-w-6xl mx-auto">
    <%-- Section Label --%>
    <p class="text-xs font-bold text-green-600 uppercase tracking-widest mb-3">
      How it works
    </p>

    <%-- Section Title --%>
    <h2 class="text-3xl sm:text-4xl font-extrabold text-gray-900 mb-4">
      Repair in three simple steps
    </h2>

    <%-- Section Sub-text --%>
    <p class="text-base text-gray-500 mb-14 max-w-xl">
      NearFix bridges the gap between people with broken items and skilled local
      repairers in your community.
    </p>

    <%-- Steps Grid --%>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-14">
      <%-- ---- Step 1 ---- --%>
      <div class="relative flex flex-col gap-4">
        <%-- Big step number (background decoration) --%>
        <span
          class="absolute -top-2 -right-2 text-8xl font-black text-gray-100 select-none leading-none pointer-events-none"
          >01</span
        >
        <%-- Icon --%>
        <div class="nf-step-icon nf-step-green relative w-12 h-12 rounded-xl bg-green-50 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-green-600"
                 fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5
                         m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
            </svg>
        </div>

        <h3 class="text-lg font-bold text-gray-900">Post your request</h3>
        <p class="text-sm text-gray-500 leading-relaxed">
          Describe your broken item, pick a category, set urgency. Takes 60
          seconds. Your request goes live immediately.
        </p>

        <%-- Connector arrow (hidden on mobile) --%>
        <div class="hidden md:block absolute top-6 left-full w-8 text-gray-200">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-6 h-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="1.5"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M9 5l7 7-7 7"
            />
          </svg>
        </div>
      </div>

      <%-- ---- Step 2 ---- --%>
      <div class="relative flex flex-col gap-4">
        <span
          class="absolute -top-2 -right-2 text-8xl font-black text-gray-100 select-none leading-none pointer-events-none"
          >02</span
        >
        <%-- Icon --%>
        <div class="nf-step-icon nf-step-blue relative w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-600"
                 fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77
                         a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91
                         a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
            </svg>
        </div>

        <h3 class="text-lg font-bold text-gray-900">A repairer accepts</h3>
        <p class="text-sm text-gray-500 leading-relaxed">
          Local skilled repairers see your request and accept it. You get
          notified instantly. Status moves to Accepted.
        </p>

        <%-- Connector arrow --%>
        <div class="hidden md:block absolute top-6 left-full w-8 text-gray-200">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-6 h-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="1.5"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M9 5l7 7-7 7"
            />
          </svg>
        </div>
      </div>

      <%-- ---- Step 3 ---- --%>
      <div class="relative flex flex-col gap-4">
        <span
          class="absolute -top-2 -right-2 text-8xl font-black text-gray-100 select-none leading-none pointer-events-none"
          >03</span
        >
        <%-- Icon --%>
        <div class="nf-step-icon nf-step-yellow relative w-12 h-12 rounded-xl bg-yellow-50 flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-yellow-500"
                 fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77
                         l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
            </svg>
        </div>

        <h3 class="text-lg font-bold text-gray-900">Get it fixed &amp; rate</h3>
        <p class="text-sm text-gray-500 leading-relaxed">
          Track progress in real-time:
          <span class="text-yellow-600 font-medium">Pending</span> &rarr;
          <span class="text-blue-600 font-medium">Accepted</span> &rarr;
          <span class="text-green-600 font-medium">In Progress</span> &rarr;
          Completed. Rate your repairer when done.
        </p>
      </div>
    </div>
  </div>
</section>
