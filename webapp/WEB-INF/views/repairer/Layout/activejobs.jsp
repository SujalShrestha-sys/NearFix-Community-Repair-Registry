<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>NearFix – Active Jobs</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>body { font-family: 'Segoe UI', sans-serif; }</style>
</head>
<body class="bg-gray-50 flex h-screen overflow-hidden">

  <!-- Sidebar -->
  <aside class="w-64 bg-white border-r border-gray-200 flex flex-col h-screen fixed left-0 top-0 z-10">
    <div class="flex items-center gap-2 px-5 py-4 border-b border-gray-100">
      <div class="w-8 h-8 bg-[#1a6b3c] rounded-lg flex items-center justify-center">
        <i class="fa-solid fa-wrench text-white text-sm"></i>
      </div>
      <span class="font-bold text-gray-900 text-lg">NearFix</span>
    </div>
    <nav class="flex-1 px-3 py-4 flex flex-col gap-1">
      <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-widest px-4 mb-1">Jobs</p>
      <a href="dashboard.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-house text-[15px]"></i><span>Dashboard</span>
      </a>
      <a href="browsejobs.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-briefcase text-[15px]"></i>
        <span>Browse Jobs</span>
        <span class="ml-auto bg-[#1a6b3c] text-white text-[10px] font-bold rounded-full w-5 h-5 flex items-center justify-center">5</span>
      </a>
      <a href="activejobs.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm font-semibold text-[#1a6b3c] bg-[#e6f4ec] hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-chart-line text-[15px]"></i><span>Active Jobs</span>
      </a>
      <a href="wishlist.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-heart text-[15px]"></i><span>Wishlist</span>
      </a>
      <a href="jobhistory.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-clock text-[15px]"></i><span>Job History</span>
      </a>
      <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-widest px-4 mt-4 mb-1">Account</p>
      <a href="myprofile.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-user text-[15px]"></i><span>My Profile</span>
      </a>
      <a href="#" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-arrow-right-from-bracket text-[15px]"></i><span>Sign out</span>
      </a>
    </nav>
    <div class="px-4 py-4 border-t border-gray-100 flex items-center gap-3">
      <div class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-xs font-bold text-gray-600">RK</div>
      <div>
        <p class="text-sm font-semibold text-gray-800 leading-tight">Ram Karki</p>
        <p class="text-xs text-gray-500 flex items-center gap-1">Repairer · <i class="fa-solid fa-star text-yellow-400 text-[10px]"></i> 4.9</p>
      </div>
    </div>
  </aside>

  <!-- Main -->
  <div class="ml-64 flex-1 flex flex-col min-h-screen">
    <header class="h-14 bg-white border-b border-gray-200 flex items-center justify-between px-6 sticky top-0 z-10">
      <h1 class="text-lg font-bold text-gray-900">Active Jobs</h1>
      <div class="flex items-center gap-3">
        <div class="flex items-center gap-2 border border-gray-200 rounded-full px-3 py-1.5 bg-white w-48 hover:border-[#1a6b3c]/30 hover:shadow-sm transition-all duration-300">
          <i class="fa-solid fa-magnifying-glass text-gray-400 text-xs"></i>
          <input type="text" placeholder="Search jobs..." class="text-sm text-gray-500 outline-none bg-transparent w-full"/>
        </div>
        <button class="text-gray-500 hover:text-[#1a6b3c] hover:scale-110 active:scale-90 transition-all duration-200"><i class="fa-regular fa-bell text-lg"></i></button>
      </div>
    </header>

    <main class="flex-1 p-6 overflow-y-auto">
      <div class="mb-6">
        <h2 class="text-2xl font-extrabold text-gray-900">My Active Jobs</h2>
        <p class="text-sm text-gray-500 mt-0.5">Jobs you've accepted and are working on</p>
      </div>

      <div class="space-y-4">

        <!-- Job 1: In Progress -->
        <div class="bg-white rounded-2xl border border-gray-200 shadow-sm p-6 hover:scale-[1.01] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div class="flex items-center gap-2 mb-1">
            <h3 class="font-bold text-gray-900 text-base">iPhone 13 screen crack</h3>
          </div>
          <div class="flex items-center gap-2 mb-3">
            <span class="bg-green-100 text-green-700 text-[11px] font-semibold px-2.5 py-0.5 rounded-full">In Progress</span>
            <span class="text-xs text-gray-500">#1042 · Anita Sharma</span>
          </div>
          <p class="text-sm text-gray-600 mb-6">Front screen shattered. Part ordered and ready to install. Customer contacted.</p>

          <!-- Steps -->
          <div class="flex items-center justify-between relative px-8 mb-2">
            <div class="absolute left-[calc(12%+14px)] right-[calc(12%+14px)] top-[14px] h-0.5 bg-gray-200 z-0"></div>
            <div class="absolute left-[calc(12%+14px)] w-[calc(42%-14px)] top-[14px] h-0.5 bg-[#1a6b3c] z-0"></div>

            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full bg-[#1a6b3c] flex items-center justify-center">
                <i class="fa-solid fa-check text-white text-xs"></i>
              </div>
              <span class="text-[11px] text-[#1a6b3c] font-medium mt-1.5">Pending</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full bg-[#1a6b3c] flex items-center justify-center">
                <i class="fa-solid fa-check text-white text-xs"></i>
              </div>
              <span class="text-[11px] text-[#1a6b3c] font-medium mt-1.5">Accepted</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full border-2 border-[#1a6b3c] bg-white flex items-center justify-center">
                <div class="w-2 h-2 rounded-full bg-[#1a6b3c]"></div>
              </div>
              <span class="text-[11px] text-[#1a6b3c] font-medium mt-1.5">In Progress</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full border-2 border-gray-300 bg-white flex items-center justify-center">
                <span class="text-xs text-gray-400 font-medium">4</span>
              </div>
              <span class="text-[11px] text-gray-400 mt-1.5">Done</span>
            </div>
          </div>

          <div class="flex items-center justify-between mt-4">
            <span class="flex items-center gap-1 text-xs text-gray-500">
              <i class="fa-solid fa-location-dot text-red-400 text-xs"></i> Baneshwor · <span class="text-red-500 font-medium">Urgent</span>
            </span>
            <button onclick="showToast('Job marked as Completed!', '🎉')" class="bg-[#1a3d2b] text-white text-sm font-semibold px-5 py-2 rounded-xl hover:bg-[#14532d] hover:scale-[1.03] active:scale-[0.98] transition-all duration-200 shadow-sm hover:shadow-md">Mark Complete ✓</button>
          </div>
        </div>

        <!-- Job 2: Accepted -->
        <div class="bg-white rounded-2xl border border-gray-200 shadow-sm p-6 hover:scale-[1.01] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div class="flex items-center gap-2 mb-1">
            <h3 class="font-bold text-gray-900 text-base">Sony headphone jack repair</h3>
          </div>
          <div class="flex items-center gap-2 mb-3">
            <span class="bg-yellow-100 text-yellow-700 text-[11px] font-semibold px-2.5 py-0.5 rounded-full">Accepted</span>
            <span class="text-xs text-gray-500">#1039 · Dev Raj</span>
          </div>
          <p class="text-sm text-gray-600 mb-6">3.5mm jack loose and crackling. Sony WH-1000XM4. Customer dropping off today.</p>

          <!-- Steps -->
          <div class="flex items-center justify-between relative px-8 mb-2">
            <div class="absolute left-[calc(12%+14px)] right-[calc(12%+14px)] top-[14px] h-0.5 bg-gray-200 z-0"></div>
            <div class="absolute left-[calc(12%+14px)] w-[calc(17%-14px)] top-[14px] h-0.5 bg-[#1a6b3c] z-0"></div>

            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full bg-[#1a6b3c] flex items-center justify-center">
                <i class="fa-solid fa-check text-white text-xs"></i>
              </div>
              <span class="text-[11px] text-[#1a6b3c] font-medium mt-1.5">Pending</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full border-2 border-[#1a6b3c] bg-white flex items-center justify-center">
                <div class="w-2 h-2 rounded-full bg-[#1a6b3c]"></div>
              </div>
              <span class="text-[11px] text-[#1a6b3c] font-medium mt-1.5">Accepted</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full border-2 border-gray-300 bg-white flex items-center justify-center">
                <span class="text-xs text-gray-400 font-medium">3</span>
              </div>
              <span class="text-[11px] text-gray-400 mt-1.5">In Progress</span>
            </div>
            <div class="flex flex-col items-center z-10">
              <div class="w-7 h-7 rounded-full border-2 border-gray-300 bg-white flex items-center justify-center">
                <span class="text-xs text-gray-400 font-medium">4</span>
              </div>
              <span class="text-[11px] text-gray-400 mt-1.5">Done</span>
            </div>
          </div>

          <div class="flex items-center justify-between mt-4">
            <span class="flex items-center gap-1 text-xs text-gray-500">
              <i class="fa-solid fa-location-dot text-red-400 text-xs"></i> Thamel
            </span>
            <button onclick="showToast('Status updated to In Progress.', '🔧')" class="border border-gray-300 text-gray-700 text-sm font-medium px-5 py-2 rounded-xl hover:bg-gray-50 hover:scale-[1.03] active:scale-[0.98] transition-all duration-200 shadow-sm hover:shadow-md">Mark In Progress →</button>
          </div>
        </div>

      </div>
    </main>
  </div>
  <!-- Toast Notification -->
  <div id="toast" class="fixed bottom-10 left-1/2 -translate-x-1/2 bg-[#0a140f] text-white px-6 py-3.5 rounded-2xl shadow-2xl flex items-center gap-3 transform transition-all duration-500 translate-y-20 opacity-0 z-50 pointer-events-none border border-white/10">
    <span id="toast-icon" class="text-lg"></span>
    <span id="toast-message" class="text-[13.5px] font-medium tracking-tight"></span>
  </div>

  <script>
    function showToast(message, icon) {
      const toast = document.getElementById('toast');
      const msg = document.getElementById('toast-message');
      const ico = document.getElementById('toast-icon');
      msg.innerHTML = message;
      ico.innerHTML = icon;
      toast.classList.remove('translate-y-20', 'opacity-0');
      toast.classList.add('translate-y-0', 'opacity-100');
      setTimeout(() => {
        toast.classList.remove('translate-y-0', 'opacity-100');
        toast.classList.add('translate-y-20', 'opacity-0');
      }, 3000);
    }
  </script>
</body>
</html>
