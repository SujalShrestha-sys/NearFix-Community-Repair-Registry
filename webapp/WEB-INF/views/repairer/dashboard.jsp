<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1440">
<title>NearFix Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  body { font-family: 'Inter', sans-serif; background: #F3F8F5; display: flex; min-height: 100vh; color: #0D1F1A; }

  /* SIDEBAR */
  .sidebar {
    width: 260px;
    min-width: 260px;
    background: #fff;
    display: flex;
    flex-direction: column;
    padding: 0;
    border-right: 1px solid #E3ECE7;
    position: fixed;
    top: 0; left: 0; bottom: 0;
    z-index: 10;
  }
  .sidebar-logo {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 26px 24px 22px 24px;
  }
  .logo-icon {
    width: 36px; height: 36px;
    background: #0B7A53;
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
  }
  .logo-icon svg { width: 20px; height: 20px; }
  .logo-text {
    font-size: 18px;
    font-weight: 700;
    color: #0D1F1A;
    letter-spacing: -0.3px;
  }
  .sidebar-section-label {
    font-size: 10.5px;
    font-weight: 600;
    color: #A0B4A8;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    padding: 14px 24px 6px 24px;
  }
  .nav-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 10px 14px 10px 14px;
    margin: 1px 10px;
    border-radius: 10px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    color: #3D5A50;
    text-decoration: none;
    position: relative;
    transition: background 0.15s;
  }
  .nav-item:hover { background: #F0F7F3; }
  .nav-item.active {
    background: #EAF5EF;
    color: #0B7A53;
    font-weight: 600;
  }
  .nav-item svg { width: 18px; height: 18px; flex-shrink: 0; }
  .nav-badge {
    background: #0B7A53;
    color: #fff;
    font-size: 11px;
    font-weight: 700;
    border-radius: 50%;
    width: 20px; height: 20px;
    display: flex; align-items: center; justify-content: center;
    margin-left: auto;
  }
  .sidebar-spacer { flex: 1; }
  .sidebar-profile {
    display: flex;
    align-items: center;
    gap: 11px;
    padding: 16px 18px 20px 18px;
    border-top: 1px solid #E3ECE7;
    margin-top: 10px;
  }
  .profile-avatar {
    width: 38px; height: 38px;
    background: #C5D9CE;
    border-radius: 9px;
    display: flex; align-items: center; justify-content: center;
    font-size: 14px;
    font-weight: 700;
    color: #0B7A53;
    flex-shrink: 0;
  }
  .profile-info { display: flex; flex-direction: column; gap: 2px; }
  .profile-name { font-size: 13.5px; font-weight: 700; color: #0D1F1A; }
  .profile-sub {
    font-size: 12px;
    color: #7D9087;
    display: flex; align-items: center; gap: 4px;
  }
  .star-yellow { color: #F4B63D; font-size: 12px; }

  /* MAIN */
  .main {
    margin-left: 260px;
    flex: 1;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    background: #F3F8F5;
  }

  /* TOP HEADER */
  .top-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 28px 36px 0px 36px;
  }
  .header-title {
    font-size: 28px;
    font-weight: 800;
    color: #0D1F1A;
    letter-spacing: -0.5px;
  }
  .header-right {
    display: flex;
    align-items: center;
    gap: 12px;
  }
  .search-bar {
    display: flex;
    align-items: center;
    gap: 8px;
    background: #EAF2EE;
    border: 1px solid #D8EAE1;
    border-radius: 24px;
    padding: 9px 18px;
    width: 220px;
  }
  .search-bar svg { width: 15px; height: 15px; color: #A0B4A8; flex-shrink: 0; }
  .search-bar input {
    border: none;
    background: transparent;
    outline: none;
    font-size: 13.5px;
    color: #7D9087;
    font-family: 'Inter', sans-serif;
    width: 100%;
  }
  .search-bar input::placeholder { color: #A0B4A8; }
  .bell-btn {
    width: 38px; height: 38px;
    background: #EAF2EE;
    border: 1px solid #D8EAE1;
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    cursor: pointer;
  }
  .bell-btn svg { width: 17px; height: 17px; color: #3D5A50; }

  /* CONTENT AREA */
  .content {
    padding: 22px 36px 36px 36px;
  }

  /* STATS CARDS */
  .stats-row {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 18px;
    margin-bottom: 22px;
  }
  .stat-card {
    background: #fff;
    border-radius: 20px;
    padding: 22px 22px 20px 22px;
    border: 1px solid #E3ECE7;
    box-shadow: 0 1px 4px rgba(11,122,83,0.04);
    display: flex;
    flex-direction: column;
    gap: 4px;
    position: relative;
    min-height: 108px;
  }
  .stat-label {
    font-size: 10px;
    font-weight: 600;
    letter-spacing: 0.07em;
    text-transform: uppercase;
    color: #A0B4A8;
  }
  .stat-number {
    font-size: 42px;
    font-weight: 800;
    color: #0D1F1A;
    line-height: 1.05;
    letter-spacing: -1.5px;
    margin-top: 2px;
  }
  .stat-sub {
    font-size: 12px;
    color: #A0B4A8;
    font-weight: 400;
    margin-top: 1px;
  }
  .stat-icon {
    position: absolute;
    top: 20px; right: 20px;
    width: 40px; height: 40px;
    border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
  }
  .stat-icon.tools { background: #EAF5EF; }
  .stat-icon.lightning { background: #FFF5DC; }
  .stat-icon.star-icon { background: #FFF5DC; }
  .stat-icon.heart { background: #FFF0F3; }
  .stat-icon svg { width: 20px; height: 20px; }

  /* MAIN GRID */
  .main-grid {
    display: grid;
    grid-template-columns: 1fr 420px;
    gap: 20px;
  }

  /* ACTIVE JOBS CARD */
  .jobs-card {
    background: #fff;
    border-radius: 20px;
    border: 1px solid #E3ECE7;
    box-shadow: 0 1px 4px rgba(11,122,83,0.04);
    padding: 26px 26px 26px 26px;
  }
  .card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  .card-title {
    font-size: 17px;
    font-weight: 700;
    color: #0D1F1A;
  }
  .view-all-btn {
    font-size: 13px;
    font-weight: 500;
    color: #3D5A50;
    border: 1.5px solid #D0E4DA;
    border-radius: 20px;
    padding: 6px 16px;
    background: transparent;
    cursor: pointer;
  }

  /* JOB INNER BOX */
  .job-inner {
    background: #fff;
    border: 1.5px solid #E3ECE7;
    border-radius: 16px;
    padding: 20px 22px 20px 22px;
  }
  .job-top {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    margin-bottom: 18px;
  }
  .job-title {
    font-size: 15.5px;
    font-weight: 700;
    color: #0D1F1A;
    margin-bottom: 7px;
  }
  .job-meta {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12.5px;
    color: #7D9087;
  }
  .status-badge {
    background: #EAF5EF;
    color: #0B7A53;
    font-size: 11.5px;
    font-weight: 600;
    border-radius: 20px;
    padding: 3px 11px;
    display: inline-block;
  }

  /* PROGRESS TRACKER */
  .progress-tracker {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    margin-bottom: 20px;
    position: relative;
    padding: 0 4px;
  }
  .progress-line {
    position: absolute;
    top: 16px;
    left: 26px;
    right: 26px;
    height: 2.5px;
    background: #E3ECE7;
    z-index: 0;
  }
  .progress-line-fill {
    height: 100%;
    width: 55%;
    background: #0B7A53;
    border-radius: 2px;
  }
  .step-wrap {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 7px;
    z-index: 1;
    flex: 1;
  }
  .step-circle {
    width: 32px; height: 32px;
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-size: 13px;
    font-weight: 700;
    background: #fff;
  }
  .step-circle.done {
    background: #0B7A53;
    color: #fff;
    border: none;
  }
  .step-circle.active {
    background: #fff;
    border: 2.5px solid #0B7A53;
    color: #0B7A53;
  }
  .step-circle.inactive {
    background: #F3F8F5;
    border: 2px solid #D0E4DA;
    color: #A0B4A8;
    font-size: 12px;
  }
  .step-label {
    font-size: 11.5px;
    font-weight: 500;
    color: #7D9087;
    text-align: center;
    white-space: nowrap;
  }
  .step-label.active { color: #0B7A53; font-weight: 600; }

  .job-footer {
    display: flex;
    justify-content: flex-end;
  }
  .mark-complete-btn {
    background: #0B7A53;
    color: #fff;
    border: none;
    border-radius: 24px;
    padding: 12px 26px;
    font-size: 14px;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    letter-spacing: 0.01em;
  }

  /* RATINGS CARD */
  .ratings-card {
    background: #fff;
    border-radius: 20px;
    border: 1px solid #E3ECE7;
    box-shadow: 0 1px 4px rgba(11,122,83,0.04);
    padding: 26px 26px 0 26px;
    display: flex;
    flex-direction: column;
  }
  .ratings-list {
    display: flex;
    flex-direction: column;
    gap: 0;
    margin-bottom: 0;
  }
  .rating-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 15px 0;
    border-bottom: 1px solid #F0F5F2;
  }
  .rating-item:last-child { border-bottom: none; }
  .rating-name {
    font-size: 14px;
    font-weight: 500;
    color: #0D1F1A;
  }
  .stars {
    display: flex;
    gap: 2px;
  }
  .star { font-size: 16px; }
  .star.filled { color: #F4B63D; }
  .star.half { color: #F4B63D; }
  .star.empty { color: #E3ECE7; }

  .ratings-summary {
    background: #EAF5EF;
    border-radius: 0 0 18px 18px;
    margin: 0 -26px;
    padding: 22px 26px 24px;
    text-align: center;
    margin-top: 4px;
  }
  .summary-number {
    font-size: 38px;
    font-weight: 800;
    color: #0B7A53;
    letter-spacing: -1px;
    line-height: 1.1;
  }
  .summary-sub {
    font-size: 13px;
    color: #7D9087;
    margin-top: 3px;
    font-weight: 400;
  }

  /* CHECKMARK SVG for steps */
  .check-icon { width: 14px; height: 14px; }
</style>
</head>
<body>

<!-- SIDEBAR -->
<aside class="sidebar">
  <div class="sidebar-logo">
    <div class="logo-icon">
      <!-- wrench icon -->
      <svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
      </svg>
    </div>
    <span class="logo-text">NearFix</span>
  </div>

  <div class="sidebar-section-label">Jobs</div>

  <a class="nav-item active" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/>
    </svg>
    Dashboard
  </a>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
    </svg>
    Browse Jobs
    <span class="nav-badge"></span>
  </a>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
    </svg>
    Active Jobs
  </a>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
    </svg>
    Wishlist
  </a>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>
    </svg>
    Job History
  </a>

  <div class="sidebar-section-label" style="margin-top:6px;">Account</div>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
    </svg>
    My Profile
  </a>

  <a class="nav-item" href="#">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/>
    </svg>
    Sign out
  </a>

  <div class="sidebar-spacer"></div>

  <div class="sidebar-profile">
    <div class="profile-avatar"></div>
    <div class="profile-info">
      <span class="profile-name">Name</span>
      <span class="profile-sub">
        Repairer · <span class="star-yellow">★</span>
      </span>
    </div>
  </div>
</aside>

<!-- MAIN -->
<div class="main">
  <!-- HEADER -->
  <div class="top-header">
    <h1 class="header-title">Dashboard</h1>
    <div class="header-right">
      <div class="search-bar">
        <svg viewBox="0 0 24 24" fill="none" stroke="#A0B4A8" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
        <input type="text" placeholder="Search jobs...">
      </div>
      <div class="bell-btn">
        <svg viewBox="0 0 24 24" fill="none" stroke="#3D5A50" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/>
        </svg>
      </div>
    </div>
  </div>

  <!-- CONTENT -->
  <div class="content">

    <!-- STATS CARDS -->
    <div class="stats-row">
      <!-- Total Jobs -->
      <div class="stat-card">
        <span class="stat-label">Total Jobs</span>
        <span class="stat-number">0</span>
        <span class="stat-sub">All time</span>
        <div class="stat-icon tools">
          <svg viewBox="0 0 24 24" fill="none" stroke="#0B7A53" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
          </svg>
        </div>
      </div>
      <!-- Active Now -->
      <div class="stat-card">
        <span class="stat-label">Active Now</span>
        <span class="stat-number">0</span>
        <span class="stat-sub">In progress</span>
        <div class="stat-icon lightning">
          <svg viewBox="0 0 24 24" fill="none" stroke="#F4B63D" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
          </svg>
        </div>
      </div>
      <!-- Rating -->
      <div class="stat-card">
        <span class="stat-label">Rating</span>
        <span class="stat-number">0</span>
        <span class="stat-sub">0 reviews</span>
        <div class="stat-icon star-icon">
          <svg viewBox="0 0 24 24" fill="#F4B63D" stroke="#F4B63D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
          </svg>
        </div>
      </div>
      <!-- Wishlist -->
      <div class="stat-card">
        <span class="stat-label">Wishlist</span>
        <span class="stat-number">0</span>
        <span class="stat-sub">Saved jobs</span>
        <div class="stat-icon heart">
          <svg viewBox="0 0 24 24" fill="#F87096" stroke="#F87096" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
          </svg>
        </div>
      </div>
    </div>

    <!-- MAIN GRID -->
    <div class="main-grid">
      <!-- Active Jobs Card -->
      <div class="jobs-card">
        <div class="card-header">
          <span class="card-title">Active Jobs</span>
          <button class="view-all-btn">View all</button>
        </div>

        <div class="job-inner">
          <div class="job-top">
            <div>
              <div class="job-title">No Jobs</div>
              <div class="job-meta">
                <span class="status-badge"></span>
                <span></span>
              </div>
            </div>
          </div>

          <!-- Progress Tracker -->
          <div class="progress-tracker">
            <div class="progress-line">
              <div class="progress-line-fill"></div>
            </div>

            <!-- Step 1: Pending -->
             <div class="step-wrap">
              <div class="step-circle active">
                <div style="width:10px;height:10px;border-radius:50%;background:#0B7A53;"></div>
              </div>
              <span class="step-label active">Pending</span>
            </div>

            <!-- Step 2: Accepted -->
             <div class="step-wrap">
              <div class="step-circle active">
                <div style="width:10px;height:10px;border-radius:50%;background:#0B7A53;"></div>
              </div>
              <span class="step-label active">Accepted</span>
            </div>

            <!-- Step 3: In Progress -->
            <div class="step-wrap">
              <div class="step-circle active">
                <div style="width:10px;height:10px;border-radius:50%;background:#0B7A53;"></div>
              </div>
              <span class="step-label active">In Progress</span>
            </div>

            <!-- Step 4: Done -->
            <div class="step-wrap">
              <div class="step-circle inactive">4</div>
              <span class="step-label">Done</span>
            </div>
          </div>

          <div class="job-footer">
            <button class="mark-complete-btn">Mark Complete ✓</button>
          </div>
        </div>
      </div>

      <!-- My Ratings Card -->
      <div class="ratings-card">
        <div class="card-header" style="margin-bottom:4px;">
          <span class="card-title">My Ratings</span>
        </div>

        <div class="ratings-list">
          <div class="rating-item">
            <span class="rating-name"></span>
            <div class="stars">
              <span class="star">★</span>
              <span class="star ">★</span>
              <span class="star ">★</span>
              <span class="star ">★</span>
              <span class="star ">★</span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>