<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post a Request - NearFix</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: '#0B7A53',
              'primary-light': '#EAF5EF',
              'primary-hover': '#F0F7F3',
              background: '#F3F8F5',
              dark: '#0D1F1A',
              border: '#E3ECE7',
              'border-light': '#D0E4DA',
              'border-extra-light': '#D8EAE1',
              muted: '#A0B4A8',
              'muted-dark': '#7D9087',
              'muted-light': '#EAF2EE',
              nav: '#3D5A50',
              yellow: '#F4B63D',
              'yellow-light': '#FFF5DC',
            }
          }
        }
      }
    </script>
    <style>
        .font-inter { font-family: 'Inter', sans-serif; }
        .sidebar-open { transform: translateX(0) !important; }
        .step-hidden { display: none; opacity: 0; transform: translateY(10px); }
        .step-active { display: block; opacity: 1; transform: translateY(0); transition: all 0.4s ease-out; }
        .glass-card { background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(10px); }
        .category-selected { border-color: #0B7A53; background-color: #EAF5EF; color: #0B7A53; transform: scale(1.02); }
    </style>
</head>
<body class="font-inter bg-background flex min-h-screen text-dark">

    <jsp:include page="layout/sidebar.jsp" />

    <div class="lg:ml-[260px] flex-1 flex flex-col min-h-screen bg-background w-full overflow-x-hidden">
        <jsp:include page="layout/navbar.jsp" />

        <main class="pt-[22px] px-4 md:px-9 pb-9">
            <div class="max-w-6xl mx-auto">
                <div class="mb-8 mt-2">
                    <p class="text-sm text-muted-dark">Tell us what needs fixing and we'll find the right expert for you.</p>
                </div>

                <c:if test="${not empty errorMessage}">
                    <div class="mb-8 bg-red-50 border border-red-100 text-red-500 px-8 py-5 rounded-3xl font-bold flex items-center gap-4 animate-pulse">
                        <div class="w-10 h-10 bg-red-100 rounded-full flex items-center justify-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                        </div>
                        <div>
                            <p class="text-xs uppercase tracking-widest opacity-60 mb-0.5">Submission Error</p>
                            <p class="text-lg">${errorMessage}</p>
                        </div>
                    </div>
                    <% session.removeAttribute("errorMessage"); %>
                </c:if>

                <div class="grid grid-cols-1 lg:grid-cols-[1fr_380px] gap-10">
                    <!-- Form Side -->
                    <div class="bg-white rounded-[32px] border border-border p-8 md:p-10 shadow-sm relative overflow-hidden">
                        <jsp:include page="post-request/step-indicators.jsp" />

                        <form id="post-request-form" action="${pageContext.request.contextPath}/user/repair-request" method="POST">
                            <input type="hidden" name="action" value="create">
                            
                            <jsp:include page="post-request/step-category.jsp" />
                            <jsp:include page="post-request/step-details.jsp" />
                            <jsp:include page="post-request/step-final.jsp" />
                        </form>
                    </div>

                    <!-- Preview Side -->
                    <jsp:include page="post-request/preview-card.jsp" />
                </div>
            </div>
        </main>
    </div>

    <script>
        let currentStep = 1;

        function nextStep(step) {
            // Validation for step 1
            if (step === 2 && !document.querySelector('input[name="category"]:checked')) {
                alert('Please select a category first!');
                return;
            }
            // Validation for step 2
            if (step === 3) {
                const name = document.getElementById('itemNameInput').value;
                const desc = document.getElementById('descInput').value;
                if (!name || !desc) {
                    alert('Please provide item name and description!');
                    return;
                }
            }

            // Transition
            document.getElementById('step-' + currentStep).classList.remove('step-active');
            document.getElementById('step-' + currentStep).classList.add('step-hidden');
            
            setTimeout(function() {
                document.getElementById('step-' + step).classList.remove('step-hidden');
                document.getElementById('step-' + step).classList.add('step-active');
                currentStep = step;
                
                // Update progress bar
                for (let i = 1; i <= 3; i++) {
                    const bar = document.getElementById('p-bar-' + i);
                    if (i <= step) {
                        bar.classList.add('bg-primary');
                        bar.classList.remove('bg-muted-light');
                    } else {
                        bar.classList.remove('bg-primary');
                        bar.classList.add('bg-muted-light');
                    }
                }
            }, 50);
        }

        function updateCategory(name, el) {
            document.querySelectorAll('.category-card').forEach(function(c) { c.classList.remove('category-selected'); });
            el.nextElementSibling.classList.add('category-selected');
            updatePreview('category', name);
        }

        function updatePreview(field, val) {
            const el = document.getElementById('preview-' + field);
            if (!el) return;
            
            if (field === 'urgency') {
                el.innerText = val;
                let className = 'px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider ';
                if (val === 'Urgent') className += 'bg-yellow-light text-yellow';
                else if (val === 'Emergency') className += 'bg-red-50 text-red-500';
                else className += 'bg-muted-light text-muted-dark';
                el.className = className;
            } else {
                el.innerText = val || (field === 'name' ? 'Item Name' : field === 'desc' ? 'The problem description will appear here as you type...' : 'Category');
            }
        }

    </script>
</body>
</html>
