%screenNumber = max(Screen('Screens'));
[win, rect] = PsychImaging('OpenWindow',0);
KbName('UnifyKeyNames');
RightKey = KbName('RightArrow');
LeftKey = KbName('LeftArrow');
ResponseKey = KbName('Space');
escapeKey = KbName('ESCAPE');
[xCenter, yCenter] = RectCenter(rect);
slack = Screen('GetFlipInterval', win); %/2
vbl = Screen('Flip', win);

baseRectA = [0 0 40 40];
baseRect = [0 0 50 50];
LineX = xCenter;
LineY = yCenter;
pixelsPerPress = 70;
waitframes = 7;
while KbCheck; end
while true
    [ keyIsDown, secs, keyCode ] = KbCheck;
    pressedKeys = find(keyCode);
    if pressedKeys == escapeKey
        sca;
        close all;
    elseif keyCode(LeftKey)
        LineX = LineX - pixelsPerPress;
    elseif keyCode(RightKey)
        LineX = LineX + pixelsPerPress;
    elseif pressedKeys == ResponseKey
        StopPixel_M = ((LineX - xCenter) + 210)/5;
        sca;
        close all;
    end

    if LineX < (xCenter-210)
        LineX = (xCenter-210);
    elseif LineX > (xCenter+210) 
        LineX = (xCenter+210);
    end
    if LineY < 0
        LineY = 0;
    elseif LineY > (yCenter+10)
        LineY = (yCenter+10);
    end
    text_P = 'Your Emotions were...?';
    centeredRectA = CenterRectOnPointd(baseRectA, LineX, LineY);
    DrawFormattedText(win, text_P ,'center', (yCenter-100), [0 0 0],...
        [],[],[],5)       
    maxDiameter = max(baseRect) * 1;
    squareXpos = [(xCenter+210) (xCenter+140) (xCenter+70) (xCenter) ...
        (xCenter-70) (xCenter-140) (xCenter-210)];
    numSqaures = length(squareXpos);
    allRects = nan(4, 7);
    for i = 1:numSqaures
        allRects(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
    end
    Screen('FillOval', win, [0 0 0], allRects, maxDiameter);
    Screen('DrawLine', win, [0, 0, 0], (xCenter+200 ), (yCenter), ...
        (xCenter-200), (yCenter), 5);
    Screen('DrawText', win,'weak', (xCenter-260), (yCenter+70),...
        [0, 0, 0]);
    Screen('DrawText', win,'strong', (xCenter+160), (yCenter+70),...
        [0, 0, 0]);
    Screen('FillOval', win, [255 255 255], centeredRectA);

    vbl = Screen('Flip', win, vbl + (waitframes) * slack); % - 0.5  * slack
end