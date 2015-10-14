% This is the if/else flag version of response collection
% This runs slower (over 10 trials 100ms slower) than the current version
% where the first iteration is separate

t = [];
b = [];
tBeep = [];

for trial = 1:5
    x = 0.017; % Initial stimulus time
    y = 0.32; % Initial mask time
    tPress = []; % flag to tell code to keep running demasking loop until response made
    VBLtimestamp = 0; % Reset this before every trial (also acts as a flag in the loop)
    
    PsychRTBox('Clear', handle);
    WaitSecs(.5); 
    
    DrawCross(wPtr, rect, 10);  % Draw Fixation cross
    Screen('Flip', wPtr);
    
    WaitSecs(.8); % Leave fixation cross on screen for 0.800 s 
    
   
    while isempty(tPress);
    [tPress, evt] = PsychRTBox('BoxSecs', handle, [], 10, 1); % Wait 5 seconds for a response.         %if then vs separate first iteration
    DrawFormattedText(wPtr, 'Test', 'center', 'center');    % Draw the text
    
        if VBLTimestamp == 0 % Collect timestamp on only the first iteration 
            [VBLTimestamp StimulusOnsetTime FlipTimestamp] = Screen('Flip', wPtr); 
        else 
            Screen('Flip',wPtr);   
        end
    WaitSecs(x) %keep this on screen
    
    DrawFormattedText(wPtr, '####', 'center', 'center');    % Draw the mask
    Screen('Flip',wPtr);
    WaitSecs(y)
    
    x = x + 0.017;
    y = y - 0.017;
    
    
    end 
   
        t(end+1) = tPress; 
        b(end+1) = evt; 
        tBeep(end+1) = VBLTimestamp; 

        Screen('Flip', wPtr); 
     
     
     
end 

tResponse = PsychRTBox('BoxsecsToGetsecs', handle, t); % Convert RTbox time to PTB time

sca;

