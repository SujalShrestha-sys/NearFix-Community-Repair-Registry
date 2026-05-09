<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="hidden lg:block">
    <div class="sticky top-6">
        <h3 class="text-sm font-bold text-muted-dark uppercase tracking-widest mb-4 ml-2">Request Preview</h3>
        <div class="bg-white rounded-[28px] border border-border p-6 shadow-xl relative overflow-hidden group">
            <div class="absolute top-0 right-0 w-32 h-32 bg-primary/5 rounded-full -mr-16 -mt-16 group-hover:scale-150 transition-transform duration-700"></div>
            
            <div class="relative z-10">
                <div class="flex items-center gap-2 mb-4">
                    <span id="preview-category" class="px-3 py-1 bg-primary-light text-primary rounded-full text-[10px] font-bold uppercase tracking-wider">Category</span>
                    <span id="preview-urgency" class="px-3 py-1 bg-muted-light text-muted-dark rounded-full text-[10px] font-bold uppercase tracking-wider">Normal</span>
                </div>
                <h4 id="preview-name" class="text-xl font-bold text-dark mb-3">Item Name</h4>
                <p id="preview-desc" class="text-sm text-muted-dark line-clamp-3 mb-6 min-h-[60px]">The problem description will appear here as you type...</p>
                
                <div class="flex items-center gap-3 pt-6 border-t border-border">
                    <div class="w-10 h-10 bg-muted-light rounded-full flex items-center justify-center text-muted">
                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                    </div>
                    <div>
                        <span class="block text-xs font-bold text-dark">${user.name}</span>
                        <span class="block text-[10px] text-muted-dark">Posting now</span>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="tips.jsp" />
    </div>
</div>
