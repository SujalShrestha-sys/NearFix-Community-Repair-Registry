<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp" />

<div class="page active" id="admin-repairers">
        <div class="page-head"><div><h2>Approve Repairers</h2><p>Review and approve repairer registrations</p></div></div>
        <div class="approval-card">
          <div class="flex-row-resp">
            <div style="display:flex;gap:14px;flex:1">
              <div class="av av-g" style="width:48px;height:48px;font-size:16px;flex-shrink:0">NK</div>
              <div>
                <div style="font-size:16px;font-weight:700;font-family:Outfit,sans-serif">Nabin KC</div>
                <div style="font-size:13px;color:var(--ink3);margin-top:2px">nabin@email.com · +977 9847123456</div>
                <div style="display:flex;gap:8px;margin-top:8px;flex-wrap:wrap">
                  <span class="badge badge-blue">Electronics</span>
                  <span class="badge badge-gray">5 years exp.</span>
                  <span class="badge badge-gray"><i data-lucide="map-pin" style="width:12px;height:12px;margin-right:4px"></i> Baneshwor</span>
                  <span class="badge badge-amber">Pending</span>
                </div>
                <div style="margin-top:10px;font-size:13px;color:var(--ink2);line-height:1.6;background:var(--surface2);padding:10px 12px;border-radius:8px;border:1px solid var(--border)">
                  "Experienced in smartphone and laptop repair. Have my own shop in Baneshwor market."
                </div>
              </div>
            </div>
            <div style="display:flex;flex-direction:column;gap:8px">
              <button class="btn btn-primary btn-sm" onclick="approveRepairer(this)"><i data-lucide="check" style="width:14px;height:14px"></i> Approve</button>
              <button class="btn btn-danger btn-sm" onclick="rejectRepairer(this)"><i data-lucide="x" style="width:14px;height:14px"></i> Reject</button>
            </div>
          </div>
        </div>
        <div class="approval-card">
          <div class="flex-row-resp">
            <div style="display:flex;gap:14px;flex:1">
              <div class="av av-b" style="width:48px;height:48px;font-size:16px;flex-shrink:0">SP</div>
              <div>
                <div style="font-size:16px;font-weight:700;font-family:Outfit,sans-serif">Sunita Pant</div>
                <div style="font-size:13px;color:var(--ink3);margin-top:2px">sunita.pant@gmail.com · +977 9843000001</div>
                <div style="display:flex;gap:8px;margin-top:8px;flex-wrap:wrap">
                  <span class="badge badge-purple">Clothing & Footwear</span>
                  <span class="badge badge-gray">8 years exp.</span>
                  <span class="badge badge-gray"><i data-lucide="map-pin" style="width:12px;height:12px;margin-right:4px"></i> Kalimati</span>
                  <span class="badge badge-amber">Pending</span>
                </div>
                <div style="margin-top:10px;font-size:13px;color:var(--ink2);line-height:1.6;background:var(--surface2);padding:10px 12px;border-radius:8px;border:1px solid var(--border)">
                  "Tailor with 8 years of experience. Specialise in alterations, zip replacement, and leather repair."
                </div>
              </div>
            </div>
            <div style="display:flex;flex-direction:column;gap:8px">
              <button class="btn btn-primary btn-sm" onclick="approveRepairer(this)"><i data-lucide="check" style="width:14px;height:14px"></i> Approve</button>
              <button class="btn btn-danger btn-sm" onclick="rejectRepairer(this)"><i data-lucide="x" style="width:14px;height:14px"></i> Reject</button>
            </div>
          </div>
        </div>
        <div class="approval-card">
          <div class="flex-row-resp">
            <div style="display:flex;gap:14px;flex:1">
              <div class="av av-o" style="width:48px;height:48px;font-size:16px;flex-shrink:0">HT</div>
              <div>
                <div style="font-size:16px;font-weight:700;font-family:Outfit,sans-serif">Hari Thapa</div>
                <div style="font-size:13px;color:var(--ink3);margin-top:2px">hari.thapa@email.com · +977 9841777888</div>
                <div style="display:flex;gap:8px;margin-top:8px;flex-wrap:wrap">
                  <span class="badge badge-amber">Furniture</span>
                  <span class="badge badge-gray">15 years exp.</span>
                  <span class="badge badge-gray"><i data-lucide="map-pin" style="width:12px;height:12px;margin-right:4px"></i> Patan</span>
                  <span class="badge badge-amber">Pending</span>
                </div>
                <div style="margin-top:10px;font-size:13px;color:var(--ink2);line-height:1.6;background:var(--surface2);padding:10px 12px;border-radius:8px;border:1px solid var(--border)">
                  "Carpenter and furniture restorer. 15 years in antique and modern furniture repair. Patan-based workshop."
                </div>
              </div>
            </div>
            <div style="display:flex;flex-direction:column;gap:8px">
              <button class="btn btn-primary btn-sm" onclick="approveRepairer(this)"><i data-lucide="check" style="width:14px;height:14px"></i> Approve</button>
              <button class="btn btn-danger btn-sm" onclick="rejectRepairer(this)"><i data-lucide="x" style="width:14px;height:14px"></i> Reject</button>
            </div>
          </div>
        </div>
      </div>

<jsp:include page="layout/footer.jsp" />
