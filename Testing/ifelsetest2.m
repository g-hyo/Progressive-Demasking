VBLTimestamp = 0;
x= 0.017;
y= 0.32;
 DrawFormattedText(wPtr, 'Test', 'center', 'center');    % Draw the text
 [VBLTimestamp StimulusOnsetTime FlipTimestamp] = Screen('Flip', wPtr); 
  WaitSecs(x) %keep this on screen
 DrawFormattedText(wPtr, '####', 'center', 'center');    % Draw the mask
 Screen('Flip',wPtr);
 WaitSecs(y)
 x = x + 0.017;
 y = y - 0.017;
 for i = 1:19
    DrawFormattedText(wPtr, 'Test', 'center', 'center');    % Draw the text
    Screen('Flip',wPtr);   
    WaitSecs(x) %keep this on screen
    DrawFormattedText(wPtr, '####', 'center', 'center');    % Draw the mask
    Screen('Flip',wPtr);
    WaitSecs(y)
    x = x + 0.017;
    y = y - 0.017;   
end 