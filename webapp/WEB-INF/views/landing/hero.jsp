<%-- ============================================================
     Component: Hero Section
     Description: Main hero with headline, sub-text, CTA buttons,
                  and a live repair-card preview on the right.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="pt-28 pb-16 px-4 sm:px-6 lg:px-8 bg-white">
    <div class="max-w-6xl mx-auto">
        <div class="flex flex-col lg:flex-row items-center gap-12 lg:gap-16">

            <%-- ---- Left: Text Content ---- --%>
            <div class="flex-1 text-center lg:text-left">

                <%-- Badge --%>
                <div class="inline-flex items-center gap-2 mb-6 px-3 py-1.5 rounded-full
                            bg-green-50 border border-green-200">
                    <span class="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse"></span>
                    <span class="text-xs font-semibold text-green-700 tracking-wide uppercase">
                        Academic Project &bull; Full Stack Java
                    </span>
                </div>

                <%-- Headline --%>
                <h1 class="text-5xl sm:text-6xl font-extrabold leading-tight text-gray-900 mb-6">
                    Fix it.<br>
                    Don't <span class="text-red-500">toss</span> it.<br>
                    <span class="text-green-600">NearFix.</span>
                </h1>

                <%-- Sub-text --%>
                <p class="text-base sm:text-lg text-gray-500 leading-relaxed mb-8 max-w-md mx-auto lg:mx-0">
                    Connect with skilled local repairers &mdash; cobblers, tailors, phone
                    technicians, and more. Post a request, track your repair, and save
                    something from landfill.
                </p>

                <%-- CTA Buttons --%>
                <div class="flex flex-col sm:flex-row items-center gap-3 justify-center lg:justify-start">
                    <a href="${pageContext.request.contextPath}/register"
                       id="hero-cta-register"
                       class="nf-btn-dark w-full sm:w-auto inline-flex items-center justify-center gap-2
                              px-6 py-3 text-white text-sm font-semibold rounded-xl transition-colors duration-200 shadow-sm">
                        Post your first repair
                    </a>
                    <a href="${pageContext.request.contextPath}/register?role=repairer"
                       id="hero-cta-repairer"
                       class="w-full sm:w-auto inline-flex items-center justify-center gap-2
                              px-6 py-3 text-gray-700 text-sm font-semibold
                              hover:text-green-700 transition-colors duration-200">
                        I'm a Repairer
                        <%-- Arrow icon --%>
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none"
                             viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17 8l4 4m0 0l-4 4m4-4H3"/>
                        </svg>
                    </a>
                </div>

                <%-- Social Proof: items saved so far --%>
                <div class="mt-10 flex items-center gap-4 justify-center lg:justify-start flex-wrap">
                    <%-- Small avatar stack placeholder --%>
                    <div class="flex -space-x-2">
                        <div class="w-8 h-8 rounded-full bg-green-200 border-2 border-white
                                    flex items-center justify-center text-xs font-bold text-green-800">A</div>
                        <div class="w-8 h-8 rounded-full bg-blue-200 border-2 border-white
                                    flex items-center justify-center text-xs font-bold text-blue-800">R</div>
                        <div class="w-8 h-8 rounded-full bg-yellow-200 border-2 border-white
                                    flex items-center justify-center text-xs font-bold text-yellow-800">T</div>
                        <div class="w-8 h-8 rounded-full bg-pink-200 border-2 border-white
                                    flex items-center justify-center text-xs font-bold text-pink-800">+</div>
                    </div>
                    <p class="text-sm text-gray-500">
                        <span class="font-bold text-gray-900">${itemsSaved}</span>
                        items saved from landfill so far
                    </p>
                </div>

            </div>

            <%-- ---- Right: Repair Card Preview ---- --%>
            <div class="flex-1 w-full max-w-sm lg:max-w-md">
                <div class="nf-card-float bg-green-700 rounded-2xl p-5 shadow-2xl text-white">

                    <%-- Card header --%>
                    <div class="flex items-start justify-between mb-4">
                        <div>
                            <p class="text-xs font-semibold text-green-200 uppercase tracking-wide mb-1">
                                Req #1042 &bull; Electronics &bull; Assigned to Suresh Kumar
                            </p>
                            <h3 class="text-lg font-bold">iPhone 13 Screen Crack</h3>
                        </div>
                        <%-- Star rating badge --%>
                        <div class="text-right">
                            <div class="flex items-center gap-1 justify-end">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-yellow-400"
                                     fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77
                                             l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                                </svg>
                                <span class="text-sm font-bold">4.9</span>
                            </div>
                            <p class="text-xs text-green-200">Suresh Kumar</p>
                        </div>
                    </div>

                    <%-- Status Track: 4 steps --%>
                    <div class="mb-5">
                        <p class="text-xs text-green-200 font-semibold uppercase tracking-wide mb-3">
                            Repair Status
                        </p>
                        <div class="flex items-center gap-1">

                            <%-- Step 1: Pending (done) --%>
                            <div class="flex flex-col items-center flex-1">
                                <div class="w-7 h-7 rounded-full bg-white flex items-center justify-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-green-700"
                                         fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                                    </svg>
                                </div>
                                <span class="text-xs text-green-200 mt-1">Pending</span>
                            </div>
                            <div class="flex-1 h-0.5 bg-white/60 mb-4"></div>

                            <%-- Step 2: Accepted (done) --%>
                            <div class="flex flex-col items-center flex-1">
                                <div class="w-7 h-7 rounded-full bg-white flex items-center justify-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-green-700"
                                         fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/>
                                    </svg>
                                </div>
                                <span class="text-xs text-green-200 mt-1">Accepted</span>
                            </div>
                            <div class="flex-1 h-0.5 bg-white/60 mb-4"></div>

                            <%-- Step 3: In Progress (current) --%>
                            <div class="flex flex-col items-center flex-1">
                                <div class="w-7 h-7 rounded-full bg-white/30 border-2 border-white
                                            flex items-center justify-center">
                                    <div class="w-2.5 h-2.5 rounded-full bg-white animate-pulse"></div>
                                </div>
                                <span class="text-xs text-white font-semibold mt-1">In Progress</span>
                            </div>
                            <div class="flex-1 h-0.5 bg-white/20 mb-4"></div>

                            <%-- Step 4: Done (upcoming) --%>
                            <div class="flex flex-col items-center flex-1">
                                <div class="w-7 h-7 rounded-full bg-white/20 border-2 border-white/40
                                            flex items-center justify-center">
                                    <span class="text-xs text-white/60 font-bold">4</span>
                                </div>
                                <span class="text-xs text-green-300 mt-1">Done</span>
                            </div>

                        </div>
                    </div>

                    <%-- Open jobs nearby (white card) --%>
                    <div class="bg-white rounded-xl p-4">
                        <p class="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-3">
                            Open Jobs Nearby
                        </p>

                        <%-- Job row 1 --%>
                        <div class="flex items-center justify-between py-2 border-b border-gray-100">
                            <div class="flex items-center gap-3">
                                <div class="w-7 h-7 rounded-lg bg-blue-100 flex items-center justify-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-blue-600"
                                         fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <rect x="5" y="2" width="14" height="20" rx="2" ry="2"/>
                                        <line x1="12" y1="18" x2="12.01" y2="18"/>
                                    </svg>
                                </div>
                                <span class="text-xs font-medium text-gray-800">Samsung Galaxy S22</span>
                            </div>
                            <span class="text-xs font-semibold text-yellow-600 bg-yellow-50
                                         px-2 py-0.5 rounded-full">Pending</span>
                        </div>

                        <%-- Job row 2 --%>
                        <div class="flex items-center justify-between py-2 border-b border-gray-100">
                            <div class="flex items-center gap-3">
                                <div class="w-7 h-7 rounded-lg bg-pink-100 flex items-center justify-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-pink-600"
                                         fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                              d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06
                                                 a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23
                                                 l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                    </svg>
                                </div>
                                <span class="text-xs font-medium text-gray-800">Nike shoe sole repair</span>
                            </div>
                            <span class="text-xs font-semibold text-green-600 bg-green-50
                                         px-2 py-0.5 rounded-full">New</span>
                        </div>

                        <%-- Items fixed counter --%>
                        <div class="flex items-center gap-2 mt-3">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-green-500"
                                 fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
                            </svg>
                            <p class="text-xs text-gray-600">
                                <span class="font-bold text-gray-900">${itemsSaved}</span>
                                items fixed
                                <span class="text-green-600 font-medium">and counting</span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
