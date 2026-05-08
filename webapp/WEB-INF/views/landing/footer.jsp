<%-- ============================================================
     Component: Footer
     Description: Simple footer with copyright and items-saved
                  counter. Matches the reference design exactly.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="bg-white border-t border-gray-100 py-6 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-4">

        <%-- Left: Copyright --%>
        <p class="text-xs text-gray-400 text-center sm:text-left">
            &copy; 2025 NearFix &mdash; Academic project demonstrating full-stack MVC architecture
        </p>

        <%-- Right: Impact counter --%>
        <div class="flex items-center gap-2">
            <%-- Leaf/plant icon to represent environmental impact --%>
            <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-green-500"
                 fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M5 3s2 0 7 5c4-1 8 1 8 7 0 4-3 7-7 7-5 0-8-4-8-8 0-2 1-4 2-5
                         M5 3c0 2 1 4 2 6"/>
            </svg>
            <p class="text-xs text-gray-500">
                <span class="font-semibold text-green-600">${itemsSaved}</span>
                items saved from landfill
            </p>
        </div>

    </div>
</footer>
