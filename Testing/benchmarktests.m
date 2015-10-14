initialsettings

tic
for i = 1:10
    ifelsetest
end
time1 = toc;

tic
for i = 1:10
    ifelsetest2
end
time2 = toc;

sca;


%% RESULT = ifelse2 (e.g. separate code for first iteration) was faster!!

% Over 10 repetitions of 10 loops, the 2nd code ran 100ms faster (!)