%% This code will create the gaussian noise mask


rectSizeY = 20; % This sets size X to 128
rectSizeX = 50; % This sets size Y to 128
scale = 2;

objRect = SetRect (centerX, centerY,rectSizeY, rectSizeX);

objRect = objRect * scale

% This generates randomly distributed noise with mean at the end, and SD at the start.
noiseimg = (100*randn(rectSizeY, rectSizeX) - 100);

tex = Screen('MakeTexture', wPtr, noiseimg);

[xc, yc] = RectCenter(objRect);

dstRect = CenterRectOnPoint(objRect, xc, yc);

