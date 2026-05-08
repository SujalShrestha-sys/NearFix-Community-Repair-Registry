<%-- ============================================================
     Component: FAQ & Sidebar
     Description: FAQ section with accordion logic and location/social info.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="lg:pl-12 flex flex-col gap-10">
    
    <%-- ---- Location Card ---- --%>
    <div class="bg-green-50/50 border border-green-100 rounded-3xl p-8 flex flex-col items-center text-center group">
        <div class="w-12 h-12 bg-white rounded-2xl shadow-sm flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                <circle cx="12" cy="10" r="3"></circle>
            </svg>
        </div>
        <h3 class="text-sm font-black text-green-800 uppercase tracking-widest mb-2">Dharan, Koshi Province, Nepal</h3>
        <p class="text-sm text-gray-500 leading-relaxed">
            The NearFix project was built and is based in Dharan &mdash; a city 
            that perfectly illustrates why this platform matters. Skilled 
            repairers are everywhere here. Now they're findable.
        </p>
    </div>

    <%-- ---- FAQ Section ---- --%>
    <div>
        <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-6">Frequently asked questions</h3>
        
        <div class="flex flex-col gap-3">
            
            <%-- FAQ Item 1 --%>
            <div class="faq-item group">
                <button class="faq-trigger w-full bg-gray-50 border border-gray-100 px-6 py-4 rounded-xl flex items-center justify-between hover:bg-white hover:border-gray-200 hover:shadow-sm transition-all duration-200">
                    <span class="text-sm font-bold text-gray-700 text-left">Is NearFix free to use?</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-400 group-hover:text-gray-900 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
                <div class="faq-content hidden px-6 py-4">
                    <p class="text-sm text-gray-500 leading-relaxed">
                        Yes, posting repair requests and browsing repairers is completely free for academic evaluators and regular users.
                    </p>
                </div>
            </div>

            <%-- FAQ Item 2 --%>
            <div class="faq-item group">
                <button class="faq-trigger w-full bg-gray-50 border border-gray-100 px-6 py-4 rounded-xl flex items-center justify-between hover:bg-white hover:border-gray-200 hover:shadow-sm transition-all duration-200">
                    <span class="text-sm font-bold text-gray-700 text-left">How do repairers get approved?</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-400 group-hover:text-gray-900 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
                <div class="faq-content hidden px-6 py-4">
                    <p class="text-sm text-gray-500 leading-relaxed">
                        Administrators manually review each repairer's profile, credentials, and business information before granting approval to join the platform.
                    </p>
                </div>
            </div>

            <%-- FAQ Item 3 --%>
            <div class="faq-item group">
                <button class="faq-trigger w-full bg-gray-50 border border-gray-100 px-6 py-4 rounded-xl flex items-center justify-between hover:bg-white hover:border-gray-200 hover:shadow-sm transition-all duration-200">
                    <span class="text-sm font-bold text-gray-700 text-left">Can I edit or delete my repair request?</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-400 group-hover:text-gray-900 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
                <div class="faq-content hidden px-6 py-4">
                    <p class="text-sm text-gray-500 leading-relaxed">
                        You can edit or cancel a request as long as it hasn't been "Accepted" by a repairer yet. Once accepted, you'll need to contact the repairer.
                    </p>
                </div>
            </div>

            <%-- FAQ Item 4 --%>
            <div class="faq-item group">
                <button class="faq-trigger w-full bg-gray-50 border border-gray-100 px-6 py-4 rounded-xl flex items-center justify-between hover:bg-white hover:border-gray-200 hover:shadow-sm transition-all duration-200">
                    <span class="text-sm font-bold text-gray-700 text-left">This is an academic project &mdash; is it real?</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-400 group-hover:text-gray-900 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
                <div class="faq-content hidden px-6 py-4">
                    <p class="text-sm text-gray-500 leading-relaxed">
                        It's a fully functional full-stack prototype built for evaluation. While the repairers listed may be simulated, the logic and platform architecture are production-ready.
                    </p>
                </div>
            </div>

            <%-- FAQ Item 5 --%>
            <div class="faq-item group">
                <button class="faq-trigger w-full bg-gray-50 border border-gray-100 px-6 py-4 rounded-xl flex items-center justify-between hover:bg-white hover:border-gray-200 hover:shadow-sm transition-all duration-200">
                    <span class="text-sm font-bold text-gray-700 text-left">Who built NearFix?</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-gray-400 group-hover:text-gray-900 transition-transform duration-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                    </svg>
                </button>
                <div class="faq-content hidden px-6 py-4">
                    <p class="text-sm text-gray-500 leading-relaxed">
                        NearFix was developed by a team of passionate CS students in Biratnagar, focusing on creating sustainable local solutions using Java MVC architecture.
                    </p>
                </div>
            </div>

        </div>
    </div>

    <%-- ---- Social Links ---- --%>
    <div>
        <h3 class="text-xs font-bold text-gray-400 uppercase tracking-widest mb-6">Also find us on</h3>
        <div class="flex flex-col gap-3">
            
            <%-- LinkedIn --%>
            <a href="#" class="flex items-center gap-4 bg-white border border-gray-100 p-4 rounded-xl hover:border-blue-200 hover:shadow-sm transition-all duration-200 group">
                <div class="w-10 h-10 bg-blue-50 text-blue-600 rounded-lg flex items-center justify-center group-hover:bg-blue-600 group-hover:text-white transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
                    </svg>
                </div>
                <span class="text-sm font-bold text-gray-700">LinkedIn &ndash; NearFix Project</span>
            </a>

            <%-- GitHub --%>
            <a href="#" class="flex items-center gap-4 bg-white border border-gray-100 p-4 rounded-xl hover:border-gray-200 hover:shadow-sm transition-all duration-200 group">
                <div class="w-10 h-10 bg-gray-50 text-gray-900 rounded-lg flex items-center justify-center group-hover:bg-gray-900 group-hover:text-white transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"/>
                    </svg>
                </div>
                <span class="text-sm font-bold text-gray-700">GitHub &ndash; github.com/nearfix</span>
            </a>

            <%-- About Team --%>
            <a href="${pageContext.request.contextPath}/about" class="flex items-center gap-4 bg-white border border-gray-100 p-4 rounded-xl hover:border-purple-200 hover:shadow-sm transition-all duration-200 group">
                <div class="w-10 h-10 bg-purple-50 text-purple-600 rounded-lg flex items-center justify-center group-hover:bg-purple-600 group-hover:text-white transition-colors duration-300">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                </div>
                <span class="text-sm font-bold text-gray-700">Meet the team &rarr; About Us</span>
            </a>

        </div>
    </div>

</div>

<%-- FAQ Accordion Logic --%>
<script>
    (function() {
        const triggers = document.querySelectorAll('.faq-trigger');
        
        triggers.forEach(trigger => {
            trigger.addEventListener('click', () => {
                const content = trigger.nextElementSibling;
                const icon = trigger.querySelector('svg');
                const isOpen = !content.classList.contains('hidden');
                
                // Close all others
                document.querySelectorAll('.faq-content').forEach(c => c.classList.add('hidden'));
                document.querySelectorAll('.faq-trigger svg').forEach(i => i.style.transform = 'rotate(0deg)');
                
                if (!isOpen) {
                    content.classList.remove('hidden');
                    icon.style.transform = 'rotate(45deg)';
                }
            });
        });
    })();
</script>
