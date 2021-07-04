%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [maximum] = gui_histshow(input, bins)
%EVC_HISTSHOW Draws the histogram with the provided number of bins.
%   The histogram consolidates the values of the R, G and B channels.
%
%   INPUT
%   input... Image
%   bins... Number of bins
%   OUTPUT
%   maximum... height of the talles histogram bar

max_ = max(input(:));
if isinf(max_)
    max_ = 0;
end
x = linspace(0, max(1, max_), bins); % FIXED: make sure max is big enough

% calculate histogram and return maximum
h = hist(input(:), x);
bar(x, h);
maximum = max(h);
end
