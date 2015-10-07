% This code will initialize the cedrus box

handle = PsychRTBox('Open'); 
% Try to open a connected RTBox, return a device handle 'handle' to it on success.

%clockRatio = PsychRTBox('clockratio'); % Comment out while testing??
% Calculate drift between computer and RT box

%oldeventspec = PsychRTBox('Enable' [,handle][, eventspec]);
% This has to be done in order to enable recording of RT box responses
% This may already be default on







%PsychRTBox('CloseAll');
% Close RT box