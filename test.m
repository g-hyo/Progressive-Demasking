    tPress = []; % flag to tell code to keep running demasking loop until response made
    
    PsychRTBox('Clear', handle);

while isempty(tPress);
        [tPress, evt] = PsychRTBox('BoxSecs', handle, 1, [], 1); % Wait y seconds (mask presentation time) for a response
    end