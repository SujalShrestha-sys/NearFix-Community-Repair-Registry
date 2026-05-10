<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>NearFix – Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <style>
    body { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; background: #f4f6f4; }
    .icon-gray  { background: #eff0ef; }
    .icon-bolt  { background: #fff3e8; }
    .icon-star  { background: #fffbe6; }
    .icon-heart { background: #fef0f4; }
    .progress-track { position:absolute; top:13px; left:24px; right:24px; height:2px; background:#e5e7eb; z-index:0; }
    .progress-fill  { position:absolute; top:13px; left:24px; width:calc(66.66% - 8px); height:2px; background:#1a6b3c; z-index:1; }
  </style>
</head>
<body class="flex h-screen overflow-hidden">

  <!-- ── SIDEBAR ─────────────────────────────────────────────── -->
  <aside class="w-[248px] bg-white border-r border-gray-200 flex flex-col h-screen fixed left-0 top-0 z-20 shrink-0">

    <!-- Logo -->
    <div class="flex items-center gap-2.5 px-5 h-[56px] border-b border-gray-100 shrink-0">
      <div class="w-[30px] h-[30px] bg-[#1a6b3c] rounded-[8px] flex items-center justify-center shrink-0">
        <i class="fa-solid fa-wrench text-white text-[12px]"></i>
      </div>
      <span class="font-bold text-gray-900 text-[17px] tracking-tight">NearFix</span>
    </div>

    <!-- Nav links -->
    <nav class="flex-1 px-3 pt-4 pb-2 flex flex-col gap-px overflow-y-auto">
      <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] px-3 mb-1.5">Jobs</p>

      <a href="dashboard.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] font-semibold text-[#1a6b3c] bg-[#eaf5ef] hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-house w-4 text-center text-[13px]"></i><span>Dashboard</span>
      </a>
      <a href="browsejobs.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-briefcase w-4 text-center text-[13px]"></i>
        <span>Browse Jobs</span>
        <span class="ml-auto bg-[#1a6b3c] text-white text-[10px] font-bold rounded-full w-5 h-5 flex items-center justify-center">5</span>
      </a>
      <a href="activejobs.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-chart-line w-4 text-center text-[13px]"></i><span>Active Jobs</span>
      </a>
      <a href="wishlist.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-heart w-4 text-center text-[13px]"></i><span>Wishlist</span>
      </a>
      <a href="jobhistory.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-clock w-4 text-center text-[13px]"></i><span>Job History</span>
      </a>

      <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] px-3 mt-5 mb-1.5">Account</p>

      <a href="myprofile.jsp" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-user w-4 text-center text-[13px]"></i><span>My Profile</span>
      </a>
      <a href="#" class="flex items-center gap-3 px-3 py-[9px] rounded-[10px] text-[13.5px] text-gray-600 hover:bg-gray-50 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-arrow-right-from-bracket w-4 text-center text-[13px]"></i><span>Sign out</span>
      </a>
    </nav>

    <!-- User footer -->
    <div class="px-4 py-3.5 border-t border-gray-100 flex items-center gap-2.5 shrink-0">
      <div class="w-[32px] h-[32px] rounded-full bg-[#d0e9d9] flex items-center justify-center text-[11px] font-bold text-[#1a6b3c] shrink-0">RK</div>
      <div class="min-w-0">
        <p class="text-[13px] font-semibold text-gray-800 leading-tight truncate">Ram Karki</p>
        <p class="text-[11px] text-gray-500 flex items-center gap-1 mt-0.5">
          Repairer&nbsp;·&nbsp;<i class="fa-solid fa-star text-yellow-400 text-[9px]"></i>&nbsp;4.9
        </p>
      </div>
    </div>
  </aside>

  <!-- ── MAIN AREA ───────────────────────────────────────────── -->
  <div class="ml-[248px] flex-1 flex flex-col min-h-screen overflow-hidden">

    <!-- Header -->
    <header class="h-[56px] bg-white border-b border-gray-200 flex items-center justify-between px-6 sticky top-0 z-10 shrink-0">
      <h1 class="text-[15px] font-bold text-gray-900">Dashboard</h1>
      <div class="flex items-center gap-3">
        <div class="flex items-center gap-1.5 border border-gray-200 rounded-full px-3 py-[6px] bg-white w-[192px] hover:border-[#1a6b3c]/30 hover:shadow-sm transition-all duration-300">
          <i class="fa-solid fa-magnifying-glass text-gray-400 text-[11px]"></i>
          <input type="text" placeholder="Search jobs…" class="text-[12.5px] text-gray-400 outline-none bg-transparent w-full placeholder-gray-400"/>
        </div>
        <button class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-[#1a6b3c] hover:scale-110 active:scale-90 transition-all duration-200">
          <i class="fa-regular fa-bell text-[17px]"></i>
        </button>
      </div>
    </header>

    <!-- Content -->
    <main class="flex-1 p-6 overflow-y-auto">

      <!-- Stat Cards -->
      <div class="grid grid-cols-4 gap-[14px] mb-5">

        <!-- Total Jobs -->
        <div class="bg-white rounded-[18px] px-5 py-5 border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] flex items-start justify-between hover:scale-[1.03] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div>
            <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] mb-3">Total Jobs</p>
            <p class="text-[40px] font-bold text-gray-900 leading-none">28</p>
            <p class="text-[11.5px] text-gray-400 mt-2">All time</p>
          </div>
          <div class="w-[42px] h-[42px] rounded-[12px] icon-gray flex items-center justify-center shrink-0">
            <i class="fa-solid fa-screwdriver-wrench text-gray-400 text-[15px]"></i>
          </div>
        </div>

        <!-- Active Now -->
        <div class="bg-white rounded-[18px] px-5 py-5 border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] flex items-start justify-between hover:scale-[1.03] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div>
            <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] mb-3">Active Now</p>
            <p class="text-[40px] font-bold text-gray-900 leading-none">2</p>
            <p class="text-[11.5px] text-[#1a6b3c] font-semibold mt-2">In progress</p>
          </div>
          <div class="w-[42px] h-[42px] rounded-[12px] icon-bolt flex items-center justify-center shrink-0">
            <i class="fa-solid fa-bolt text-orange-400 text-[15px]"></i>
          </div>
        </div>

        <!-- Rating -->
        <div class="bg-white rounded-[18px] px-5 py-5 border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] flex items-start justify-between hover:scale-[1.03] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div>
            <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] mb-3">Rating</p>
            <p class="text-[40px] font-bold text-gray-900 leading-none">4.9</p>
            <p class="text-[11.5px] text-gray-400 mt-2">47 reviews</p>
          </div>
          <div class="w-[42px] h-[42px] rounded-[12px] icon-star flex items-center justify-center shrink-0">
            <i class="fa-solid fa-star text-yellow-400 text-[15px]"></i>
          </div>
        </div>

        <!-- Wishlist -->
        <div class="bg-white rounded-[18px] px-5 py-5 border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] flex items-start justify-between hover:scale-[1.03] hover:shadow-md transition-all duration-300 cursor-pointer">
          <div>
            <p class="text-[10px] font-semibold text-gray-400 uppercase tracking-[0.1em] mb-3">Wishlist</p>
            <p class="text-[40px] font-bold text-gray-900 leading-none">2</p>
            <p class="text-[11.5px] text-gray-400 mt-2">Saved jobs</p>
          </div>
          <div class="w-[42px] h-[42px] rounded-[12px] icon-heart flex items-center justify-center shrink-0">
            <i class="fa-solid fa-heart text-pink-400 text-[15px]"></i>
          </div>
        </div>
      </div>

      <!-- Bottom row: Active Jobs + My Ratings -->
      <div class="grid grid-cols-5 gap-[14px]">

        <!-- Active Jobs (3 cols) -->
        <div class="col-span-3 bg-white rounded-[18px] border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] p-6 hover:shadow-md transition-all duration-300">
          <div class="flex items-center justify-between mb-4">
            <h2 class="text-[15px] font-bold text-gray-900">Active Jobs</h2>
            <a href="activejobs.jsp" class="text-[12.5px] text-gray-500 border border-gray-200 rounded-[9px] px-3 py-[5px] hover:bg-gray-100 hover:scale-105 active:scale-95 transition-all duration-200">View all</a>
          </div>

          <!-- Job card -->
          <div class="border border-gray-200 rounded-[14px] p-4 hover:border-[#1a6b3c]/30 hover:bg-gray-50/30 transition-all duration-300 cursor-pointer group">
            <h3 class="text-[14px] font-semibold text-gray-900 mb-1.5 group-hover:text-[#1a6b3c] transition-colors">iPhone 13 screen crack</h3>
            <div class="flex items-center gap-2 mb-5">
              <span class="bg-[#dcf5e7] text-[#1a6b3c] text-[11px] font-semibold px-2.5 py-[3px] rounded-full">In Progress</span>
              <span class="text-[11.5px] text-gray-400">#1042 · Anita Sharma</span>
            </div>

            <!-- Progress stepper -->
            <div class="relative flex items-start justify-between px-3 pb-1">
              <div class="progress-track"></div>
              <div class="progress-fill"></div>

              <!-- Pending ✓ -->
              <div class="flex flex-col items-center z-10 relative">
                <div class="w-[28px] h-[28px] rounded-full bg-[#1a6b3c] flex items-center justify-center">
                  <i class="fa-solid fa-check text-white text-[10px]"></i>
                </div>
                <span class="text-[10.5px] text-[#1a6b3c] font-medium mt-[7px]">Pending</span>
              </div>

              <!-- Accepted ✓ -->
              <div class="flex flex-col items-center z-10 relative">
                <div class="w-[28px] h-[28px] rounded-full bg-[#1a6b3c] flex items-center justify-center">
                  <i class="fa-solid fa-check text-white text-[10px]"></i>
                </div>
                <span class="text-[10.5px] text-[#1a6b3c] font-medium mt-[7px]">Accepted</span>
              </div>

              <!-- In Progress (ring) -->
              <div class="flex flex-col items-center z-10 relative">
                <div class="w-[28px] h-[28px] rounded-full border-[2.5px] border-[#1a6b3c] bg-white flex items-center justify-center">
                  <div class="w-[9px] h-[9px] rounded-full bg-[#1a6b3c]"></div>
                </div>
                <span class="text-[10.5px] text-[#1a6b3c] font-medium mt-[7px]">In Progress</span>
              </div>

              <!-- Done (grey number) -->
              <div class="flex flex-col items-center z-10 relative">
                <div class="w-[28px] h-[28px] rounded-full border-2 border-gray-300 bg-white flex items-center justify-center">
                  <span class="text-[11px] text-gray-400 font-medium">4</span>
                </div>
                <span class="text-[10.5px] text-gray-400 mt-[7px]">Done</span>
              </div>
            </div>

            <div class="flex justify-end mt-4">
              <button onclick="showToast('Job marked as Completed!', '🎉')" class="bg-[#1b3d2c] hover:bg-[#14532d] hover:scale-[1.03] active:scale-[0.98] text-white text-[13px] font-bold px-5 py-[8px] rounded-[10px] shadow-sm hover:shadow-md transition-all duration-200">
                Mark Complete ✓
              </button>
            </div>
          </div>
        </div>

        <!-- My Ratings (2 cols) -->
        <div class="col-span-2 bg-white rounded-[18px] border border-gray-100 shadow-[0_1px_5px_rgba(0,0,0,0.055)] p-6">
          <h2 class="text-[15px] font-bold text-gray-900 mb-5">My Ratings</h2>

          <div class="space-y-[22px]">
            <div class="flex items-center justify-between">
              <span class="text-[13px] text-gray-700">Wooden chair repair</span>
              <div class="flex gap-[2px]">
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-[13px] text-gray-700">iPad screen crack</span>
              <div class="flex gap-[2px]">
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-regular fa-star text-gray-300 text-[13px]"></i>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-[13px] text-gray-700">Jeans hem alteration</span>
              <div class="flex gap-[2px]">
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
                <i class="fa-solid fa-star text-yellow-400 text-[13px]"></i>
              </div>
            </div>
          </div>

          <!-- Average bubble -->
          <div class="mt-5 rounded-[14px] bg-[#eaf5ef] px-4 py-5 text-center">
            <p class="text-[34px] font-extrabold text-[#1a6b3c] leading-none tracking-tight">4.9</p>
            <p class="text-[11.5px] text-gray-400 mt-1.5">Average from 47 ratings</p>
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
