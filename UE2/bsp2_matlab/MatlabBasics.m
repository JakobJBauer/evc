%
% Copyright 2021 TU Wien.
% Institute of Computer Graphics and Algorithms.
%

function [v1, v2, v3, M, M_15x9, v_M_Product, M_v_Product, M_M_Product, ...
    M_M_componentwise, crossP, dotP, fnc_handles] = MatlabBasics()
% ATTENTION: Only implement sections that are marked with 'TODO'. You must
% not change anything that is not marked.

% DO NOT TOUCH - START
fnc_handles = {};
fnc_handles.basic_data_structures = @data_structures;
fnc_handles.checkerboard = @checkerboard;
fnc_handles.dotProduct = @dotProduct;
fnc_handles.crossProduct = @crossProduct;
fnc_handles.vector_X_Matrix = @vector_X_Matrix;
fnc_handles.Matrix_X_vector = @Matrix_X_vector;
fnc_handles.Matrix_X_Matrix = @Matrix_X_Matrix;
fnc_handles.Matrix_Xc_Matrix = @Matrix_Xc_Matrix;
% DO NOT TOUCH - END

%% General Hints:
% If you want to check your implementation you can:
% -) Set a breakpoint to access variables at a certain point in the script.
% You can inspect their contents in the 'Workspace' window to the right.
% -) Leave out the ';' at the end of a statement/line so the result will be
% printed out in the command window.
% -) Do not rename the predefined variables, or else our test-system won't
% work (which is bad for both parties ;) )

%% I. create basic data structures:

% 1) create a Row Vector 'v1' and a Column Vector 'v2' with 3 Elements
% and a 3x3 Matrix 'M' containing digits of your matriculation number.
% Implement this task in the function 'data_structures'.
[v1, v2, M] = data_structures();

% 2) create a sequence
% Implement this task in the function 'sequence_operator'.
v3 = sequence_operator(M);

% 3) create a 15-by-9 Matrix 'M_15x9' containing a checkerboard pattern
% Implement this task in the function 'checkerboard'.
M_15x9 = checkerboard(M);

%% II. implement your own versions of the following built-in Matlab functions:
% *, .*, cross, dot

% ATTENTION: of course you are not allowed to use the functions 'cross',
% 'dot', 'mtimes', and the '.*' operator for this task. Furthermore, you may
% only use the '*' operator on single components (-> multiply one element
% of a matrix or a vector with one other element).
% You may (and will probably) use loops.

% HINT: In order to check your solution, you can compare your results with
% the results you get by using the built-in Matlab functions.

% 1) dot product (use v1 and v2)
% Implement this task in the function 'dotProduct'.
dotP = dotProduct(v1, v2);

% 2) cross product of 2 vectors (use v1 and v2)
% Implement this task in the function 'crossProduct'.
crossP = crossProduct(v1, v2);

% 3) Vector-Matrix-Multiplication (use v1 and M)
% Implement this task in the function 'vector_X_Matrix'.
v_M_Product = vector_X_Matrix(v1, M);

% 4) Matrix-Vector-Multiplication (use M and v2)
% Implement this task in the function 'Matrix_X_vector'.
M_v_Product = Matrix_X_vector(M, v2);

% 5) Matrix-Matrix-Multiplication
% (use M and the transposed Matrix M2)
% Implement this task in the function 'Matrix_X_Matrix'.
M2 = M';
M_M_Product = Matrix_X_Matrix(M, M2);

% 6) Matrix-Matrix-Multiplication component wise
% (use M and M2 and implement component wise matrix multiplication)
% Implement this task in the function 'Matrix_Xc_Matrix'.
M_M_componentwise = Matrix_Xc_Matrix(M, M2);

end

function [v1, v2, M] = data_structures()
% create a Row Vector 'v1' and a Column Vector 'v2' with 3 Elements and a 3x3 Matrix 'M'
% containing digits of your matriculation number in the following order:
% matriculation number: 'ABCDEFGH'
% Vector:
% v1 =
%      D     A     C
% v2 =
%      F
%      B
%      E
% Matrix:
% M =
%      D     B     C
%      B     G     A
%      E     H     F

% TODO: implement this function and store the output in 'v1', 'v2', and 'M'
v1 = [0 1 0];
v2 = [2;2;2];
M = [0 2 0; 2 1 1; 2 5 1];

end

function v3 = sequence_operator(M)
% create a sequence: create a Vector 'v3' with elements starting at the
% smallest digit of M to the largest, each element 0.25 greater than the one
% before. Use the sequence operator ':' and Matlab's min/max functions to
% accomplish this.
% !Use the matrix M for this task and not the same numbers as in M!
% Example: The matriculation number 01233120 should give you the following
% vector:
% v3 = [0.0 0.25 0.5 0.75 1.0 1.25 1.5 2.0 2.25 2.5 2.75 3.0]
% for more information on how to use the sequence operator ':' (as well as
% all other Matlab functions), type (in the Matlab commandline):
% help :

% TODO: implement this function and store the output in 'v3'
v3 = min(min(M)):0.25:max(max(M)); % M = min(A,[],'all') 

end

function M_15x9 = checkerboard(M)
% create a 15-by-9 Matrix 'M_15x9' containing a checkerboard pattern of
% tiles where each black tile contains the contents of matrix M and
% every white tile contains zeros. Each tile, black or white, has the size 3x3.
% The corners must be black (i.e. contain 3x3 matrix M).
% ( You have to accomplish this task using a maximum of 7
% assignment-commands).
% Commands that use the = operator for assignment (not comparison) are
% counted as assignment-commands.
% You have to reuse M and you must not use loops.
% For more information see
% http://de.mathworks.com/help/matlab/matrices-and-arrays.html
% and
% http://de.mathworks.com/help/matlab/math/matrix-indexing.html
% and have a look at the matlab functions 'zeros' and 'repmat'
%
% M_15x9 =
%   DBC 000 DBC
%   BGA 000 BGA
%   EHF 000 EHF
%   000 DBC 000
%   000 BGA 000
%   000 EHF 000
%   DBC 000 DBC
%   BGA 000 BGA
%   EHF 000 EHF
%   000 DBC 000
%   000 BGA 000
%   000 EHF 000
%   DBC 000 DBC
%   BGA 000 BGA
%   EHF 000 EHF

% TODO: implement this function and store the output in 'M_15x9'

M_15x9 = [M zeros(3) M; zeros(3) M zeros(3); M zeros(3) M];

end

function[result] = dotProduct(v1, v2)
% return the dot product of v1 and v2
% IMPORTANT: DON'T use the built in Matlab functions 'dot' or 'mtimes' to
% do this!!! Implement it yourself and then compare it with 'dot'.

% TODO: implement this function and store the output in 'result'
result = 0;
for i=1:length(v1)
    result = result + v1(i)*v2(i);
end

end

function[result] = crossProduct(v1, v2)
% return the cross product of v1 and v2 as a row vector
% IMPORTANT: DON'T use the built-in Matlab function 'cross' to do this!!!
% Implement it yourself and then compare it with 'cross'.

% TODO: implement this function and store the output in 'result'
result = [...
    v1(2) * v2(3) - v1(3) * v2(2)...
    v1(3) * v2(1) - v1(1) * v2(3)...
    v1(1) * v2(2) - v1(2) * v2(1)...
    ];

end

function[result] = vector_X_Matrix(v1, M)
% implement vector matrix multiplication
% IMPORTANT: DON'T use the built-in matrix multiplication or the function
%            'mtimes' to do this!!!
% HINT: return a row vector

% TODO: implement this function and store the output in 'result'

result = zeros(1, 3);
for i = 1:3
    result(i) = dotProduct(v1, M(:,i)');
end

end

function[result] = Matrix_X_vector(M, v2)
% implement matrix vector multiplication
% IMPORTANT: DON'T use the built-in matrix multiplication or the function
%            'mtimes' to do this!!!
% HINT: return a column vector

% TODO: implement this function and store the output in 'result'

result = zeros(1, 3)';
for i = 1:3
    result(i) = dotProduct(M(i,:), v2);
end

end

function[result] = Matrix_X_Matrix(M, M2)
% implement matrix multiplication
% IMPORTANT: DON'T use the built-in matrix multiplication or the function
%            'mtimes' to do this!!!
% HINT: row times column!

% TODO: implement this function and store the output in 'result'

result = zeros(3);
for i = 1:3
    for j = 1:3
        result(i, j) = dotProduct(M(i,:), M2(:,j));
    end
end
end


function[result] = Matrix_Xc_Matrix(M, M2)
% implement component wise multiplication.
% IMPORTANT: DON'T use the built-in Matlab operator '.*' to do this!!!

% TODO: implement this function and store the output in 'result'

result = zeros(3);
for i = 1:3
    for j = 1:3
        result(i, j) = M(i, j) * M2(i, j);
    end
end

end
