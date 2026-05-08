<%-- ============================================================
     Component: About Hero
     Description: Dark theme hero with "We built NearFix together"
                  and student member tags.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="pt-32 pb-24 px-4 sm:px-6 lg:px-8 bg-gray-900 relative overflow-hidden">
    <%-- Background Grid Effect --%>
    <div class="absolute inset-0 opacity-10 bg-[url('https://www.transparenttextures.com/patterns/carbon-fibre.png')]"></div>
    <div class="absolute top-0 right-0 w-96 h-96 bg-green-500/10 rounded-full blur-3xl"></div>

    <div class="max-w-7xl mx-auto relative z-10">
        <div class="flex flex-col lg:flex-row gap-20 items-center">
            
            <%-- ---- Left Content ---- --%>
            <div class="lg:w-7/12">
                <%-- Badge --%>
                <div class="inline-flex items-center gap-2 mb-8 px-3 py-1.5 rounded-full
                            bg-green-900/50 border border-green-800/50">
                    <span class="text-[10px] font-black text-green-400 uppercase tracking-widest">Academic Project 2024</span>
                </div>

                <h1 class="text-6xl sm:text-7xl lg:text-8xl font-black text-white leading-[0.9] mb-10">
                    We built<br>
                    <span class="text-green-500">NearFix</span><br>
                    together.
                </h1>

                <p class="text-lg text-gray-400 leading-relaxed max-w-xl mb-12">
                    Six students. One vision. A platform that turns broken things into 
                    fixed things &mdash; and local repairers into the heroes of their 
                    own communities.
                </p>

                <%-- Member Tags --%>
                <div class="flex flex-wrap gap-3 max-w-2xl mb-12">
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Sujal Shrestha</span>
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Dipen Limbu</span>
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Ayush Dangal</span>
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Rishikesh Prasai</span>
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Ganga Bajgain</span>
                    <span class="px-4 py-2 bg-gray-800 border border-gray-700 rounded-full text-xs font-bold text-gray-300">Pranisha Gautam</span>
                </div>
                
                <div class="w-20 h-1 bg-green-500 rounded-full"></div>
            </div>

            <%-- ---- Right: Creative System Visualizer ---- --%>
            <div class="lg:w-5/12 w-full relative h-[500px] flex items-center justify-center">
                
                <%-- Core Hub (Wrench & Gear) --%>
                <div class="relative z-10 w-64 h-64 bg-gray-800/40 backdrop-blur-2xl border border-white/10 rounded-[3rem] shadow-2xl flex items-center justify-center animate-float">
                    <div class="absolute inset-0 bg-green-500/20 rounded-[3rem] blur-3xl opacity-50"></div>
                    
                    <%-- Rotating Gear Background --%>
                    <div class="absolute inset-0 flex items-center justify-center opacity-20 animate-[spin_20s_linear_infinite]">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-48 h-48 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="0.5">
                            <path d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                            <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                    </div>

                    <%-- Floating Wrench --%>
                    <div class="relative z-20 text-green-500 filter drop-shadow-[0_0_15px_rgba(34,197,94,0.5)]">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-32 h-32" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                            <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z" />
                        </svg>
                    </div>
                </div>

                <%-- Floating Code Snippets --%>
                
                <%-- Snippet 1 --%>
                <div class="absolute top-10 right-0 bg-gray-800/60 backdrop-blur-md border border-white/10 p-4 rounded-2xl shadow-2xl animate-float" style="animation-delay: -1s;">
                    <div class="flex gap-2 mb-2">
                        <div class="w-2 h-2 rounded-full bg-red-500"></div>
                        <div class="w-2 h-2 rounded-full bg-yellow-500"></div>
                        <div class="w-2 h-2 rounded-full bg-green-500"></div>
                    </div>
                    <code class="text-[10px] font-mono text-green-400">
                        RepairRequest req = <span class="text-blue-400">new</span> RepairRequest();<br>
                        req.setStatus(<span class="text-yellow-400">"PENDING"</span>);
                    </code>
                </div>

                <%-- Snippet 2 --%>
                <div class="absolute bottom-10 -left-10 bg-gray-800/60 backdrop-blur-md border border-white/10 p-4 rounded-2xl shadow-2xl animate-float" style="animation-delay: -3s;">
                    <code class="text-[10px] font-mono text-blue-300">
                        SELECT * FROM users <br>
                        WHERE role = <span class="text-green-400">'REPAIRER'</span>;
                    </code>
                </div>

                <%-- Connecting Nodes --%>
                <div class="absolute top-1/2 -right-10 w-4 h-4 bg-green-500 rounded-full animate-ping"></div>
                <div class="absolute bottom-1/4 left-1/4 w-2 h-2 bg-blue-500 rounded-full animate-pulse"></div>

                <%-- Geometric Accents --%>
                <div class="absolute -z-10 w-[120%] h-[120%] border border-white/5 rounded-full rotate-45 scale-110"></div>
            </div>

        </div>
    </div>
</section>
