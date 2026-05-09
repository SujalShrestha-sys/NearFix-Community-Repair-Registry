<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="step-1" class="step-active">
    <h2 class="text-xl font-bold text-dark mb-6">What kind of item is it?</h2>
    <div class="grid grid-cols-2 sm:grid-cols-3 gap-4 mb-10">
        <c:forEach var="cat" items="${categories}">
            <label class="cursor-pointer group">
                <input type="radio" name="category" value="${cat.categoryId}" class="hidden" onchange="updateCategory('${cat.name}', this)">
                <div class="category-card h-full border border-border rounded-2xl p-5 flex flex-col items-center justify-center text-center gap-3 hover:border-primary/40 hover:bg-primary-hover transition-all group-active:scale-95">
                    <div class="w-12 h-12 bg-muted-light rounded-xl flex items-center justify-center text-dark group-hover:bg-primary-light group-hover:text-primary transition-colors">
                        <c:choose>
                            <c:when test="${cat.name.toLowerCase().contains('electronic')}">
                                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect><polyline points="17 2 12 7 7 2"></polyline></svg>
                            </c:when>
                            <c:when test="${cat.name.toLowerCase().contains('cloth')}">
                                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.62 1.96V21a2 2 0 002 2h16a2 2 0 002-2V5.42a2 2 0 00-1.62-1.96z"></path><path d="M12 2v21"></path></svg>
                            </c:when>
                            <c:otherwise>
                                <svg class="w-6 h-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path></svg>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <span class="text-sm font-bold text-dark">${cat.name}</span>
                </div>
            </label>
        </c:forEach>
    </div>
    <div class="flex justify-end">
        <button type="button" onclick="nextStep(2)" class="bg-primary text-white px-8 py-4 rounded-2xl font-bold text-sm shadow-lg shadow-primary/20 hover:bg-opacity-90 transition-all">Continue →</button>
    </div>
</div>
