%% Now let's present some instructions!

line2 ='\n In this task, you will need to identify target words that will gradually appear on the computer screen out of a background of visual noise.'; %\n means new line
line3 = '\n \n Press the red button as soon as you can identify the target word. You will then need to type the word out. '; % This is below line 1. Hence two \n's
line4 = '\n \n \n Answer as quickly as possible without making errors (accuracy and times will be recorded!)';
line5 = '\n \n \n \n \n Lets do some practice trials, press either key to continue'; 
DrawFormattedText(wPtr, [line2 line3 line4], 'center', 'center', black);
Screen('Flip', wPtr);


% In this task, you will need to identify target words that will gradually appear on the computer screen out of a background of visual noise.

% Press the red button as soon as you can identify the target word. You will then need to type the word out. 

% Answer as quickly as possible without making errors (accuracy and times will be recorded!)