<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- RATE REPAIRER -->
<div class="bg-white rounded-2xl border border-border p-6 shadow-sm flex flex-col h-full">
    <h3 class="text-[17px] font-bold text-dark mb-5">Rate Your Repairer</h3>

    <c:choose>
        <c:when test="${not empty lastCompleted}">
            <form action="${pageContext.request.contextPath}/user/rate" method="POST" class="flex flex-col h-full">
                <input type="hidden" name="requestId" value="${lastCompleted.requestId}">
                <div class="bg-background rounded-2xl p-5 mb-6 border border-border-extra-light">
                    <div class="flex items-center gap-4 mb-4">
                        <div class="w-12 h-12 bg-primary-light rounded-xl flex items-center justify-center text-primary font-bold text-lg uppercase">
                            ${lastCompleted.repairerName.substring(0, 2)}
                        </div>
                        <div>
                            <h4 class="text-sm font-bold text-dark">${lastCompleted.repairerName}</h4>
                            <p class="text-[11px] text-muted-dark">${lastCompleted.categoryName} · Req #${lastCompleted.requestId} · Completed</p>
                        </div>
                    </div>

                    <div class="flex gap-1 mb-5">
                        <input type="hidden" name="rating" id="rating-value" value="5">
                        <c:forEach var="i" begin="1" end="5">
                            <button type="button" class="rating-star w-8 h-8 text-yellow transition-colors" data-index="${i}">
                                <svg class="w-full h-full" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="1"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            </button>
                        </c:forEach>
                    </div>

                    <div class="relative">
                        <textarea name="comment" class="w-full bg-white border border-border rounded-xl px-4 py-3 text-[13px] outline-none focus:border-primary transition-colors min-h-[100px] resize-none placeholder:text-muted" placeholder="Optional comment..."></textarea>
                    </div>
                </div>

                <button type="submit" class="w-full bg-primary text-white py-4 rounded-xl font-bold text-sm hover:bg-opacity-90 transition-all shadow-md shadow-primary/20 mt-auto">
                    Submit Rating
                </button>
            </form>
            <script>
                document.querySelectorAll('.rating-star').forEach(star => {
                    star.addEventListener('click', function() {
                        const val = this.getAttribute('data-index');
                        setRating(val);
                    });
                });

                function setRating(val) {
                    document.getElementById('rating-value').value = val;
                    const stars = document.querySelectorAll('.rating-star');
                    stars.forEach((star, index) => {
                        if (index < val) {
                            star.classList.remove('text-muted');
                            star.classList.add('text-yellow');
                        } else {
                            star.classList.remove('text-yellow');
                            star.classList.add('text-muted');
                        }
                    });
                }
            </script>
        </c:when>
        <c:otherwise>
            <div class="flex-1 flex flex-col items-center justify-center text-center py-10 px-4 border border-dashed border-border rounded-2xl">
                <div class="w-12 h-12 bg-muted-light rounded-full flex items-center justify-center mb-3">
                    <svg class="w-6 h-6 text-muted" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 20h.01"></path><path d="M12 16v.01"></path><path d="M12 12v.01"></path><path d="M12 8v.01"></path><path d="M12 4v.01"></path></svg>
                </div>
                <h4 class="text-sm font-bold text-dark">No repairs to rate</h4>
                <p class="text-xs text-muted-dark">Completed repairs will appear here for your feedback.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
