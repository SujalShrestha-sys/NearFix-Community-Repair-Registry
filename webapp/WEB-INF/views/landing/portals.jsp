<%-- ============================================================ Component:
Three Portals Section Description: Explains the three user roles: Regular User,
Repairer, and Admin — with portal CTA links.
============================================================ --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<section id="portals" class="py-20 px-4 sm:px-6 lg:px-8 bg-gray-900">
  <div class="max-w-6xl mx-auto">
    <%-- Section Label --%>
    <p class="text-xs font-bold text-green-400 uppercase tracking-widest mb-3">
      Who uses NearFix
    </p>

    <%-- Section Title --%>
    <h2 class="text-3xl sm:text-4xl font-extrabold text-white mb-12">
      Three portals. One platform.
    </h2>

    <%-- Portal Cards Grid --%>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <%-- ---- Portal 1: Regular User ---- --%>
      <div class="nf-portal-card nf-portal-green bg-gray-800 border border-gray-700 rounded-2xl p-6 hover:border-green-600 transition-colors duration-300 group flex flex-col gap-5">
        <%-- Icon --%>
        <div
          class="w-12 h-12 rounded-xl bg-green-900/60 flex items-center justify-center"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-6 h-6 text-green-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
            />
          </svg>
        </div>

        <%-- Text --%>
        <div class="flex flex-col gap-2 flex-1">
          <h3 class="text-lg font-bold text-white">Regular User</h3>
          <p class="text-sm text-gray-400 leading-relaxed">
            Post repair requests, track status in real-time, rate repairers
            after the job is done.
          </p>
        </div>

        <%-- CTA --%>
        <div class="flex items-center justify-between mt-auto">
          <a
            href="${pageContext.request.contextPath}/register"
            id="portal-cta-user"
            class="text-xs font-bold text-green-400 bg-green-900/50 border border-green-800 px-3 py-1.5 rounded-lg hover:bg-green-800 transition-colors duration-200 uppercase tracking-wide"
          >
            User Portal
          </a>
          <%-- Arrow --%>
          <div
            class="w-8 h-8 rounded-full bg-gray-700 group-hover:bg-green-600 flex items-center justify-center transition-colors duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-4 h-4 text-gray-300"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M17 8l4 4m0 0l-4 4m4-4H3"
              />
            </svg>
          </div>
        </div>
      </div>

      <%-- ---- Portal 2: Repairer ---- --%>
      <div class="nf-portal-card nf-portal-blue bg-gray-800 border border-gray-700 rounded-2xl p-6 hover:border-blue-500 transition-colors duration-300 group flex flex-col gap-5">
        <%-- Icon --%>
        <div
          class="w-12 h-12 rounded-xl bg-blue-900/60 flex items-center justify-center"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-6 h-6 text-blue-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77
                                 a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91
                                 a6 6 0 0 1 7.94-7.94l-3.76 3.76z"
            />
          </svg>
        </div>

        <%-- Text --%>
        <div class="flex flex-col gap-2 flex-1">
          <h3 class="text-lg font-bold text-white">Repairer</h3>
          <p class="text-sm text-gray-400 leading-relaxed">
            Browse open repair jobs, accept work, update status as you go, build
            your rated profile.
          </p>
        </div>

        <%-- CTA --%>
        <div class="flex items-center justify-between mt-auto">
          <a
            href="${pageContext.request.contextPath}/register?role=repairer"
            id="portal-cta-repairer"
            class="text-xs font-bold text-blue-400 bg-blue-900/50 border border-blue-800 px-3 py-1.5 rounded-lg hover:bg-blue-800 transition-colors duration-200 uppercase tracking-wide"
          >
            Repairer Portal
          </a>
          <div
            class="w-8 h-8 rounded-full bg-gray-700 group-hover:bg-blue-600 flex items-center justify-center transition-colors duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-4 h-4 text-gray-300"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M17 8l4 4m0 0l-4 4m4-4H3"
              />
            </svg>
          </div>
        </div>
      </div>

      <%-- ---- Portal 3: Admin ---- --%>
      <div class="nf-portal-card nf-portal-purple bg-gray-800 border border-gray-700 rounded-2xl p-6 hover:border-purple-500 transition-colors duration-300 group flex flex-col gap-5">
        <%-- Icon --%>
        <div
          class="w-12 h-12 rounded-xl bg-purple-900/60 flex items-center justify-center"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="w-6 h-6 text-purple-400"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            stroke-width="2"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944
                                 a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591
                                 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622
                                 0-1.042-.133-2.052-.382-3.016z"
            />
          </svg>
        </div>

        <%-- Text --%>
        <div class="flex flex-col gap-2 flex-1">
          <h3 class="text-lg font-bold text-white">Admin</h3>
          <p class="text-sm text-gray-400 leading-relaxed">
            Approve repairers, manage categories, view platform analytics and
            system reports.
          </p>
        </div>

        <%-- CTA --%>
        <div class="flex items-center justify-between mt-auto">
          <a
            href="${pageContext.request.contextPath}/login"
            id="portal-cta-admin"
            class="text-xs font-bold text-purple-400 bg-purple-900/50 border border-purple-800 px-3 py-1.5 rounded-lg hover:bg-purple-800 transition-colors duration-200 uppercase tracking-wide"
          >
            Admin Dashboard
          </a>
          <div
            class="w-8 h-8 rounded-full bg-gray-700 group-hover:bg-purple-600 flex items-center justify-center transition-colors duration-300"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="w-4 h-4 text-gray-300"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M17 8l4 4m0 0l-4 4m4-4H3"
              />
            </svg>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
