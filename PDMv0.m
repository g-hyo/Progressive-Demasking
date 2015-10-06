% This script puts together everything into the future PDM experiment

clear all;

initialsettings % CHECK THAT WE'RE NOT IN DEBUG MODE

Box % Initialize RT box


Rcollect % Collect responses


ListenChar(0);

PsychRTBox('CloseAll');
