%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [result] = evc_compute_binary(input, x, top)
%evc_compute_binary computes a binary image with the specified threshold x.
%
%   INPUT
%   input ... RGB image
%   x     ... scalar threshold
%   top   ... if 0, the output should be inverted such that 0 becomes 1
%             and 1 becomes 0.
%   OUTPUT
%   result... binary RGB image which must contain either zeros or ones. The
%             result has to be of type double! Make sure that all three
%             channels are preserved (the operation has to be performed on
%             every channel).


% TODO: Compute a binary image with the threshold x. Values less or equal
%       to x are mapped to 0, values greater than x are mapped to 1.
%       The input image might contain values greater than 1 so im2bw can't
%       be used (it would crash).
%       If top == 0 the output should be inverted such that 0 becomes 1
%       and 1 becomes 0 (swap 0 and 1).
% NOTE: The following line can be removed. It prevents the framework from
%       crashing.

if (top == 1)
    result = input > x;
else
    result = input <= x;
end

result = double(result);

end
