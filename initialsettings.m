%% Here are the initial settings of the experiment.

%% Let's start with some minor psychtoolbox settings

Priority(2); % sets resources for psychtoolbox. Set to 2 when collecting data, use 0 for testing

% Screen('Preference','SkipSyncTests', 1);  % Skips synchronisation tests. Comment out during actual testing!

study.debug_mode = 0;  % allows you to see the screen while running the program. set to 1 to turn on.

ListenChar(2); % supress keyboard input
HideCursor;


if study.debug_mode;
    PsychDebugWindowConfiguration(0.5); % will set the transparent screen so you can debug 
end % debug window on


%% Great, now let's go to the screen settings

[wPtr, rect] = Screen('OpenWindow',0, [200 200 200]); % wPtr is screen being used. rect gives a vector of screen size

black=BlackIndex(wPtr); % black is the intensity value to produce black at current screen depth
white = WhiteIndex(wPtr); % white is the intensity value to produce white at the current screen depth

centerX = rect(3)/2; % defines the centre X coordinate of screen from rect
centerY = rect(4)/2; % defines the centre Y coordinate of screen from rect
