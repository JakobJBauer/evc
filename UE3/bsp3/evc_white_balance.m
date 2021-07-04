%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [result] = evc_white_balance(input, white)
%evc_white_balance performs white balancing manually.

%   INPUT
%   input       ... image
%   white       ... a color (as RGB vector) that should become the new white

%   OUTPUT
%   result      ... result after white balance

% TODO: perform white balancing using the 'white' variable
% HINT: Make sure the program does not crash if 'white' is zero!
% NOTE: pixels brighter than 'white' will have values > 1.
%       This requires a normalization which will be performed
%       during the histogram clipping.
% NOTE: The following line can be removed. It prevents the framework
%       from crashing.

result = zeros(size(input));

% kein kehrwert wenn wert 0 ist
% außerdem keine änderung bei Wert 0
if (white(1) ~= 0)
    result(:,:,1) = input(:,:,1) ./ white(1);
end
if (white(2) ~= 0)
    result(:,:,2) = input(:,:,2) ./ white(2);
end
if (white(1) ~= 0)
    result(:,:,3) = input(:,:,3) ./ white(3);
end

end
