% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A, B, C, D, E, F, G, H, I] = ABCs_iteration(vec, num1, arr, num2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs: Iteration
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
% Part I & II:
%   1. vec - a vector of numbers
%   2. num1 - an integer greater than 1
% Part III:
%   1. arr - an array of any size MxN
%   2. num2 - A particular number to search for

%% Part I: Short coding
% 1. for loops. Fix the following for loop so that A becomes vector vec in
%    reverse order. Replace every ? with the necessary code. You must 
%    utilize the for loop to receive credit. (A)

%    If vec is [1 2 3 4 5], then A should look like this after each 
%    iteration:
%    [1]
%    [2 1]
%    [3 2 1]
%    [4 3 2 1]
%    [5 4 3 2 1]
A=[];
for ind = 1:length(vec)                 % ind are the indices of vec
    A =[vec(ind), A];        % Puts the next element from vec before
end                         % everything in A

% 2. while loops. Use the following while loop to count the number of
%    perfect squares between 1 and num inclusive. Store your answer in the
%    variable B. Replace every ? with the necessary code. You must utilize
%    this while loop to receive any credit. (B)
i = 1;                      % Start from 1
B = 0;                      % Initializes a counting variable
while i<=num1               % When i is less than or equal to num1
    if mod(sqrt( i ),1)==0  % Checks to see if sqrt(i) is an integer root
        B = B+1;              % Increment the counter if an integer is found
    end
    i = i+1;                  % Moves to the next index position
end

%% Part II: Tracing
% The following code is run in the Command Window. What is stored in the
% workspace for the variables "rna" and "errCount" after it has run?

% 1     dna = 'ATGTa';
% 2     rna = '';
% 3     errCount = 0;
% 4     for n = dna
% 5         switch n
% 6             case {'A','a'}
% 7                 rna = [rna 'U'];
% 8             case {'T','t'}
% 9                 rna = [rna 'A'];
% 10            otherwise
% 11                errCount = errCount + 1;
% 12        end
% 13    end

% 1. The value stored in "rna" is (C):
C = 'UAAU';

% 2. The value stored in "errCount" is (D):
D = 1;

% The following code is run in the Command Window. List the value of
% "tot" at the end of each iteration as a seperate element in a vector.
%
% For example, if "tot" is 3 at the end of the first iteration,
% 5 after the second and 10 after the third, then your answer should
% read E = [3, 5, 10];

% 1     vec = [2, 10, -8, 2, 0, 0, 5];
% 2     idx = 1;
% 3     prev = NaN;
% 4     curr = vec(idx);
% 5     tot = 0;
% 6     while prev ~= curr
% 7         idx = idx + 1;
% 8         prev = curr;
% 9         curr = vec(idx);
% 10        if prev < curr
% 11            tot = tot + curr;
% 12        end
% 13    end

% 3. The value of "tot" after each iteration is (E):
E = [10,10,12,12,12];

% 4. Why could the terminating condition for the while loop above pose 
%    a problem? (F)
%    Assign variable F to the character of your selection.

% A. prev and curr will always be the same value, therefore idx will go out
%    of bounds.
% B. prev and curr may not ever be the same value, therefore the loop will 
%    run forever.
% C. prev and curr will never be the same value, therefore the loop will 
%    run forever.
% D. prev and curr may not ever be the same value, therefore idx will go 
%    out of bounds.
F = 'D';

%% Part III: Long Coding

% Directions: 
% Open and read through the file "ABCs_iterationPractice.pdf". The file
% contains an example drill problem, which we are going to solve together.
% Follow the directions and write your code to satisfy the instructions.

% function [G] = countNum(arr, num2)
% 1. Start off making a counter variable and set it equal to zero. (G)
G = 0;
%count=0;
% 2. Determine the size of arr to use as boundaries for for loop. Save the 
%    number of rows in H and columns in I. (H, I)
[H,I] = size(arr);
%I = NaN;
% 3. Make a nested for loop to check each index of the array. At each
%    iteration, compare the current index in the array and compare it to 
%    num. If this index is equivalent to num2, add one to the counter 
%    variable (G).
for r=1:H
    for c=1:I
        G = G + double(isequal(num2,arr(r,c)));
    end
end

% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
