<%-- ============================================================
     Component: Stats Section
     Description: Dark banner showing key platform statistics.
                  Numbers come from the servlet via request attributes.
     ============================================================ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section id="stats" class="bg-gray-900 py-14 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto">
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-8 text-center">

            <%-- Stat 1: Items Saved (dynamic from servlet) --%>
            <div class="nf-stat-item flex flex-col gap-1">
                <span class="nf-stat-num text-4xl sm:text-5xl font-extrabold text-green-400">
                    ${itemsSaved}
                </span>
                <span class="text-sm text-gray-400">Items saved from landfill</span>
            </div>

            <%-- Stat 2: Verified Repairers (dynamic from servlet) --%>
            <div class="nf-stat-item flex flex-col gap-1">
                <span class="nf-stat-num text-4xl sm:text-5xl font-extrabold text-green-400">
                    ${totalFixers}<span class="text-2xl">+</span>
                </span>
                <span class="text-sm text-gray-400">Verified repairers</span>
            </div>

            <%-- Stat 3: Repair Requests (static for now) --%>
            <div class="nf-stat-item flex flex-col gap-1">
                <span class="nf-stat-num text-4xl sm:text-5xl font-extrabold text-green-400">
                    15,000<span class="text-2xl">+</span>
                </span>
                <span class="text-sm text-gray-400">Repair requests posted</span>
            </div>

            <%-- Stat 4: Average Rating (static for now) --%>
            <div class="nf-stat-item flex flex-col gap-1">
                <span class="nf-stat-num text-4xl sm:text-5xl font-extrabold text-green-400">
                    4.8
                    <%-- Star icon inline --%>
                    <svg xmlns="http://www.w3.org/2000/svg" class="inline w-8 h-8 mb-1 text-yellow-400"
                         fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77
                                 l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                    </svg>
                </span>
                <span class="text-sm text-gray-400">Average repairer rating</span>
            </div>

        </div>
    </div>
</section>
