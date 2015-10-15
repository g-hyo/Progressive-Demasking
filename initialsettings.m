%% Here are the initial settings of the experiment.

%% Let's start with some minor psychtoolbox settings

Priority(0); % sets resources for psychtoolbox. Set to 2 when collecting data, use 0 for testing

Screen('Preference','SkipSyncTests', 1);  % Skips synchronisation tests. Comment out during actual testing!

study.debug_mode = 0;  % allows you to see the screen while running the program. set to 1 to turn on.

ListenChar(2); % supress keyboard input
HideCursor;

PsychDefaultSetup(2); % this is needed for draw the checkers!

if study.debug_mode;
    PsychDebugWindowConfiguration(0.5); % will set the transparent screen so you can debug 
end % debug window on


%% Great, now let's go to the screen settings


% Get the screen numbers
screens = Screen('Screens');
% Draw to the external screen if avaliable
wPtr = max(screens);


% Define black and white
black=BlackIndex(wPtr); % black is the intensity value to produce black at current screen depth
white = WhiteIndex(wPtr); % white is the intensity value to produce white at the current screen depth
grey = white/2;

% Open an on screen window
[wPtr, rect] = PsychImaging('OpenWindow', 0, grey); % wPtr is screen being used. rect gives a vector of screen size
[screenXpixels, screenYpixels] = Screen('WindowSize', wPtr);





centerX = rect(3)/2; % defines the centre X coordinate of screen from rect
centerY = rect(4)/2; % defines the centre Y coordinate of screen from rect


%% Now let's load the stimuli

stim = importdata('stimuli.txt'); % Load stimuli
index = randperm(length(stim)); % Create random index for stimuli
rstim = stim(index); % Index stimuli according to random order we just generated

 

