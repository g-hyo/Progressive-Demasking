t = [];
b = [];
tBeep = [];

for trial = 1:10
    PsychRTBox('Clear', handle);
    WaitSecs(.5); 
    
    DrawCross(wPtr, rect, 10);  % Draw Fixation cross
    Screen('Flip', wPtr);
    
    WaitSecs(.8); % Leave fixation cross on screen for 0.800 s 
    
    DrawFormattedText(wPtr, 'Test', 'center', 'center');    % Draw the text
    [VBLTimestamp StimulusOnsetTime FlipTimestamp] = Screen('Flip', wPtr); 
    %tStart = GetSecs; % start timer for trial now that the screen is flipped 
    
 [tPress, evt] = PsychRTBox('BoxSecs', handle, 5, [], 1);
   
        %WaitSecs(3);
        t(end+1) = tPress; 
        b(end+1) = evt; 
        tBeep(end+1) = VBLTimestamp; 

        Screen('Flip', wPtr); 
        
     
     
end 

tResponse = PsychRTBox('BoxsecsToGetsecs', handle, t); % Convert RTbox time to PTB time

sca;

