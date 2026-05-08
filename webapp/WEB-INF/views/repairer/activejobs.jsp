          <!-- Active Jobs Card -->
          <div class="bg-white rounded-[20px] border border-border shadow-stat pt-[26px] pr-[26px] pb-[26px] pl-[26px]">
            <div class="flex items-center justify-between mb-5">
              <span class="text-[17px] font-bold text-dark">Active Jobs</span>
              <button class="text-[13px] font-medium text-nav border-[1.5px] border-border-light rounded-[20px] py-1.5 px-4 bg-transparent cursor-pointer">View all</button>
            </div>

            <div class="bg-white border-[1.5px] border-border rounded-[16px] pt-5 pr-[22px] pb-5 pl-[22px]">
              <div class="flex items-start justify-between mb-[18px]">
                <div>
                  <div class="text-[15.5px] font-bold text-dark mb-[7px]">No Jobs</div>
                  <div class="flex items-center gap-2 text-[12.5px] text-muted-dark">
                    <span class="bg-primary-light text-primary text-[11.5px] font-semibold rounded-[20px] py-[3px] px-[11px] inline-block"></span>
                    <span></span>
                  </div>
                </div>
              </div>

              <!-- Progress Tracker -->
              <div class="flex items-start justify-between mb-5 relative px-1">
                <div class="absolute top-4 left-[26px] right-[26px] h-[2.5px] bg-border z-0">
                  <div class="h-full w-[55%] bg-primary rounded-[2px]"></div>
                </div>

                <!-- Step 1: Pending -->
                <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                  <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold bg-white border-[2.5px] border-primary text-primary">
                    <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                  </div>
                  <span class="text-[11.5px] font-bold text-primary text-center whitespace-nowrap">Pending</span>
                </div>

                <!-- Step 2: Accepted -->
                <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                  <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold bg-white border-[2.5px] border-primary text-primary">
                    <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                  </div>
                  <span class="text-[11.5px] font-bold text-primary text-center whitespace-nowrap">Accepted</span>
                </div>

                <!-- Step 3: In Progress -->
                <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                  <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold bg-white border-[2.5px] border-primary text-primary">
                    <div class="w-[10px] h-[10px] rounded-full bg-primary"></div>
                  </div>
                  <span class="text-[11.5px] font-bold text-primary text-center whitespace-nowrap">In Progress</span>
                </div>

                <!-- Step 4: Done -->
                <div class="flex flex-col items-center gap-[7px] z-[1] flex-1">
                  <div class="w-8 h-8 rounded-full flex items-center justify-center text-[13px] font-bold bg-background border-2 border-border-light text-muted text-xs">4</div>
                  <span class="text-[11.5px] font-medium text-muted-dark text-center whitespace-nowrap">Done</span>
                </div>
              </div>

              <div class="flex justify-end">
                <button class="bg-primary text-white border-none rounded-[24px] py-3 px-[26px] text-sm font-semibold font-inter cursor-pointer tracking-[0.01em]">Mark Complete ✓</button>
              </div>
            </div>
          </div>
