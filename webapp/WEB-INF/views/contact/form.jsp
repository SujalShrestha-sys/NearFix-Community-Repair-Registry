<%-- ============================================================
     Component: Contact Form
     Description: The main contact form with validation and success state.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    boolean formSubmitted = request.getAttribute("formSubmitted") != null && (boolean)request.getAttribute("formSubmitted");
%>

<div id="form-container" class="lg:pr-12">
    
    <% if (formSubmitted) { %>
        <%-- SUCCESS STATE --%>
        <div class="bg-green-50 border border-green-200 rounded-3xl p-12 text-center flex flex-col items-center justify-center min-h-[400px]">
            <div class="w-20 h-20 bg-green-500 text-white rounded-full flex items-center justify-center mb-6 shadow-xl shadow-green-500/20">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-10 h-10" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            <h2 class="text-3xl font-black text-gray-900 mb-4">Message sent!</h2>
            <p class="text-gray-600 max-w-sm mb-8">
                Thank you for reaching out. Our team has received your message and we'll get back to you within one business day.
            </p>
            <a href="${pageContext.request.contextPath}/contact" 
               class="nf-btn-dark px-8 py-3 text-white text-sm font-bold rounded-xl shadow-lg">
                Send another message
            </a>
        </div>
    <% } else { %>
        <%-- FORM STATE --%>
        <h2 class="text-4xl font-black text-gray-900 mb-4">Send us a message</h2>
        <p class="text-gray-500 mb-10">We read every message and respond within one business day.</p>

        <form action="${pageContext.request.contextPath}/contact" method="POST" class="grid grid-cols-1 sm:grid-cols-2 gap-6">
            
            <%-- First Name --%>
            <div class="flex flex-col gap-2">
                <label for="firstName" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">First Name *</label>
                <input type="text" id="firstName" name="firstName" required placeholder="Anita"
                       class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
            </div>

            <%-- Last Name --%>
            <div class="flex flex-col gap-2">
                <label for="lastName" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">Last Name *</label>
                <input type="text" id="lastName" name="lastName" required placeholder="Sharma"
                       class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
            </div>

            <%-- Email Address --%>
            <div class="flex flex-col gap-2 sm:col-span-2">
                <label for="email" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">Email Address *</label>
                <input type="email" id="email" name="email" required placeholder="anita@email.com"
                       class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
            </div>

            <%-- Phone --%>
            <div class="flex flex-col gap-2 sm:col-span-2">
                <label for="phone" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">Phone (optional)</label>
                <input type="text" id="phone" name="phone" placeholder="+977 98..."
                       class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
            </div>

            <%-- I am a... --%>
            <div class="flex flex-col gap-2 sm:col-span-2">
                <label for="role" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">I am a...</label>
                <div class="relative">
                    <select id="role" name="role"
                            class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 appearance-none focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
                        <option value="user">Academic / Evaluator</option>
                        <option value="user">Regular User</option>
                        <option value="repairer">Repairer</option>
                    </select>
                    <div class="absolute inset-y-0 right-0 flex items-center px-4 pointer-events-none text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                        </svg>
                    </div>
                </div>
            </div>

            <%-- Subject --%>
            <div class="flex flex-col gap-2 sm:col-span-2">
                <label for="subject" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">Subject *</label>
                <div class="relative">
                    <select id="subject" name="subject" required
                            class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 appearance-none focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200">
                        <option value="" disabled selected>-- Select a topic --</option>
                        <option value="General Inquiry">General Inquiry</option>
                        <option value="Technical Support">Technical Support</option>
                        <option value="Partnership">Partnership</option>
                        <option value="Feedback">Feedback</option>
                    </select>
                    <div class="absolute inset-y-0 right-0 flex items-center px-4 pointer-events-none text-gray-400">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                        </svg>
                    </div>
                </div>
            </div>

            <%-- Message --%>
            <div class="flex flex-col gap-2 sm:col-span-2">
                <label for="message" class="text-xs font-bold text-gray-700 uppercase tracking-widest ml-1">Message *</label>
                <textarea id="message" name="message" required rows="5" placeholder="Tell us what's on your mind..."
                          class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3 text-gray-900 focus:outline-none focus:ring-2 focus:ring-green-500/20 focus:border-green-500 transition-all duration-200 resize-none"></textarea>
            </div>

            <%-- Footer Note --%>
            <div class="sm:col-span-2 flex items-center gap-3 bg-gray-50 border border-gray-100 p-4 rounded-xl">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-yellow-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
                <p class="text-[11px] text-gray-500 leading-tight">
                    Your message is private and will only be seen by the NearFix team.
                </p>
            </div>

            <%-- Submit Button --%>
            <div class="sm:col-span-2 mt-2">
                <button type="submit" class="nf-btn-dark w-full py-4 text-white font-bold rounded-xl flex items-center justify-center gap-2 group">
                    Send Message
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 group-hover:translate-x-1 transition-transform duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2.5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                    </svg>
                </button>
            </div>

        </form>
    <% } %>

</div>
