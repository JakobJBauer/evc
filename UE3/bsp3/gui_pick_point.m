%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [x, y, p] = gui_pick_point(input)
%EVC_PICK_POINT Perform the selection of an image point.
%
%   INPUT
%   input... Image
%   OUTPUT
%   x... x-value of the selected point
%   y... y-value of the selected point
%   p... true if the coordinates (x,y) is a valid pixel position
%             otherwise p = false

% default values
x = 1;
y = 1;
p = true;

% get user input
[x, y] = ginput(1);

% floor the coordinates
x = floor(x);
y = floor(y);

% test if coordinates are valid image coordinates
if (x < 1 || y < 1 || x > size(input, 2) || y > size(input, 1))
    p = false;
end
end
