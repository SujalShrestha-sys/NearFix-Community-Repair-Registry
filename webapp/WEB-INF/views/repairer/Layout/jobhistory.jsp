<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>NearFix – Job History</title>
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
      <a href="activejobs.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-chart-line text-[15px]"></i><span>Active Jobs</span>
      </a>
      <a href="wishlist.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm text-gray-600 hover:bg-gray-100 hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-regular fa-heart text-[15px]"></i><span>Wishlist</span>
      </a>
      <a href="jobhistory.jsp" class="flex items-center gap-3 px-4 py-2.5 rounded-lg text-sm font-semibold text-[#1a6b3c] bg-[#e6f4ec] hover:scale-[1.02] active:scale-[0.98] transition-all duration-200">
        <i class="fa-solid fa-clock text-[15px]"></i><span>Job History</span>
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
      <h1 class="text-lg font-bold text-gray-900">Job History</h1>
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
        <h2 class="text-2xl font-extrabold text-gray-900">Job History</h2>
        <p class="text-sm text-gray-500 mt-0.5">All completed and past jobs</p>
      </div>

      <!-- Table -->
      <div class="bg-white rounded-2xl border border-gray-200 shadow-sm overflow-hidden">
        <table class="w-full">
          <thead>
            <tr class="border-b border-gray-100">
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-6 py-3">Request</th>
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-4 py-3">Customer</th>
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-4 py-3">Category</th>
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-4 py-3">Completed</th>
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-4 py-3">Rating</th>
              <th class="text-left text-[11px] font-semibold text-gray-400 uppercase tracking-widest px-6 py-3">Status</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-100">
            <!-- Row 1 -->
            <tr class="hover:bg-gray-50 hover:shadow-sm transition-all duration-200 cursor-pointer group">
              <td class="px-6 py-5">
                <p class="font-semibold text-gray-900 text-sm">Wooden chair repair</p>
                <p class="text-xs text-gray-400">#1036</p>
              </td>
              <td class="px-4 py-5 text-sm text-gray-700">Anita S.</td>
              <td class="px-4 py-5">
                <span class="bg-gray-100 text-gray-600 text-[11px] font-medium px-2.5 py-1 rounded-full">Furniture</span>
              </td>
              <td class="px-4 py-5 text-sm text-gray-600">May 1, 2025</td>
              <td class="px-4 py-5">
                <div class="flex gap-0.5">
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                </div>
              </td>
              <td class="px-6 py-5">
                <span class="border border-gray-200 text-gray-600 text-[11px] font-medium px-3 py-1 rounded-lg">Done</span>
              </td>
            </tr>
            <!-- Row 2 -->
            <tr class="hover:bg-gray-50 hover:shadow-sm transition-all duration-200 cursor-pointer group">
              <td class="px-6 py-5">
                <p class="font-semibold text-gray-900 text-sm">iPad screen crack</p>
                <p class="text-xs text-gray-400">#1031</p>
              </td>
              <td class="px-4 py-5 text-sm text-gray-700">Rohan B.</td>
              <td class="px-4 py-5">
                <span class="bg-blue-50 text-blue-600 text-[11px] font-medium px-2.5 py-1 rounded-full">Electronics</span>
              </td>
              <td class="px-4 py-5 text-sm text-gray-600">Apr 24, 2025</td>
              <td class="px-4 py-5">
                <div class="flex gap-0.5">
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-regular fa-star text-gray-300 text-sm"></i>
                </div>
              </td>
              <td class="px-6 py-5">
                <span class="border border-gray-200 text-gray-600 text-[11px] font-medium px-3 py-1 rounded-lg">Done</span>
              </td>
            </tr>
            <!-- Row 3 -->
            <tr class="hover:bg-gray-50 hover:shadow-sm transition-all duration-200 cursor-pointer group">
              <td class="px-6 py-5">
                <p class="font-semibold text-gray-900 text-sm">Jeans hem alteration</p>
                <p class="text-xs text-gray-400">#1027</p>
              </td>
              <td class="px-4 py-5 text-sm text-gray-700">Sita D.</td>
              <td class="px-4 py-5">
                <span class="bg-gray-100 text-gray-600 text-[11px] font-medium px-2.5 py-1 rounded-full">Clothing</span>
              </td>
              <td class="px-4 py-5 text-sm text-gray-600">Apr 18, 2025</td>
              <td class="px-4 py-5">
                <div class="flex gap-0.5">
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                </div>
              </td>
              <td class="px-6 py-5">
                <span class="border border-gray-200 text-gray-600 text-[11px] font-medium px-3 py-1 rounded-lg">Done</span>
              </td>
            </tr>
            <!-- Row 4 -->
            <tr class="hover:bg-gray-50 hover:shadow-sm transition-all duration-200 cursor-pointer group">
              <td class="px-6 py-5">
                <p class="font-semibold text-gray-900 text-sm">Bluetooth speaker</p>
                <p class="text-xs text-gray-400">#1022</p>
              </td>
              <td class="px-4 py-5 text-sm text-gray-700">Amir K.</td>
              <td class="px-4 py-5">
                <span class="bg-blue-50 text-blue-600 text-[11px] font-medium px-2.5 py-1 rounded-full">Electronics</span>
              </td>
              <td class="px-4 py-5 text-sm text-gray-600">Apr 10, 2025</td>
              <td class="px-4 py-5">
                <div class="flex gap-0.5">
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                  <i class="fa-solid fa-star text-yellow-400 text-sm"></i>
                </div>
              </td>
              <td class="px-6 py-5">
                <span class="border border-gray-200 text-gray-600 text-[11px] font-medium px-3 py-1 rounded-lg">Done</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</body>
</html>
