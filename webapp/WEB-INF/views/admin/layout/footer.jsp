</div><!-- page-content -->
  </div><!-- main -->
</div><!-- adminShell -->
<div class="toast-container" id="toastContainer"></div>

<script>
var currentRating = 4;

// ── VIEW ROUTER ──
function goLanding(){
  document.querySelectorAll('.view,.shell-view').forEach(function(v){v.classList.remove('active')});
  document.getElementById('landing-view').classList.add('active');
  window.scrollTo(0,0);
}

function showAuth(type){
  document.querySelectorAll('.view,.shell-view').forEach(function(v){v.classList.remove('active')});
  document.getElementById('auth-view').classList.add('active');
  renderAuthForm(type);
  window.scrollTo(0,0);
}

function enterDashboard(role){
  document.querySelectorAll('.view,.shell-view').forEach(function(v){v.classList.remove('active')});
  var shell = document.getElementById(role+'Shell');
  if(shell) shell.classList.add('active');
  // reset to home page
  var firstPage = document.querySelector('#'+role+'Shell .page');
  if(firstPage){
    document.querySelectorAll('#'+role+'Shell .page').forEach(function(p){p.classList.remove('active')});
    document.querySelector('#'+role+'Shell .page').classList.add('active');
  }
  window.scrollTo(0,0);
}

// ── AUTH FORMS ──
function renderAuthForm(type){
  var c = document.getElementById('authFormContent');
  if(type==='login'){
    c.innerHTML = `
      <div class="auth-tabs">
        <div class="auth-tab active" onclick="renderAuthForm('login')">Sign in</div>
        <div class="auth-tab" onclick="renderAuthForm('register')">Create account</div>
      </div>
      <h2 class="auth-form-title">Welcome back</h2>
      <p class="auth-form-sub">Sign in to your NearFix account to continue</p>
      <div class="f-group"><label class="f-label">Email address</label><input class="f-input" type="email" placeholder="you@email.com"></div>
      <div class="f-group"><label class="f-label">Password</label><div class="password-wrap"><input class="f-input" type="password" id="loginPwd" placeholder="••••••••"><button class="password-toggle" onclick="togglePwd('loginPwd')"><i data-lucide="eye" style="width:16px;height:16px"></i></button></div></div>
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px">
        <label style="display:flex;align-items:center;gap:6px;font-size:13px;color:var(--ink3);cursor:pointer"><input type="checkbox" style="accent-color:var(--g)"> Remember me</label>
        <a style="font-size:13px;color:var(--g);cursor:pointer;font-weight:600;text-decoration:none">Forgot password?</a>
      </div>
      <button class="auth-submit" onclick="handleLogin()">Sign in to NearFix</button>
      <div class="auth-divider">or sign in as</div>
      <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px">
        <button class="btn btn-ghost btn-sm" onclick="enterDashboard('user');document.getElementById('auth-view').classList.remove('active')"><i data-lucide="user" style="width:14px;height:14px;margin-right:4px"></i> User</button>
        <button class="btn btn-ghost btn-sm" onclick="enterDashboard('repairer');document.getElementById('auth-view').classList.remove('active')"><i data-lucide="wrench" style="width:14px;height:14px;margin-right:4px"></i> Repairer</button>
        <button class="btn btn-ghost btn-sm" onclick="enterDashboard('admin');document.getElementById('auth-view').classList.remove('active')"><i data-lucide="shield" style="width:14px;height:14px;margin-right:4px"></i> Admin</button>
      </div>
      <p class="auth-switch">Don't have an account? <a onclick="renderAuthForm('register')">Register here</a></p>
    `;
  } else if(type==='register'){
    c.innerHTML = `
      <div class="auth-tabs">
        <div class="auth-tab" onclick="renderAuthForm('login')">Sign in</div>
        <div class="auth-tab active" onclick="renderAuthForm('register')">Create account</div>
      </div>
      <h2 class="auth-form-title">Create your account</h2>
      <p class="auth-form-sub">Join NearFix — post repairs or start earning as a repairer</p>
      <div class="role-picker">
        <div class="role-pick selected" onclick="selectRole(this,'user')"><div class="rp-icon" style="display:flex;justify-content:center"><i data-lucide="user" style="width:24px;height:24px"></i></div><div class="rp-name">Regular User</div><div class="rp-sub">Post repair requests</div></div>
        <div class="role-pick" onclick="selectRole(this,'repairer')"><div class="rp-icon" style="display:flex;justify-content:center"><i data-lucide="wrench" style="width:24px;height:24px"></i></div><div class="rp-name">Repairer</div><div class="rp-sub">Accept repair jobs</div></div>
      </div>
      <div class="f-row">
        <div class="f-group"><label class="f-label">First Name</label><input class="f-input" placeholder="Anita"></div>
        <div class="f-group"><label class="f-label">Last Name</label><input class="f-input" placeholder="Sharma"></div>
      </div>
      <div class="f-group"><label class="f-label">Email</label><input class="f-input" type="email" placeholder="you@email.com"></div>
      <div class="f-group"><label class="f-label">Phone</label><input class="f-input" placeholder="+977 98…"></div>
      <div class="f-group"><label class="f-label">Password</label><div class="password-wrap"><input class="f-input" type="password" id="regPwd" placeholder="Min. 8 characters"><button class="password-toggle" onclick="togglePwd('regPwd')"><i data-lucide="eye" style="width:16px;height:16px"></i></button></div></div>
      <button class="auth-submit" onclick="handleRegister('user')">Create Account</button>
      <p class="auth-switch">Already have an account? <a onclick="renderAuthForm('login')">Sign in</a></p>
    `;
  } else if(type==='repairer'){
    c.innerHTML = `
      <h2 class="auth-form-title">Join as a Repairer</h2>
      <p class="auth-form-sub">Get approved and start earning from repair jobs near you</p>
      <div class="f-row">
        <div class="f-group"><label class="f-label">Full Name</label><input class="f-input" placeholder="Ram Karki"></div>
        <div class="f-group"><label class="f-label">Phone</label><input class="f-input" placeholder="+977 98…"></div>
      </div>
      <div class="f-group"><label class="f-label">Email</label><input class="f-input" type="email" placeholder="you@email.com"></div>
      <div class="f-group"><label class="f-label">Skill Category</label><select class="f-input"><option>Electronics</option><option>Clothing & Footwear</option><option>Furniture</option><option>Watches & Jewellery</option><option>Appliances</option><option>Other</option></select></div>
      <div class="f-row">
        <div class="f-group"><label class="f-label">Experience (years)</label><input class="f-input" type="number" placeholder="5"></div>
        <div class="f-group"><label class="f-label">Service Area</label><input class="f-input" placeholder="Thamel, Ktm"></div>
      </div>
      <div class="f-group"><label class="f-label">Password</label><div class="password-wrap"><input class="f-input" type="password" id="repPwd" placeholder="Min. 8 characters"><button class="password-toggle" onclick="togglePwd('repPwd')"><i data-lucide="eye" style="width:16px;height:16px"></i></button></div></div>
      <button class="auth-submit" style="background:linear-gradient(135deg,#2563EB,#1D4ED8)" onclick="handleRepairerApply()">Submit Application →</button>
      <p class="auth-switch" style="margin-top:14px">Already have an account? <a onclick="renderAuthForm('login')">Sign in</a></p>
    `;
  }
  if(window.lucide){
    lucide.createIcons({root: c});
  }
}

function togglePwd(id){
  var el=document.getElementById(id);
  el.type = el.type==='password' ? 'text' : 'password';
}

function selectRole(el, role){
  document.querySelectorAll('.role-pick').forEach(function(r){r.classList.remove('selected')});
  el.classList.add('selected');
}

function handleLogin(){
  showToast('<i data-lucide=\'check-circle-2\' style=\'width:18px;height:18px\'></i> Signed in successfully!');
  setTimeout(function(){enterDashboard('user')},600);
}

function handleRegister(role){
  showToast('<i data-lucide=\'party-popper\' style=\'width:18px;height:18px\'></i> Account created! Welcome to NearFix.');
  setTimeout(function(){enterDashboard(role)},700);
}

function handleRepairerApply(){
  showToast('<i data-lucide=\'clipboard\' style=\'width:18px;height:18px\'></i> Application submitted! We\'ll review and notify you.');
  setTimeout(function(){goLanding()},800);
}

// ── PAGE NAVIGATION ──
function showPage(role, page, navEl){
  var pages = document.querySelectorAll('#'+role+'Shell .page');
  pages.forEach(function(p){p.classList.remove('active')});
  var target = document.getElementById(role+'-'+page);
  if(target) target.classList.add('active');

  var titles = {
    home:'Dashboard',requests:'My Requests',post:'Post a Request',
    repairers:'Find Repairers',profile:'My Profile',editreq:'Edit Request',
    jobs:'Browse Jobs',active:'Active Jobs',wishlist:'Job Wishlist',
    history:'Job History',repairers2:'Repairer Approvals',users:'Manage Users',
    allrequests:'All Requests',categories:'Categories',reports:'Reports & Analytics'
  };
  var titleEl = document.getElementById(role+'PageTitle');
  if(titleEl) titleEl.textContent = titles[page] || page;

  if(navEl){
    document.querySelectorAll('#'+role+'Shell .nav-item').forEach(function(n){n.classList.remove('active')});
    navEl.classList.add('active');
  }
  var mc = document.querySelector('#'+role+'Shell .main');
  if(mc) mc.scrollTop = 0;
}

// ── ACTIONS ──
function setRating(val){
  currentRating = val;
  var stars = document.querySelectorAll('#starRow .star-interactive');
  stars.forEach(function(s,i){
    s.classList.toggle('active',i<val);
    s.classList.toggle('inactive',i>=val);
  });
}

function submitRating(){showToast('<i data-lucide=\'star\' style=\'width:18px;height:18px\'></i> Rating submitted — thank you!')}
function acceptJob(){showToast('<i data-lucide=\'check\' style=\'width:18px;height:18px\'></i> Job accepted! Status updated to Accepted.')}
function markComplete(){showToast('<i data-lucide=\'party-popper\' style=\'width:18px;height:18px\'></i> Job marked as Completed!')}
function markInProgress(){showToast('<i data-lucide=\'wrench\' style=\'width:18px;height:18px\'></i> Status updated to In Progress.')}
function postRequest(){
  showToast('<i data-lucide=\'check\' style=\'width:18px;height:18px\'></i> Request posted! Repairers will see it shortly.');
  setTimeout(function(){showPage('user','requests',null)},800);
}
function approveRepairer(btn){
  var card = btn.closest('.approval-card');
  showToast('<i data-lucide=\'check\' style=\'width:18px;height:18px\'></i> Repairer approved and notified via email!');
  btn.innerHTML='<i data-lucide="check" style="width:14px;height:14px;margin-right:4px"></i> Approved';btn.disabled=true;btn.style.opacity='.5';
  var rej=btn.parentElement.querySelector('.btn-danger');
  if(rej){rej.style.display='none';}
  var badge=card.querySelector('.badge-amber');
  if(badge){badge.className='badge badge-green';badge.textContent='Approved';}
  if(window.lucide) lucide.createIcons({root: card});
}
function rejectRepairer(btn){
  var card = btn.closest('.approval-card');
  showToast('<i data-lucide=\'x\' style=\'width:18px;height:18px\'></i> Repairer rejected and notified.');
  btn.innerHTML='<i data-lucide="x" style="width:14px;height:14px;margin-right:4px"></i> Rejected';btn.disabled=true;btn.style.opacity='.5';
  var apr=btn.parentElement.querySelector('.btn-primary');
  if(apr){apr.style.display='none';}
  if(window.lucide) lucide.createIcons({root: card});
}
function toggleWishlist(el){
  el.classList.toggle('saved');
  el.innerHTML = el.classList.contains('saved') ? '<i data-lucide="heart" fill="currentColor" style="width:20px;height:20px"></i>' : '<i data-lucide="heart" style="width:20px;height:20px"></i>';
  showToast(el.classList.contains('saved') ? '<i data-lucide=\'heart\' fill=\'currentColor\' style=\'width:18px;height:18px\'></i> Saved to wishlist' : '<i data-lucide=\'heart\' style=\'width:18px;height:18px\'></i> Removed from wishlist');
  if(window.lucide) lucide.createIcons({root: el});
}
function filterTab(el){
  var tabs=el.parentNode.querySelectorAll('.tab');
  tabs.forEach(function(t){t.classList.remove('active')});
  el.classList.add('active');
}

// ── MOBILE MENU ──
function toggleMobileMenu(){
  var sb = document.getElementById('adminSidebar');
  var ov = document.getElementById('sidebarOverlay');
  if(sb) sb.classList.toggle('mobile-open');
  if(ov) ov.classList.toggle('active');
}

// ── TOAST ──
function showToast(msg){
  var container = document.getElementById('toastContainer');
  var toast = document.createElement('div');
  toast.className = 'toast';
  toast.innerHTML = '<span style="display:flex;align-items:center;gap:8px">'+msg+'</span>';
  container.appendChild(toast);
  if(window.lucide) lucide.createIcons({root: toast});
  setTimeout(function(){
    toast.classList.add('toast-out');
    setTimeout(function(){if(toast.parentNode)toast.parentNode.removeChild(toast)},300);
  },2800);
}

// init auth form
renderAuthForm('login');
</script>
<script src="https://unpkg.com/lucide@latest"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    lucide.createIcons();
  });
</script>
</body>
</html>
