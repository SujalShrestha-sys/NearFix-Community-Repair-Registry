<%-- ============================================================
     Component: About Impact
     Description: "Fix more. Waste less." text and stats cards.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="py-24 px-4 sm:px-6 lg:px-8 bg-white">
    <div class="max-w-7xl mx-auto">
        <div class="flex flex-col lg:flex-row gap-16 items-start">
            
            <%-- ---- Left Content ---- --%>
            <div class="flex-1">
                <p class="text-xs font-black text-green-600 uppercase tracking-widest mb-4">Our Vision</p>
                <h2 class="text-5xl font-black text-gray-900 leading-tight mb-8">
                    Fix more.<br>
                    Waste <span class="text-green-600 italic">less.</span>
                </h2>
                <div class="space-y-6 text-gray-500 text-lg leading-relaxed">
                    <p>
                        NearFix was born from a simple observation: local repairers are hidden in plain sight. 
                        By connecting them to a digital community, we don't just fix items &mdash; we fix communities.
                    </p>
                    <p>
                        We built a platform that scales with trust. Every repairer is verified, every review is digital, 
                        and every success is measured in tons of waste saved from landfills. This is more than code; 
                        it's a commitment to a circular economy.
                    </p>
                </div>
            </div>

            <%-- ---- Right Stats Cards ---- --%>
            <div class="flex-1 w-full flex flex-col gap-6">
                
                <%-- Card 1 --%>
                <div class="bg-gray-50 border border-gray-100 p-8 rounded-3xl group hover:border-green-500/30 transition-all duration-300 hover:shadow-xl hover:shadow-green-500/5">
                    <p class="text-4xl font-black text-gray-900 mb-1">8,240<span class="text-green-600">+</span></p>
                    <p class="text-sm font-bold text-gray-400 uppercase tracking-widest">Items saved from landfills</p>
                    <p class="text-xs text-gray-400 mt-2">Every item fixed stays out of the landfill.</p>
                </div>

                <%-- Card 2 --%>
                <div class="bg-gray-50 border border-gray-100 p-8 rounded-3xl group hover:border-blue-500/30 transition-all duration-300 hover:shadow-xl hover:shadow-blue-500/5">
                    <p class="text-4xl font-black text-gray-900 mb-1">1,200<span class="text-blue-600">+</span></p>
                    <p class="text-sm font-bold text-gray-400 uppercase tracking-widest">Verified local repairers</p>
                    <p class="text-xs text-gray-400 mt-2">Vetted professionals across 12 categories.</p>
                </div>

                <%-- Card 3 --%>
                <div class="bg-gray-50 border border-gray-100 p-8 rounded-3xl group hover:border-yellow-500/30 transition-all duration-300 hover:shadow-xl hover:shadow-yellow-500/5">
                    <p class="text-4xl font-black text-gray-900 mb-1">4.8<span class="text-yellow-600">/5</span></p>
                    <p class="text-sm font-bold text-gray-400 uppercase tracking-widest">Average user rating</p>
                    <p class="text-xs text-gray-400 mt-2">From 5,000+ verified customer reviews.</p>
                </div>

            </div>
        </div>
    </div>
</section>

<%-- Core Values Section --%>
<section class="py-24 px-4 sm:px-6 lg:px-8 bg-gray-900 text-white overflow-hidden relative">
    <div class="max-w-7xl mx-auto">
        <div class="text-center mb-20">
            <p class="text-xs font-black text-green-500 uppercase tracking-widest mb-4">The NearFix Way</p>
            <h2 class="text-4xl font-black mb-4">Built on three core values</h2>
            <p class="text-gray-400 max-w-xl mx-auto">Every line of code, every feature, and every decision is driven by our foundational pillars.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-12 relative">
            
            <%-- Value 1 --%>
            <div class="relative group">
                <span class="absolute -top-10 -left-6 text-8xl font-black text-white/5 group-hover:text-green-500/10 transition-colors duration-500">01</span>
                <div class="w-12 h-12 bg-green-500/20 rounded-xl flex items-center justify-center text-green-500 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-3">Sustainability First</h3>
                <p class="text-sm text-gray-400 leading-relaxed">
                    Every repair request on NearFix is a blow to the 'throw-away' culture. We prioritize the environment in every decision.
                </p>
            </div>

            <%-- Value 2 --%>
            <div class="relative group">
                <span class="absolute -top-10 -left-6 text-8xl font-black text-white/5 group-hover:text-yellow-500/10 transition-colors duration-500">02</span>
                <div class="w-12 h-12 bg-yellow-500/20 rounded-xl flex items-center justify-center text-yellow-500 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-3">Trust & Accountability</h3>
                <p class="text-sm text-gray-400 leading-relaxed">
                    Repairers are vetted, reviews are verified, and we maintain complete transparency in every transaction on the platform.
                </p>
            </div>

            <%-- Value 3 --%>
            <div class="relative group">
                <span class="absolute -top-10 -left-6 text-8xl font-black text-white/5 group-hover:text-blue-500/10 transition-colors duration-500">03</span>
                <div class="w-12 h-12 bg-blue-500/20 rounded-xl flex items-center justify-center text-blue-500 mb-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                        <path d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                </div>
                <h3 class="text-xl font-bold mb-3">Hyper-Local Focus</h3>
                <p class="text-sm text-gray-400 leading-relaxed">
                    We connect people within their own neighborhoods, keeping resources and support within the community they belong.
                </p>
            </div>

        </div>
    </div>
</section>
