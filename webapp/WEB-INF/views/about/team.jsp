<%-- ============================================================
     Component: About Team
     Description: "Six builders. One platform." - Stylized member cards.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="py-24 px-4 sm:px-6 lg:px-8 bg-white overflow-hidden">
    <div class="max-w-7xl mx-auto">
        <%-- Header Section --%>
        <div class="flex flex-col lg:flex-row gap-12 items-end mb-20">
            <div class="flex-1">
                <p class="text-xs font-black text-gray-400 uppercase tracking-widest mb-4">The Makers</p>
                <h2 class="text-5xl font-black text-gray-900 leading-tight">
                    Six builders.<br>
                    One <span class="text-green-600">platform.</span>
                </h2>
                <p class="mt-6 text-gray-500 text-lg max-w-xl">
                    Our team joined forces from different technical backgrounds to build a
                    unified, community-driven system &mdash; from database architecture to
                    seamless UI design.
                </p>
            </div>
            <%-- Quote --%>
            <div class="flex-1 bg-green-50/50 border border-green-100 p-8 rounded-3xl relative">
                <div class="absolute -top-4 -left-4 w-10 h-10 bg-green-600 rounded-full flex items-center justify-center text-white font-serif text-3xl">"</div>
                <p class="text-green-800 font-medium italic leading-relaxed">
                    "We didn't just build a software; we built something that could actually 
                    be used in the real world &mdash; something with purpose."
                </p>
                <p class="mt-4 text-xs font-bold text-green-700 uppercase tracking-widest">&mdash; NearFix Team Vision</p>
            </div>
        </div>

        <%-- Members Grid (2x3) --%>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            
            <%-- Member 1 (M1) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(34,197,94,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/sujal.png"
                         alt="Sujal Shrestha" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M1</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Sujal Shrestha</h3>
                        <p class="text-xs font-bold text-emerald-500 uppercase tracking-widest mb-4">Lead Architect</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                            Designed the core system architecture and managed overall project synchronization. <br>
                            Scrum Master and Project Lead for Testing and System integration.
                        </p>
                    </div>
                </div>
            </div>

            <%-- Member 2 (M2) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(59,130,246,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/Dipen.jpg"
                         alt="Dipen Limbu" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M2</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Dipen Limbu</h3>
                        <p class="text-xs font-bold text-blue-500 uppercase tracking-widest mb-4">Database Expert</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                            Designed the database schema and managed data integrity across entities.
                        </p>
                    </div>
                </div>
            </div>

            <%-- Member 3 (M3) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(249,115,22,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/ayush.jpg"
                         alt="Ayush Dangal" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M3</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Ayush Dangal</h3>
                        <p class="text-xs font-bold text-orange-500 uppercase tracking-widest mb-4">Logic Dev</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                            Built complex service layers and ensured smooth JDBC/SQL performance.
                        </p>
                    </div>
                </div>
            </div>

            <%-- Member 4 (M4) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(168,85,247,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/rishikesh.jpeg" 
                         alt="Rishikesh Prasai" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M4</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Rishikesh Prasai</h3>
                        <p class="text-xs font-bold text-purple-500 uppercase tracking-widest mb-4">UI/UX Lead</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                            Crafted the design system and developed the entire responsive frontend with Tailwind.
                        </p>
                    </div>
                </div>
            </div>

            <%-- Member 5 (M5) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(202,138,4,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/ganga.jpg"
                         alt="Ganga Bajgain" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M5</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Ganga Bajgain</h3>
                        <p class="text-xs font-bold text-yellow-600 uppercase tracking-widest mb-4">QA Specialist</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                            Testing assistance and Admin UI Architect.
                        </p>
                    </div>
                </div>
            </div>

            <%-- Member 6 (M6) --%>
            <div class="group relative bg-gray-900 rounded-[3rem] overflow-hidden transition-all duration-700 hover:shadow-[0_20px_50px_rgba(236,72,153,0.3)] hover:-translate-y-4">
                <div class="aspect-[3/4] overflow-hidden relative">
                    <img src="${pageContext.request.contextPath}/assets/images/team/pranisha.jpg"
                         alt="Pranisha Gautam" 
                         class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-700">
                    <div class="absolute inset-0 bg-gradient-to-t from-gray-950 via-transparent to-transparent opacity-50 group-hover:opacity-30 transition-opacity duration-500"></div>
                    <div class="absolute top-6 right-6 w-12 h-12 bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl flex items-center justify-center text-white font-black text-sm">M6</div>
                </div>
                <div class="absolute bottom-0 left-0 right-0 p-6">
                    <div class="bg-gray-900/60 backdrop-blur-2xl border border-white/10 p-6 rounded-[2rem] transform translate-y-2 group-hover:translate-y-0 transition-transform duration-500">
                        <h3 class="text-2xl font-black text-white mb-1">Pranisha Gautam</h3>
                        <p class="text-xs font-bold text-pink-500 uppercase tracking-widest mb-4">PM & Docs Organizer</p>
                        <p class="text-xs text-gray-400 leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-500 delay-100">
                          System Testing, Repairer UI/UX designer and Document Organizer.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
