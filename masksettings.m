%% This code will create the checkboard mask

% Determine the size of the checkerboard squares
dim = 10;
baseRect = [0 0 dim dim];


% Make the coordinates for our grid of squares (we have 7 squares across,
% and 3 high)

% Change this setting to change the number of checkerboard squares

[xPos, yPos] = meshgrid(-3:1:3, -1:1:1); % creates 2x2 matrix (1-2 across and 1-2 wide)

% Calculate the number of squares and reshape the matrices of coordinates
% into a vector
[s1, s2] = size(xPos); % gets length and width of matrix we made earlier
numSquares = s1 * s2; % length x width = num squares
xPos = reshape(xPos, 1, numSquares); % flatten matrix into 1 x numsquares. Each element is a square
yPos = reshape(yPos, 1, numSquares);

% Scale the grid spacing to the size of our squares and centre
xPosBox = xPos .* dim + centerX; % multiply our vector by dimensions to calculate rect for each individual square
yPosBox = yPos .* dim + centerY;


% Set colors of squares. Basically, 111 for black, 000 for white. 
% This has to correspond to the number of checkerboard squares 

bwColors = repmat(eye(2), 2, 4); % eye creates (2x2) matrix with 1s on diagonal. Repmat multiplies this by mxn ways
bwColors = bwColors(1:end-1, 1:end-1); %remove last row and col to match grid we've defined
bwColors = reshape(bwColors, 1, numSquares); %flatten, again to match grid
bwColors = repmat(bwColors, 3, 1); % multiply by three to transform into an RGB colour value (111 = black, 000=white)



% Make rectangle coordinates so that PTB knows where to put everything
allRects = nan(4,3); %pre-defined 4x3 matrix

for i = 1:numSquares % each column will now have checkboard square rec coordinates
    allRects(:, i) = CenterRectOnPointd(baseRect,... % center boxes??
        xPosBox(i), yPosBox(i));
end