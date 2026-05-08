<%-- ============================================================
     Component: Tech Stack
     Description: "Built with proven technologies" - Tools used section.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section class="py-24 px-4 sm:px-6 lg:px-8 bg-gray-50/50">
    <div class="max-w-7xl mx-auto">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-black text-gray-900 leading-tight">
                Built with proven <span class="text-green-600">technologies.</span>
            </h2>
        </div>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
            
            <%-- Java Servlets --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-green-600">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm0 18.5c-3.59 0-6.5-2.91-6.5-6.5s2.91-6.5 6.5-6.5 6.5 2.91 6.5 6.5-2.91 6.5-6.5 6.5z"/></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">Java Servlets</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Core Logic</p>
            </div>

            <%-- JSP --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-blue-600">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M4 7h16M4 12h16M4 17h16" /></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">JSP</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Template Engine</p>
            </div>

            <%-- MySQL --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-blue-800">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10 4.477-10 10-10zm0 2a8 8 0 100 16 8 8 0 000-16z"/></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">MySQL</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Database</p>
            </div>

            <%-- Tomcat --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-orange-600">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2L2 12l10 10 10-10L12 2z"/></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">Apache Tomcat</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Web Server</p>
            </div>

            <%-- HTML/CSS --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-pink-600">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" /></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">HTML & CSS</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Layout & Style</p>
            </div>

            <%-- JavaScript --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-yellow-500">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2c5.523 0 10 4.477 10 10s-4.477 10-10 10-10-4.477-10-10 4.477-10 10-10zm0 2a8 8 0 100 16 8 8 0 000-16z"/></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">JavaScript</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Client Side</p>
            </div>

            <%-- Tailwind --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-cyan-500">
                    <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2C6.477 2 2 6.477 2 12s4.477 10 10 10 10-4.477 10-10S17.523 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z"/></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">Tailwind CSS</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Styling Framework</p>
            </div>

            <%-- JDBC --%>
            <div class="bg-white border border-gray-100 p-6 rounded-3xl flex flex-col items-center text-center group hover:border-green-500 transition-colors">
                <div class="w-12 h-12 bg-gray-50 rounded-2xl flex items-center justify-center mb-4 text-red-600">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2"><path d="M4 7v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2H6c-1.1 0-2 .9-2 2z" /></svg>
                </div>
                <h4 class="text-sm font-black text-gray-900">JDBC</h4>
                <p class="text-[10px] text-gray-400 font-bold uppercase tracking-wider mt-1">Data Bridge</p>
            </div>

        </div>
    </div>
</section>
