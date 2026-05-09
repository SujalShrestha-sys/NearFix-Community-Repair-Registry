<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- IMPACT HERO CARD -->
<div class="relative overflow-hidden bg-[#0B7A53] rounded-[24px] p-8 md:p-10 mb-8 text-white shadow-lg shadow-primary/10">
    <div class="relative z-10 flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div>
            <div class="flex items-center gap-2 mb-2">
                <span class="text-[48px] md:text-[56px] font-extrabold leading-tight tracking-[-2px]">${platformTotalSaved}</span>
            </div>
            <p class="text-lg md:text-xl font-medium text-white/90 mb-1">Items saved from landfill so far 🌿</p>
            <p class="text-sm text-white/70 max-w-[400px]">Every repair you post contributes to this number. Keep fixing, keep saving.</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/user/post-request" class="inline-flex items-center gap-2 bg-white/10 hover:bg-white/20 backdrop-blur-md border border-white/20 text-white px-6 py-3 rounded-xl font-bold transition-all no-underline group">
                Post a repair
                <svg class="w-5 h-5 transform group-hover:translate-x-1 transition-transform" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
            </a>
        </div>
    </div>
    
    <!-- Abstract background decorations -->
    <div class="absolute -top-24 -right-24 w-64 h-64 bg-white/5 rounded-full blur-3xl"></div>
    <div class="absolute -bottom-32 -left-32 w-80 h-80 bg-black/5 rounded-full blur-3xl"></div>
</div>
