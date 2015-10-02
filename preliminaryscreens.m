%% This code will present instructions and collect participant information etc.
% This may be skipped if you are just testing the code

%% Define Text Formatting for instruction
Screen('TextSize', wPtr, 20);
Screen('TextFont', wPtr, 'Helvetica');
Screen('TextStyle', wPtr, 0);


%% Collecte subject information


subject = str2double(Ask(wPtr,'Enter Subject Number (followed by Enter or Return):', black, white, 'GetChar',[0 0 1000 200], 'center', 20)); 
% Asks for subject number. Converts the answer into a number instead of a string. 
% Format: reply = Ask(window,message,[textColor],[bgColor],[replyFunction],[rectAlign1],[rectAlign2],[fontSize=30])

initials = Ask(wPtr,'Enter Subject Initials:', black, white, 'GetChar', [0 0 1000 200], 'center', 20); 
% reduces likelihood of overwriting file if accidentally enter same subject number twice. 

study.filename = sprintf('s%d_%s_PDM.mat',subject,initials); % generate a filename for particular session
% sprintf formats data into string using variables. %d is for integers. %s for strings

mapmat = [3470, 3103, 3653, 1124, 4900, 2453, 5069, 0267, 2319, 5496]; % These are the seeds from random.org. Each participant needs a seed
mapSeed = mapmat(subject); 
rng(mapSeed,'twister'); % These last 2 lines allow us to control random number generation, allowing us to recreate stimuli sets for participants in case of a crash. 