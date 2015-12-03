%% This code will create the gaussian noise mask

% This may be needed to draw the stimuli
AssertOpenGL;

rectSizeX = 90; % This sets size X to 128
rectSizeY = 30; % This sets size Y to 128

objRect = SetRect (0,0,rectSizeX, rectSizeY);

% This generates randomly distributed noise with mean 128, and SD 50.
noiseimg = (50*randn(rectSizeX, rectSizeY) + 128);

text = Screen('MakeTexture', wPtr, noiseimg);

[xc, yc] = RectCenter(objRect);

dstRect = CenterRectonPoint(objRect, xc, yc);

