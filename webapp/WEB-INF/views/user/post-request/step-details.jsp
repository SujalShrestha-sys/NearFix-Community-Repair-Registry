<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="step-2" class="step-hidden">
    <h2 class="text-xl font-bold text-dark mb-6">Describe the problem</h2>
    <div class="flex flex-col gap-6 mb-10">
        <div>
            <label class="text-[13px] font-bold text-muted-dark uppercase tracking-wider mb-2 block">Item Name</label>
            <input type="text" name="itemName" id="itemNameInput" oninput="updatePreview('name', this.value)" class="w-full bg-background border border-border rounded-2xl px-5 py-4 outline-none focus:border-primary focus:bg-white transition-all text-[15px]" placeholder="e.g. iPhone 13 Pro Screen">
        </div>
        <div>
            <label class="text-[13px] font-bold text-muted-dark uppercase tracking-wider mb-2 block">Description</label>
            <textarea name="description" id="descInput" oninput="updatePreview('desc', this.value)" class="w-full bg-background border border-border rounded-2xl px-5 py-4 outline-none focus:border-primary focus:bg-white transition-all text-[15px] min-h-[150px] resize-none" placeholder="What's broken? How did it happen?"></textarea>
        </div>
    </div>
    <div class="flex items-center justify-between">
        <button type="button" onclick="nextStep(1)" class="text-muted-dark font-bold text-sm hover:text-dark transition-colors">← Back</button>
        <button type="button" onclick="nextStep(3)" class="bg-primary text-white px-8 py-4 rounded-2xl font-bold text-sm shadow-lg shadow-primary/20 hover:bg-opacity-90 transition-all">Almost Done →</button>
    </div>
</div>
