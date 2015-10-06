% DrawSomeText
%
% ___________________________________________________________________
%
%  Trivial example of drawing text.  
% _________________________________________________________________________
%
% see also: PsychDemos

% 3/8/04    awi     Wrote it.
% 7/13/04   awi     Added comments section.  
% 9/8/04    awi     Added Try/Catch, cosmetic changes to documentation.
% 1/21/05   awi     Replaced call to GetChar with call to KbWait. 
% 10/6/05	awi		Note here cosmetic changes by dgp between 1/21/05 and 10/6/05	.

try
    % Choosing the display with the highest dislay number is
    % a best guess about where you want the stimulus displayed.
    Priority(0);

study.debug_mode = 1;  % allows you to see the screen while running the program. set to 1 to turn on.
    
    screens=Screen('Screens');
    screenNumber=max(screens);
    w=Screen('OpenWindow', screenNumber);
    Screen('FillRect', w);
    
    black=BlackIndex(w); % black is the intensity value to produce black at current screen depth
white = WhiteIndex(w); % white is the intensity value to produce white at the current screen depth


    
    
    
    keyIsDown = 0;
    x = 0.017;
    y = 0.32;
    
    while ~keyIsDown
        [keyIsDown, secs, keyCode] = KbCheck;
        
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, 50);
    Screen('TextStyle', w, 1+2);
    Screen('DrawText', w, 'Hello World!', 100, 100, [0, 0, 255, 255]);
    Screen('TextFont',w, 'Times');
    % Screen('TextSize',w, 30);
    % Screen('DrawText', w, 'Hit any key to exit.', 100, 300, [255, 0, 0, 255]);
    Screen('Flip',w);
    WaitSecs(x);
    
    Screen('TextSize',w, 50);
    Screen('TextStyle', w, 1+2);
    Screen('DrawText', w, '###### #####!', 100, 100, [0, 0, 255, 255]);
    Screen('TextFont',w, 'Times');
    Screen('Flip',w);
    WaitSecs(y);
    
    x = x + 0.017;
    y = y - 0.017;
    
    if keyIsDown
        Screen('Flip',w);
        answer = Ask(w,'What was the word?', black, white, 'GetChar',[0 0 1000 200], 'center', 20); 
        if answer == 'Hello World!'
            DrawFormattedText(w, 'Correct!', 'center', 'center');
            Screen('Flip',w);
            WaitSecs(2);
            sca;
        else
            DrawFormattedText(w, 'Incorrect!', 'center', 'center');
            Screen('Flip',w);
            WaitSecs(2);
            sca;          
        end   
    end
    
    end
    
    Screen('CloseAll');
    
catch
    % This "catch" section executes in case of an error in the "try" section
    % above.  Importantly, it closes the onscreen window if it's open.
    Screen('CloseAll');
    psychrethrow(psychlasterror);
end
