<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NearFix — Fix. Don't Toss.</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,600;1,9..40,300&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --g: #0A6E50;
  --g2: #17C27B;
  --g3: #E6F9F2;
  --gd: #064D38;
  --acc: #FF4D2E;
  --acc2: #FF7A5C;
  --acc-light: #FFF0ED;
  --blue: #2563EB;
  --blue-light: #EFF6FF;
  --amber: #F59E0B;
  --amber-light: #FFFBEB;
  --ink: #0D1B15;
  --ink2: #3D5A50;
  --ink3: #8BA89F;
  --surface: #FFFFFF;
  --surface2: #F5FAF7;
  --surface3: #EAEFEC;
  --border: rgba(10,110,80,0.1);
  --border2: rgba(10,110,80,0.18);
  --r: 14px;
  --r-sm: 8px;
  --r-lg: 20px;
  --r-xl: 28px;
  --shadow: 0 2px 8px rgba(0,0,0,0.06), 0 1px 2px rgba(0,0,0,0.04);
  --shadow-md: 0 4px 16px rgba(0,0,0,0.08), 0 2px 4px rgba(0,0,0,0.04);
  --shadow-lg: 0 12px 40px rgba(0,0,0,0.1), 0 4px 12px rgba(0,0,0,0.06);
  --shadow-xl: 0 24px 64px rgba(0,0,0,0.12);
  --sidebar-w: 252px;
}
body{font-family:'DM Sans',sans-serif;background:var(--surface2);color:var(--ink);min-height:100vh;line-height:1.5;-webkit-font-smoothing:antialiased}
h1,h2,h3,h4,h5{font-family:'Outfit',sans-serif;letter-spacing:-0.02em}
.mono{font-family:'Space Grotesk',monospace}

/* ──────────────────── VIEWS ──────────────────── */
.view{display:none;min-height:100vh}
.view.active{display:flex;flex-direction:column}
#auth-view.active{display:flex}

/* ──────────────────── LANDING ──────────────────── */
#landing-view{background:#fff}
.land-nav{display:flex;align-items:center;justify-content:space-between;padding:20px 48px;position:sticky;top:0;background:rgba(255,255,255,0.92);backdrop-filter:blur(20px);border-bottom:1px solid var(--border);z-index:100}
.logo{display:flex;align-items:center;gap:10px;font-family:'Outfit',sans-serif;font-weight:800;font-size:21px;color:var(--ink);text-decoration:none;letter-spacing:-0.03em}
.logo-mark{width:34px;height:34px;background:linear-gradient(135deg,var(--g),var(--g2));border-radius:10px;display:flex;align-items:center;justify-content:center}
.logo-mark svg{width:18px;height:18px;stroke:#fff;fill:none;stroke-width:2.2;stroke-linecap:round;stroke-linejoin:round}
.nav-links{display:flex;align-items:center;gap:8px}
.nav-links a{color:var(--ink2);text-decoration:none;font-size:14px;font-weight:500;padding:7px 14px;border-radius:8px;transition:all .2s}
.nav-links a:hover{background:var(--surface2);color:var(--ink)}

/* BUTTONS */
.btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:10px 20px;border-radius:10px;font-size:14px;font-weight:600;cursor:pointer;border:none;transition:all .18s;text-decoration:none;font-family:'DM Sans',sans-serif;white-space:nowrap;letter-spacing:-0.01em}
.btn-primary{background:var(--g);color:#fff;box-shadow:0 1px 2px rgba(0,0,0,.1),inset 0 1px 0 rgba(255,255,255,.1)}
.btn-primary:hover{background:var(--gd);transform:translateY(-1px);box-shadow:0 4px 12px rgba(10,110,80,.3)}
.btn-outline{background:transparent;color:var(--g);border:1.5px solid var(--g)}
.btn-outline:hover{background:var(--g3)}
.btn-ghost{background:transparent;color:var(--ink2);border:1.5px solid var(--border2)}
.btn-ghost:hover{background:var(--surface2);color:var(--ink)}
.btn-accent{background:var(--acc);color:#fff}
.btn-accent:hover{background:#e03d1f;transform:translateY(-1px);box-shadow:0 4px 12px rgba(255,77,46,.3)}
.btn-sm{padding:6px 13px;font-size:13px;border-radius:8px}
.btn-lg{padding:13px 28px;font-size:15px;border-radius:12px}
.btn-xl{padding:15px 32px;font-size:16px;border-radius:14px}
.btn-danger{background:transparent;color:#DC2626;border:1.5px solid #FCA5A5}
.btn-danger:hover{background:#FEF2F2}

/* HERO */
.hero{display:grid;grid-template-columns:1fr 1fr;gap:80px;align-items:center;padding:96px 48px 80px;max-width:1280px;margin:0 auto;width:100%}
.hero-eyebrow{display:inline-flex;align-items:center;gap:8px;background:var(--g3);color:var(--gd);padding:5px 14px;border-radius:100px;font-size:12px;font-weight:700;letter-spacing:.04em;text-transform:uppercase;margin-bottom:24px;border:1px solid rgba(10,110,80,.15)}
.hero-eyebrow-dot{width:6px;height:6px;border-radius:50%;background:var(--g2);animation:pulse 2s infinite}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.4}}
.hero h1{font-size:58px;font-weight:900;line-height:1.06;color:var(--ink);margin-bottom:20px;letter-spacing:-0.04em}
.hero h1 .gr{background:linear-gradient(135deg,var(--g),var(--g2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.hero h1 .acc-word{color:var(--acc)}
.hero-desc{font-size:17px;color:var(--ink2);line-height:1.7;margin-bottom:36px;font-weight:400}
.hero-btns{display:flex;gap:12px;flex-wrap:wrap;margin-bottom:48px}
.hero-trust{display:flex;align-items:center;gap:20px;padding-top:32px;border-top:1px solid var(--border)}
.trust-avatars{display:flex}
.trust-av{width:32px;height:32px;border-radius:50%;border:2px solid #fff;display:flex;align-items:center;justify-content:center;font-size:11px;font-weight:700;margin-left:-8px;background:var(--g3);color:var(--gd)}
.trust-av:first-child{margin-left:0}
.trust-txt{font-size:13px;color:var(--ink2);font-weight:500}
.trust-txt strong{color:var(--ink);font-weight:700}

/* HERO VISUAL */
.hero-visual{position:relative}
.demo-card{background:#fff;border-radius:20px;box-shadow:var(--shadow-xl);border:1px solid rgba(0,0,0,.06);overflow:hidden}
.demo-card-top{background:linear-gradient(135deg,#0A6E50 0%,#17C27B 100%);padding:20px 22px;color:#fff}
.demo-card-top-row{display:flex;align-items:center;justify-content:space-between;margin-bottom:4px}
.demo-card-top h3{font-size:14px;font-weight:700;opacity:.9;letter-spacing:-.01em}
.demo-pill{background:rgba(255,255,255,.2);color:#fff;padding:3px 10px;border-radius:100px;font-size:11px;font-weight:700}
.demo-card-top p{font-size:12px;opacity:.7}
.demo-body{padding:18px 22px}
.demo-status{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px}
.d-step{display:flex;flex-direction:column;align-items:center;flex:1;position:relative}
.d-step:not(:last-child)::after{content:'';position:absolute;top:13px;left:50%;width:100%;height:2px;background:var(--surface3);z-index:0}
.d-step.done:not(:last-child)::after{background:var(--g2)}
.d-dot{width:26px;height:26px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:700;position:relative;z-index:1;margin-bottom:5px}
.d-dot.done{background:var(--g2);color:#fff}
.d-dot.active{background:#fff;color:var(--g);border:2px solid var(--g);box-shadow:0 0 0 3px rgba(10,110,80,.12)}
.d-dot.idle{background:var(--surface3);color:var(--ink3)}
.d-lbl{font-size:10px;color:var(--ink3);font-weight:600}
.d-lbl.done{color:var(--g)}
.d-lbl.active{color:var(--gd)}
.demo-jobs{display:flex;flex-direction:column;gap:8px}
.demo-job{background:var(--surface2);border-radius:10px;padding:10px 12px;display:flex;align-items:center;justify-content:space-between;border:1px solid var(--border)}
.demo-job-l{display:flex;align-items:center;gap:10px}
.demo-job-icon{width:32px;height:32px;border-radius:8px;display:flex;align-items:center;justify-content:center;font-size:16px}
.demo-job-title{font-size:13px;font-weight:600;color:var(--ink)}
.demo-job-sub{font-size:11px;color:var(--ink3)}
.float-badge{position:absolute;background:#fff;border-radius:12px;box-shadow:var(--shadow-md);padding:10px 14px;border:1px solid var(--border);display:flex;align-items:center;gap:8px}
.float-badge-1{top:-18px;right:-20px}
.float-badge-2{bottom:-16px;left:-20px}
.fb-icon{font-size:20px}
.fb-main{font-size:13px;font-weight:700;color:var(--ink)}
.fb-sub{font-size:11px;color:var(--ink3)}

/* STATS STRIP */
.stats-strip{background:var(--ink);padding:32px 48px}
.stats-inner{max-width:1280px;margin:0 auto;display:grid;grid-template-columns:repeat(4,1fr);gap:32px}
.stat-box{text-align:center;padding:8px}
.stat-box .num{font-family:'Outfit',sans-serif;font-size:36px;font-weight:900;color:#fff;letter-spacing:-.04em;line-height:1}
.stat-box .lbl{font-size:13px;color:rgba(255,255,255,.5);margin-top:6px;font-weight:500}
.stat-box .gr2{background:linear-gradient(90deg,#17C27B,#52F0B1);-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}

/* HOW IT WORKS */
.how-section{padding:80px 48px;max-width:1280px;margin:0 auto;width:100%}
.section-label{font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.08em;color:var(--g);margin-bottom:12px}
.section-h{font-size:40px;font-weight:800;color:var(--ink);margin-bottom:16px;letter-spacing:-.03em}
.section-sub{font-size:16px;color:var(--ink2);max-width:500px;line-height:1.7}
.steps-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:24px;margin-top:48px}
.step-card{background:#fff;border-radius:20px;padding:32px 28px;border:1px solid var(--border);position:relative;overflow:hidden;transition:all .25s}
.step-card:hover{transform:translateY(-4px);box-shadow:var(--shadow-lg)}
.step-n{font-family:'Outfit',sans-serif;font-size:64px;font-weight:900;position:absolute;top:-8px;right:16px;color:var(--surface2);letter-spacing:-.04em;line-height:1;user-select:none}
.step-icon{width:52px;height:52px;border-radius:14px;display:flex;align-items:center;justify-content:center;font-size:24px;margin-bottom:20px}
.step-card h3{font-size:18px;font-weight:700;margin-bottom:8px;color:var(--ink)}
.step-card p{font-size:14px;color:var(--ink2);line-height:1.65}

/* ROLE SECTION */
.role-section{padding:80px 48px;background:var(--ink)}
.role-inner{max-width:1280px;margin:0 auto}
.role-label{color:var(--g2);font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.08em;margin-bottom:12px}
.role-h{font-size:40px;font-weight:800;color:#fff;margin-bottom:48px;letter-spacing:-.03em}
.role-cards{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
.role-card{background:rgba(255,255,255,.04);border:1px solid rgba(255,255,255,.08);border-radius:20px;padding:36px 28px;cursor:pointer;transition:all .25s;position:relative;overflow:hidden}
.role-card::before{content:'';position:absolute;inset:0;opacity:0;transition:opacity .3s}
.role-card.green::before{background:linear-gradient(135deg,rgba(10,110,80,.15),rgba(23,194,123,.08))}
.role-card.blue::before{background:linear-gradient(135deg,rgba(37,99,235,.15),rgba(96,165,250,.08))}
.role-card.orange::before{background:linear-gradient(135deg,rgba(255,77,46,.15),rgba(255,122,92,.08))}
.role-card:hover{border-color:rgba(255,255,255,.2);transform:translateY(-4px)}
.role-card:hover::before{opacity:1}
.role-icon-wrap{width:60px;height:60px;border-radius:16px;margin-bottom:20px;display:flex;align-items:center;justify-content:center;font-size:28px}
.role-icon-wrap.green{background:rgba(23,194,123,.15)}
.role-icon-wrap.blue{background:rgba(37,99,235,.15)}
.role-icon-wrap.orange{background:rgba(255,77,46,.15)}
.role-card h3{font-size:20px;font-weight:800;color:#fff;margin-bottom:8px;letter-spacing:-.02em}
.role-card p{font-size:14px;color:rgba(255,255,255,.5);line-height:1.65;margin-bottom:24px}
.role-tag{font-size:11px;font-weight:700;padding:4px 12px;border-radius:100px;letter-spacing:.04em;text-transform:uppercase}
.role-tag.green{background:rgba(23,194,123,.15);color:#17C27B}
.role-tag.blue{background:rgba(37,99,235,.15);color:#60A5FA}
.role-tag.orange{background:rgba(255,77,46,.15);color:#FF7A5C}
.role-arrow{position:absolute;bottom:28px;right:28px;width:36px;height:36px;border-radius:50%;background:rgba(255,255,255,.07);display:flex;align-items:center;justify-content:center;color:rgba(255,255,255,.4);transition:all .2s;font-size:16px}
.role-card:hover .role-arrow{background:rgba(255,255,255,.15);color:#fff}

/* FOOTER */
.land-footer{background:var(--ink);border-top:1px solid rgba(255,255,255,.06);padding:24px 48px;display:flex;align-items:center;justify-content:space-between}
.land-footer p{color:rgba(255,255,255,.35);font-size:13px}
.land-footer .impact{display:flex;align-items:center;gap:8px;color:var(--g2);font-size:13px;font-weight:600}

/* ──────────────────── AUTH SCREEN ──────────────────── */
#auth-view{background:#fff;align-items:stretch;min-height:100vh}
.auth-split{display:grid;grid-template-columns:1fr 1fr;min-height:100vh;width:100%}
.auth-left{background:linear-gradient(150deg,#0A3D2B 0%,#0A6E50 40%,#17C27B 100%);padding:60px;display:flex;flex-direction:column;justify-content:space-between;position:relative;overflow:hidden}
.auth-left::before{content:'';position:absolute;inset:0;background:url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")}
.auth-left-content{position:relative;z-index:1}
.auth-logo{display:flex;align-items:center;gap:10px;font-family:'Outfit',sans-serif;font-weight:800;font-size:20px;color:#fff;margin-bottom:64px;letter-spacing:-.03em}
.auth-logo-mark{width:32px;height:32px;background:rgba(255,255,255,.2);backdrop-filter:blur(10px);border-radius:9px;display:flex;align-items:center;justify-content:center;border:1px solid rgba(255,255,255,.3)}
.auth-logo-mark svg{width:16px;height:16px;stroke:#fff;fill:none;stroke-width:2.2;stroke-linecap:round;stroke-linejoin:round}
.auth-headline{font-size:48px;font-weight:900;color:#fff;line-height:1.08;letter-spacing:-.04em;margin-bottom:20px}
.auth-headline .underline-acc{position:relative;display:inline-block}
.auth-headline .underline-acc::after{content:'';position:absolute;bottom:-4px;left:0;right:0;height:3px;background:rgba(255,255,255,.4);border-radius:2px}
.auth-tagline{font-size:16px;color:rgba(255,255,255,.65);line-height:1.7;max-width:340px}
.auth-features{margin-top:48px;display:flex;flex-direction:column;gap:16px}
.auth-feat{display:flex;align-items:center;gap:14px}
.auth-feat-icon{width:36px;height:36px;background:rgba(255,255,255,.1);border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:16px;flex-shrink:0;border:1px solid rgba(255,255,255,.15)}
.auth-feat-text{font-size:14px;color:rgba(255,255,255,.75);font-weight:500}
.auth-left-footer{position:relative;z-index:1}
.auth-left-footer p{font-size:12px;color:rgba(255,255,255,.35)}
.auth-impact{display:inline-flex;align-items:center;gap:8px;background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.15);border-radius:10px;padding:12px 16px;margin-top:12px}
.auth-impact-num{font-family:'Outfit',sans-serif;font-size:24px;font-weight:800;color:#fff}
.auth-impact-label{font-size:12px;color:rgba(255,255,255,.6)}

.auth-right{display:flex;align-items:center;justify-content:center;padding:60px;background:#fff;position:relative}
.auth-form-wrap{width:100%;max-width:400px}
.auth-form-back{position:absolute;top:24px;left:24px;display:flex;align-items:center;gap:6px;font-size:13px;color:var(--ink3);cursor:pointer;padding:8px 12px;border-radius:8px;transition:all .2s;font-weight:500}
.auth-form-back:hover{background:var(--surface2);color:var(--ink)}
.auth-form-back svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.auth-tabs{display:flex;background:var(--surface2);border-radius:11px;padding:4px;gap:4px;margin-bottom:32px}
.auth-tab{flex:1;padding:9px;text-align:center;border-radius:8px;font-size:13px;font-weight:600;cursor:pointer;color:var(--ink3);transition:all .2s}
.auth-tab.active{background:#fff;color:var(--ink);box-shadow:var(--shadow)}
.auth-form-title{font-size:28px;font-weight:800;color:var(--ink);letter-spacing:-.03em;margin-bottom:6px}
.auth-form-sub{font-size:14px;color:var(--ink3);margin-bottom:28px;line-height:1.6}
.role-picker{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-bottom:24px}
.role-pick{border:1.5px solid var(--border2);border-radius:11px;padding:14px 12px;text-align:center;cursor:pointer;transition:all .2s}
.role-pick:hover{border-color:var(--g);background:var(--g3)}
.role-pick.selected{border-color:var(--g);background:var(--g3)}
.role-pick .rp-icon{font-size:24px;margin-bottom:6px}
.role-pick .rp-name{font-size:12px;font-weight:700;color:var(--ink)}
.role-pick .rp-sub{font-size:11px;color:var(--ink3);margin-top:2px}
.f-group{margin-bottom:18px}
.f-label{font-size:13px;font-weight:600;color:var(--ink2);display:block;margin-bottom:7px}
.f-input{width:100%;padding:11px 14px;border-radius:10px;border:1.5px solid var(--border2);font-size:14px;font-family:'DM Sans',sans-serif;color:var(--ink);background:#fff;transition:all .2s;outline:none}
.f-input:focus{border-color:var(--g);box-shadow:0 0 0 3px rgba(10,110,80,.1)}
.f-input::placeholder{color:var(--ink3)}
select.f-input{cursor:pointer;appearance:none;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%238BA89F' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");background-repeat:no-repeat;background-position:right 14px center}
textarea.f-input{resize:vertical;min-height:80px}
.f-row{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.f-hint{font-size:12px;color:var(--ink3);margin-top:5px}
.auth-submit{width:100%;padding:13px;border-radius:11px;font-size:15px;font-weight:700;cursor:pointer;border:none;background:linear-gradient(135deg,var(--g),#14a869);color:#fff;transition:all .2s;font-family:'DM Sans',sans-serif;letter-spacing:-.01em;position:relative;overflow:hidden;margin-top:8px}
.auth-submit:hover{transform:translateY(-1px);box-shadow:0 6px 20px rgba(10,110,80,.3)}
.auth-submit::after{content:'→';margin-left:8px}
.auth-divider{text-align:center;color:var(--ink3);font-size:13px;margin:20px 0;position:relative}
.auth-divider::before,.auth-divider::after{content:'';position:absolute;top:50%;width:42%;height:1px;background:var(--border2)}
.auth-divider::before{left:0}
.auth-divider::after{right:0}
.auth-switch{text-align:center;font-size:13px;color:var(--ink3);margin-top:16px}
.auth-switch a{color:var(--g);font-weight:600;cursor:pointer;text-decoration:none}
.auth-switch a:hover{text-decoration:underline}
.password-wrap{position:relative}
.password-toggle{position:absolute;right:12px;top:50%;transform:translateY(-50%);cursor:pointer;color:var(--ink3);background:none;border:none;padding:4px;display:flex;align-items:center;font-size:13px}
.password-toggle:hover{color:var(--ink)}

/* ──────────────────── SHELL ──────────────────── */
.shell-view{display:none;min-height:100vh}
.shell-view.active{display:flex}
.sidebar{width:var(--sidebar-w);background:#fff;border-right:1px solid var(--border);display:flex;flex-direction:column;position:fixed;top:0;left:0;height:100vh;z-index:100;overflow-y:auto}
.sb-logo{padding:22px 20px 18px;border-bottom:1px solid var(--border)}
.sb-logo .logo{font-size:18px}
.sb-nav{padding:14px 10px;flex:1}
.nav-section{margin-bottom:20px}
.nav-section-label{font-size:10px;font-weight:700;text-transform:uppercase;letter-spacing:.12em;color:var(--ink3);padding:0 12px;margin-bottom:6px}
.nav-item{display:flex;align-items:center;gap:10px;padding:9px 12px;border-radius:10px;color:var(--ink2);font-size:13.5px;font-weight:500;cursor:pointer;transition:all .15s;text-decoration:none;margin-bottom:1px;position:relative}
.nav-item svg{width:17px;height:17px;flex-shrink:0;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.nav-item:hover{background:var(--surface2);color:var(--ink)}
.nav-item.active{background:var(--g3);color:var(--gd);font-weight:600}
.nav-badge{margin-left:auto;background:var(--g);color:#fff;padding:2px 8px;border-radius:100px;font-size:10px;font-weight:700}
.sb-user{padding:14px;border-top:1px solid var(--border);background:var(--surface2)}
.sb-user-row{display:flex;align-items:center;gap:10px}
.av{width:34px;height:34px;border-radius:9px;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:700;flex-shrink:0}
.av-g{background:var(--g3);color:var(--gd)}
.av-b{background:#EFF6FF;color:#1D4ED8}
.av-o{background:#FFF7ED;color:#C2410C}
.av-name{font-size:13px;font-weight:600;color:var(--ink)}
.av-role{font-size:11px;color:var(--ink3)}

.main{margin-left:var(--sidebar-w);flex:1;display:flex;flex-direction:column;min-height:100vh}
.topbar{background:#fff;border-bottom:1px solid var(--border);padding:14px 32px;display:flex;align-items:center;justify-content:space-between;position:sticky;top:0;z-index:50;gap:16px}
.topbar-title{font-family:'Outfit',sans-serif;font-size:19px;font-weight:700;color:var(--ink);letter-spacing:-.02em}
.topbar-right{display:flex;align-items:center;gap:10px}
.search-box{display:flex;align-items:center;gap:8px;background:var(--surface2);border-radius:10px;padding:8px 14px;border:1px solid var(--border);max-width:220px}
.search-box input{background:none;border:none;outline:none;font-size:13px;color:var(--ink);font-family:'DM Sans',sans-serif;width:160px}
.search-box svg{width:15px;height:15px;stroke:var(--ink3);flex-shrink:0;fill:none;stroke-width:2;stroke-linecap:round}
.icon-btn{width:36px;height:36px;border-radius:9px;border:1px solid var(--border2);background:transparent;cursor:pointer;display:flex;align-items:center;justify-content:center;transition:all .15s;color:var(--ink2);position:relative}
.icon-btn svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.icon-btn:hover{background:var(--surface2);border-color:var(--g);color:var(--g)}
.notif-dot{position:absolute;top:7px;right:7px;width:7px;height:7px;background:var(--acc);border-radius:50%;border:1.5px solid #fff}
.page-content{padding:28px 32px;flex:1}
.page{display:none}
.page.active{display:block;animation:fadeIn .2s ease}
@keyframes fadeIn{from{opacity:0;transform:translateY(4px)}to{opacity:1;transform:translateY(0)}}

/* ──────────────────── COMPONENTS ──────────────────── */
.card{background:#fff;border-radius:var(--r);border:1px solid var(--border);padding:24px}
.card-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:20px}
.card-title{font-size:15px;font-weight:700;color:var(--ink);font-family:'Outfit',sans-serif}
.card-sub{font-size:12px;color:var(--ink3);margin-top:2px}

.metrics{display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:14px;margin-bottom:24px}
.metric{background:#fff;border-radius:var(--r);border:1px solid var(--border);padding:20px;transition:all .2s}
.metric:hover{box-shadow:var(--shadow-md);transform:translateY(-1px)}
.metric-label{font-size:11px;color:var(--ink3);font-weight:700;text-transform:uppercase;letter-spacing:.06em;margin-bottom:10px}
.metric-val{font-family:'Outfit',sans-serif;font-size:30px;font-weight:800;color:var(--ink);letter-spacing:-.04em;line-height:1}
.metric-sub{font-size:12px;color:var(--ink3);margin-top:6px}
.metric-up{color:var(--g);font-weight:600}
.metric-icon{float:right;width:36px;height:36px;border-radius:9px;display:flex;align-items:center;justify-content:center;font-size:18px}

/* BADGES */
.badge{display:inline-flex;align-items:center;padding:3px 9px;border-radius:100px;font-size:11px;font-weight:700;letter-spacing:.01em}
.badge-green{background:#DCFCE7;color:#15803D}
.badge-amber{background:#FEF9C3;color:#854D0E}
.badge-blue{background:#DBEAFE;color:#1D4ED8}
.badge-red{background:#FEE2E2;color:#B91C1C}
.badge-gray{background:var(--surface3);color:var(--ink3)}
.badge-purple{background:#F3E8FF;color:#7C3AED}

/* PILLS */
.pill{display:inline-flex;align-items:center;padding:4px 10px;border-radius:6px;font-size:11px;font-weight:700}
.pill-success{background:var(--g3);color:var(--gd)}
.pill-warn{background:#FFFBEB;color:#92400E}
.pill-danger{background:#FEE2E2;color:#B91C1C}

/* TABLES */
.table-wrap{border-radius:var(--r);border:1px solid var(--border);overflow:hidden}
table{width:100%;border-collapse:collapse}
thead th{background:var(--surface2);font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:.06em;color:var(--ink3);padding:10px 16px;text-align:left;border-bottom:1px solid var(--border)}
tbody td{padding:13px 16px;font-size:13.5px;color:var(--ink);border-bottom:1px solid var(--border)}
tbody tr:last-child td{border-bottom:none}
tbody tr:hover td{background:var(--surface2)}

/* STATUS TRACKER */
.status-track{display:flex;align-items:center}
.st-step{display:flex;flex-direction:column;align-items:center;flex:1;position:relative}
.st-step:not(:last-child)::after{content:'';position:absolute;top:13px;left:50%;width:100%;height:2px;background:var(--surface3);z-index:0}
.st-step.done:not(:last-child)::after{background:var(--g2)}
.st-dot{width:26px;height:26px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:700;position:relative;z-index:1;margin-bottom:5px;transition:all .2s}
.st-dot.done{background:var(--g2);color:#fff}
.st-dot.active{background:#fff;color:var(--g);border:2px solid var(--g);box-shadow:0 0 0 3px rgba(10,110,80,.1)}
.st-dot.idle{background:var(--surface3);color:var(--ink3)}
.st-lbl{font-size:10px;font-weight:600;color:var(--ink3);text-align:center}
.st-lbl.done{color:var(--g)}
.st-lbl.active{color:var(--gd)}

/* REQUEST CARDS */
.req-card{background:#fff;border-radius:var(--r);border:1px solid var(--border);padding:20px;margin-bottom:12px;transition:all .2s;position:relative}
.req-card:hover{box-shadow:var(--shadow-md);border-color:rgba(10,110,80,.2)}
.req-card-header{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:12px}
.req-title{font-size:15px;font-weight:700;color:var(--ink);font-family:'Outfit',sans-serif;letter-spacing:-.02em}
.req-meta{display:flex;gap:6px;align-items:center;flex-wrap:wrap;margin-top:5px}
.req-desc{font-size:13.5px;color:var(--ink2);line-height:1.6;margin-bottom:14px}
.req-footer{display:flex;align-items:center;justify-content:space-between;margin-top:14px;padding-top:12px;border-top:1px solid var(--border)}
.req-assignee{display:flex;align-items:center;gap:8px;font-size:13px;color:var(--ink2)}

/* STARS */
.stars{display:flex;gap:2px;align-items:center}
.star{color:#F59E0B;font-size:14px}
.star.empty{color:var(--border2)}
.star-interactive{cursor:pointer;font-size:22px;transition:transform .1s}
.star-interactive:hover{transform:scale(1.15)}
.star-interactive.active{color:#F59E0B}
.star-interactive.inactive{color:var(--surface3)}

/* TABS */
.tab-bar{display:flex;gap:4px;margin-bottom:20px;background:var(--surface2);padding:4px;border-radius:11px;width:fit-content}
.tab{padding:7px 16px;border-radius:8px;font-size:13px;font-weight:600;cursor:pointer;color:var(--ink3);transition:all .2s;white-space:nowrap}
.tab.active{background:#fff;color:var(--ink);box-shadow:var(--shadow)}
.tab:hover:not(.active){color:var(--ink2)}

/* FORMS */
.form-group{margin-bottom:18px}
.form-label{font-size:13px;font-weight:600;color:var(--ink2);display:block;margin-bottom:7px}
.form-input{width:100%;padding:11px 14px;border-radius:10px;border:1.5px solid var(--border2);font-size:14px;font-family:'DM Sans',sans-serif;color:var(--ink);background:#fff;transition:all .2s;outline:none}
.form-input:focus{border-color:var(--g);box-shadow:0 0 0 3px rgba(10,110,80,.08)}
.form-input::placeholder{color:var(--ink3)}
select.form-input{cursor:pointer;appearance:none;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%238BA89F' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");background-repeat:no-repeat;background-position:right 14px center}
textarea.form-input{resize:vertical;min-height:90px}
.form-row{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.form-hint{font-size:12px;color:var(--ink3);margin-top:4px}
.form-actions{display:flex;gap:10px;margin-top:24px;padding-top:20px;border-top:1px solid var(--border)}

/* IMPACT BANNER */
.impact-banner{background:linear-gradient(135deg,#064D38,#0A6E50 50%,#17C27B);border-radius:18px;padding:28px 32px;display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;color:#fff;overflow:hidden;position:relative}
.impact-banner::before{content:'';position:absolute;right:-40px;top:-40px;width:200px;height:200px;border-radius:50%;background:rgba(255,255,255,.05)}
.impact-num{font-family:'Outfit',sans-serif;font-size:44px;font-weight:900;letter-spacing:-.04em;line-height:1}
.impact-label{font-size:14px;opacity:.8;margin-top:4px}
.impact-right p{font-size:14px;opacity:.7;max-width:260px;line-height:1.6}

/* SEARCH & FILTER */
.search-filter-row{display:flex;gap:10px;align-items:center;margin-bottom:20px;flex-wrap:wrap}
.search-filter-input{flex:1;min-width:200px;display:flex;align-items:center;gap:8px;background:#fff;border-radius:10px;padding:10px 14px;border:1.5px solid var(--border2)}
.search-filter-input input{border:none;outline:none;font-size:14px;color:var(--ink);font-family:'DM Sans',sans-serif;width:100%}
.search-filter-input svg{width:16px;height:16px;stroke:var(--ink3);fill:none;stroke-width:2;flex-shrink:0;stroke-linecap:round}

/* WISHLIST HEART */
.wl-heart{font-size:20px;cursor:pointer;color:var(--ink3);transition:all .2s;line-height:1}
.wl-heart.saved,.wl-heart:hover{color:var(--acc)}

/* REPAIRER CARDS */
.repairer-card{background:#fff;border-radius:var(--r);border:1px solid var(--border);padding:20px;display:flex;gap:16px;align-items:flex-start;margin-bottom:12px;transition:all .2s}
.repairer-card:hover{box-shadow:var(--shadow-md);border-color:rgba(10,110,80,.2)}
.rep-av{width:52px;height:52px;border-radius:14px;display:flex;align-items:center;justify-content:center;font-size:18px;font-weight:700;flex-shrink:0}
.rep-info{flex:1}
.rep-name{font-size:15px;font-weight:700;color:var(--ink);font-family:'Outfit',sans-serif;letter-spacing:-.02em}
.rep-skill{font-size:12px;color:var(--ink3);margin-top:2px}
.rep-meta{display:flex;gap:12px;margin-top:8px;flex-wrap:wrap}
.rep-meta-item{display:flex;align-items:center;gap:4px;font-size:12px;color:var(--ink2)}
.rep-meta-item svg{width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2}

/* ADMIN */
.approval-card{background:#fff;border-radius:var(--r);border:1px solid var(--border);padding:20px;margin-bottom:12px}

/* TOAST */
.toast-container{position:fixed;bottom:24px;right:24px;z-index:9999;display:flex;flex-direction:column;gap:8px}
.toast{background:var(--ink);color:#fff;padding:12px 20px;border-radius:12px;font-size:14px;font-weight:500;box-shadow:var(--shadow-lg);display:flex;align-items:center;gap:10px;animation:toastIn .3s ease;max-width:340px}
@keyframes toastIn{from{opacity:0;transform:translateY(16px)}to{opacity:1;transform:translateY(0)}}
.toast-icon{font-size:18px}
.toast.toast-out{animation:toastOut .3s ease forwards}
@keyframes toastOut{to{opacity:0;transform:translateY(8px)}}

/* PROFILE */
.profile-hero{background:linear-gradient(135deg,var(--g),#17C27B);border-radius:18px;padding:32px;margin-bottom:20px;display:flex;align-items:center;gap:24px;color:#fff}
.profile-av-big{width:72px;height:72px;border-radius:18px;background:rgba(255,255,255,.2);border:2px solid rgba(255,255,255,.3);display:flex;align-items:center;justify-content:center;font-size:26px;font-weight:800;font-family:'Outfit',sans-serif}
.profile-name{font-size:22px;font-weight:800;letter-spacing:-.03em;font-family:'Outfit',sans-serif}
.profile-email{font-size:14px;opacity:.75;margin-top:3px}
.profile-verified{display:inline-flex;align-items:center;gap:5px;background:rgba(255,255,255,.15);border-radius:100px;padding:4px 12px;font-size:12px;font-weight:700;margin-top:10px;border:1px solid rgba(255,255,255,.25)}

/* GRID UTILS */
.g2{display:grid;grid-template-columns:1fr 1fr;gap:20px}
.g3{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
.page-head{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:24px}
.page-head h2{font-size:22px;font-weight:800;color:var(--ink);letter-spacing:-.03em;font-family:'Outfit',sans-serif}
.page-head p{font-size:14px;color:var(--ink3);margin-top:3px}

/* CHART BAR */
.chart-bar-wrap{display:flex;flex-direction:column;gap:10px}
.chart-bar-row{display:flex;align-items:center;gap:12px}
.chart-bar-label{font-size:12px;color:var(--ink2);font-weight:600;min-width:80px;text-align:right}
.chart-bar-track{flex:1;background:var(--surface2);border-radius:100px;height:8px;overflow:hidden}
.chart-bar-fill{height:100%;border-radius:100px;transition:width .5s ease}
.chart-bar-val{font-size:12px;color:var(--ink3);min-width:30px;font-weight:600}

/* EMPTY STATE */
.empty{text-align:center;padding:48px 24px;color:var(--ink3)}
.empty-icon{font-size:40px;margin-bottom:12px}
.empty h3{font-size:16px;font-weight:700;color:var(--ink2);margin-bottom:6px}
.empty p{font-size:14px;line-height:1.6}

/* SCROLLBAR */
::-webkit-scrollbar{width:6px}
::-webkit-scrollbar-track{background:transparent}
::-webkit-scrollbar-thumb{background:var(--border2);border-radius:100px}
::-webkit-scrollbar-thumb:hover{background:var(--ink3)}

/* RESPONSIVE basic */
@media(max-width:768px){
  .auth-split{grid-template-columns:1fr}.auth-left{display:none}
  .hero{grid-template-columns:1fr;gap:40px;padding:48px 24px}.hero-visual{display:none}
  .stats-inner{grid-template-columns:1fr 1fr}.role-cards{grid-template-columns:1fr}
  .steps-grid{grid-template-columns:1fr}
  .sidebar{transform:translateX(-100%)}.main{margin-left:0}
}
</style>
</head>
<body>
<div class="shell-view active" id="adminShell">
  <aside class="sidebar">
    <div class="sb-logo"><div class="logo" style="font-size:17px"><div class="logo-mark" style="width:30px;height:30px;background:linear-gradient(135deg,var(--acc),var(--acc2))"><svg viewBox="0 0 24 24" width="15" height="15"><path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/></svg></div>NearFix Admin</div></div>
    <nav class="sb-nav">
      <div class="nav-section">
        <div class="nav-section-label">Management</div>
        <a class="nav-item ${activeTab == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/dashboard">
          <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>Overview
        </a>
        <a class="nav-item ${activeTab == 'repairers' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/repairers">
          <svg viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>Approve Repairers<span class="nav-badge" style="background:var(--acc)">3</span>
        </a>
        <a class="nav-item ${activeTab == 'users' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/users">
          <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>Manage Users
        </a>
        <a class="nav-item ${activeTab == 'requests' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/requests">
          <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>All Requests
        </a>
        <a class="nav-item ${activeTab == 'categories' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/categories">
          <svg viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>Categories
        </a>
        <a class="nav-item ${activeTab == 'reports' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/reports">
          <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>Reports & Analytics
        </a>
      </div>
      <div class="nav-section">
        <a class="nav-item" href="${pageContext.request.contextPath}/logout">
          <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Sign out
        </a>
      </div>
    </nav>
    <div class="sb-user"><div class="sb-user-row"><div class="av av-o">AD</div><div><div class="av-name">Admin</div><div class="av-role">Platform operator</div></div></div></div>
  </aside>
  <div class="main">
    <div class="topbar">
      <div class="topbar-title" id="adminPageTitle">${pageTitle}</div>
      <div class="topbar-right"><button class="icon-btn"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg></button></div>
    </div>
    <div class="page-content">
