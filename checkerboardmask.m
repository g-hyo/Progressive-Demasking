%% This code will create the checkboard mask

% Make a base Rect of 200 by 200 pixels. These are the individual squares?
dim = 50;
baseRect = [0 0 dim dim];


% Make the coordinates for our grid of squares
[xPos, yPos] = meshgrid(-2:1:2, -2:1:2); % creates 2x2 matrix (1-2 across and 1-2 wide)

% Calculate the number of squares and reshape the matrices of coordinates
% into a vector
[s1, s2] = size(xPos); % gets length and width of matrix we made earlier
numSquares = s1 * s2; % length x width = num squares
xPos = reshape(xPos, 1, numSquares); % flatten matrix into 1 x numsquares. Each element is a square
yPos = reshape(yPos, 1, numSquares);

% Scale the grid spacing to the size of our squares and centre
xPosBox = xPos .* dim + centerX; % multiply our vector by dimensions to calculate rect for each individual square
yPosBox = yPos .* dim + centerY;


% Set colors of squares. Basically, 1 is black, 0 is white
bwColors = repmat(eye(2), 3, 3); % eye creates (2x2) matrix with 1s on diagonal. Repmat multiplies this by 3 both ways
bwColors = bwColors(1:end-1, 1:end-1); %remove last element for some reason
bwColors = reshape(bwColors, 1, numSquares); %flatten
bwColors = repmat(bwColors, 3, 1); % multiply by three



% Make rectangle coordinates?
allRects = nan(4,3); %pre-defined 4x3 matrix

for i = 1:numSquares % each row gets a new assignment
    allRects(:, i) = CenterRectOnPointd(baseRect,... % center boxes??
        xPosBox(i), yPosBox(i));
end

% Draw the rect to the screen
Screen('FillRect', wPtr, bwColors, allRects);

% Flip to the screen
Screen('Flip', wPtr);

% Wait for a key press
KbStrokeWait;

% Clear the screen
sca;