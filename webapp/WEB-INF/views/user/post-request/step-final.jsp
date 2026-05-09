<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="step-3" class="step-hidden">
  <h2 class="text-xl font-bold text-dark mb-6">Final Details</h2>
  <div class="flex flex-col gap-8 mb-10">
    <div>
      <label
        class="text-[13px] font-bold text-muted-dark uppercase tracking-wider mb-4 block"
        >How urgent is this?</label
      >
      <div class="grid grid-cols-3 gap-3">
        <label class="cursor-pointer">
          <input
            type="radio"
            name="urgency"
            value="NORMAL"
            class="hidden"
            checked
            onchange="updatePreview('urgency', 'Normal')"
          />
          <div
            class="py-4 border border-border rounded-2xl text-center text-sm font-bold hover:bg-muted-light transition-all"
          >
            Normal
          </div>
        </label>
        <label class="cursor-pointer">
          <input
            type="radio"
            name="urgency"
            value="URGENT"
            class="hidden"
            onchange="updatePreview('urgency', 'Urgent')"
          />
          <div
            class="py-4 border border-border rounded-2xl text-center text-sm font-bold hover:bg-muted-light transition-all"
          >
            Urgent
          </div>
        </label>
        <label class="cursor-pointer">
          <input
            type="radio"
            name="urgency"
            value="EMERGENCY"
            class="hidden"
            onchange="updatePreview('urgency', 'Emergency')"
          />
          <div
            class="py-4 border border-border rounded-2xl text-center text-sm font-bold hover:bg-muted-light transition-all"
          >
            Emergency
          </div>
        </label>
      </div>
    </div>
    <div>
      <label
        class="text-[13px] font-bold text-muted-dark uppercase tracking-wider mb-2 block"
        >Your Location</label
      >
      <div class="relative">
        <input
          type="text"
          name="location"
          class="w-full bg-background border border-border rounded-2xl px-12 py-4 outline-none focus:border-primary focus:bg-white transition-all text-[15px]"
          placeholder="e.g. Kathmandu, Nepal"
        />
        <svg
          class="w-5 h-5 absolute left-4 top-1/2 -translate-y-1/2 text-muted"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
        >
          <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
          <circle cx="12" cy="10" r="3"></circle>
        </svg>
      </div>
    </div>
  </div>
  <div class="flex items-center justify-between">
    <button
      type="button"
      onclick="nextStep(2)"
      class="text-muted-dark font-bold text-sm hover:text-dark transition-colors"
    >
      ← Back
    </button>
    <button
      type="submit"
      class="bg-primary text-white px-10 py-4 rounded-2xl font-bold text-sm shadow-xl shadow-primary/30 hover:scale-[1.02] active:scale-[0.98] transition-all"
    >
      Post Request ✨
    </button>
  </div>
</div>
