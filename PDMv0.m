try

% This script puts together everything into the future PDM experiment

clear all;

Box % Initialize RT box before opening any screens. Clock drift calculation is done here

initialsettings % CHECK THAT WE'RE NOT IN DEBUG MODE. This sets all the screen settings

Rcollect % Collect responses and present stimuli


ListenChar(0); % Re enable typing



PsychRTBox('CloseAll'); % Close RTbox


catch ME

sca;

ListenChar(0); % Re enable typing

PsychRTBox('CloseAll'); % Close RTbox.

getReport(ME)
    
end