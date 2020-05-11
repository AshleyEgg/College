% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A, B, C, D, E, F, G, H, I] = ABCs_arrays(arr1, arr2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1 and store it in (GT).
% That means store the value of 1 + 1 in the variable GT. 

% Given Input Variables:
%   1. arr1 - An array of numbers 
%   2. arr2 - An array of numbers
%
% 1. Create an array that has the numbers 3 and 7 in the first row, 4 and 5
%    in the second row, and 13 and 2 in the third row. (A)
A = [3,7;4,5;13,2];

% 2. Create a array of ones that has 7 rows and 2 columns. (B)
B = ones(7,2);

% 3. Find the number of rows and columns in "arr1", and save the number of
%    rows in (C) and the number of columns in (D). 
[C,D] = size(arr1);

% 4. Vertically concatenate the arrays "arr1" and "arr2". (E)
E = vertcat(arr1,arr2);

% 5. Take the top half of the array "arr2" - that is, take all of the 
%    columns and the first half of the rows. Assume there are an even 
%    number of rows. (F)
F = arr2(1:end/2,1:end);

% 6. Flip "arr1" horizontally. (G)
G = fliplr(arr1);

% 7. Transpose "arr2".(H)
H = transpose(arr2);

% 8. Linearize "arr1". "arr1" should go from an MxN array to an (M*N)x1
%    column vector. The new (M*N)x1 vector should be calculated by going
%    down the columns of "arr1". (I)   
I = reshape(arr1,[],1);

end