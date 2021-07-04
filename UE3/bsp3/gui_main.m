%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function[] = gui_main(filename)
%EVC_MAIN Main function. Do not change any signatures (name, input, output)
% of the provided functions.
close all;
clear global;
CFA = imread(filename); % load image

old_warning_state = warning;
warning('off', 'Images:initSize:adjustingMag');

[CFA, asShotNeutral, ~, ~] = evc_black_level(CFA, filename);

bins = 512; % number of bins in the histogram

[RGB, ~, ~, ~, ~] = evc_demosaic(CFA, asShotNeutral); % calculate colours
clear CFA; % CFA not needed anymore
close all;

RGB_WB = gui_white_balance(RGB); % perform white balance
RGB_GAMMA = gui_gamma_correction(RGB_WB, bins); % perform gamma correction
RGB_RESULT = gui_histogram_clipping(RGB_GAMMA, bins); % increase contrast

% optional - display image
imshow(RGB_RESULT, []);
warning(old_warning_state);
% optional - save image
%imwrite(uint8(RGB_RESULT * 255), 'output.png', 'png');
end
