t = [];
b = [];
tBeep = [];
accu =[];

for trial = 1:5
    x = 0.017; % Initial stimulus time
    y = 0.32; % Initial mask time
    tPress = []; % flag to tell code to keep running demasking loop until response made
    
    PsychRTBox('Clear', handle);
    WaitSecs(.5); 
    
    DrawCross(wPtr, rect, 10);  % Draw Fixation cross
    Screen('Flip', wPtr);
    
    WaitSecs(.8); % Leave fixation cross on screen for 0.800 s 
           
    if isempty(tPress); % First iteration
    %[tPress, evt] = PsychRTBox('BoxSecs', handle, [], .1, 1);  %separate
    %first iteration. Probably too fast for a response anyway.
    DrawFormattedText(wPtr, char(rstim{trial}), 'center', 'center');    % Draw the text
    [VBLTimestamp StimulusOnsetTime FlipTimestamp] = Screen('Flip', wPtr); 
    WaitSecs(x)
    
    DrawFormattedText(wPtr, '####', 'center', 'center');    % Draw the mask
    Screen('Flip',wPtr);
    WaitSecs(y)
    
    x = x + 0.017;
    y = y - 0.017; 
    end 
    
    if isempty(tPress);
    while isempty(tPress);
    [tPress, evt] = PsychRTBox('BoxSecs', handle, [], 5, 1); % Wait 5 seconds for a response.
    DrawFormattedText(wPtr, char(rstim{trial}), 'center', 'center');    % Draw the text
    Screen('Flip', wPtr); 
    WaitSecs(x)
    
    DrawFormattedText(wPtr, '####', 'center', 'center');    % Draw the mask
    Screen('Flip',wPtr);
    WaitSecs(y)
    
    x = x + 0.017;
    y = y - 0.017;
    end
    end 
   
    if ~isempty(tPress);
     Screen('Flip',wPtr);
        answer = Ask(wPtr,'What was the word?', black, white, 'GetChar','center', 'center', 20); 
            if answer == char(rstim{trial});
                DrawFormattedText(wPtr, 'Correct!', 'center', 'center');
                Screen('Flip',wPtr);
                WaitSecs(2);
                correct = 1;
            else
                DrawFormattedText(wPtr, 'Incorrect!', 'center', 'center');
                Screen('Flip',wPtr);
                WaitSecs(2);
                correct = 0;
            end
    end
        t(end+1) = tPress; 
        b(end+1) = evt; 
        tBeep(end+1) = VBLTimestamp; 
        accu(end+1) = correct;
        

        Screen('Flip', wPtr); 
     
     
     
end 

tResponse = PsychRTBox('BoxsecsToGetsecs', handle, t); % Convert RTbox time to PTB time
RT = tResponse-tBeep;


sca;

