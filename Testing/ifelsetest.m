VBLTimestamp = 0;
x= 0.017;
y= 0.32;
for i = 1:20
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