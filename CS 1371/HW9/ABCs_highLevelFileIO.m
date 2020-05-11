% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A B C] = ABCs_highLevelFileIO(xls1, xls2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of High Level File I/O
%
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. xls1 - Given Excel (.xls) file 
%   2. xls2 - .xls file name to write to
%
% Note: All input filenames will contain the appropriate file extension  
% i.e.: xls1 = 'file.xls'
%
%
% A) Reading an Excel worksheet. Read in an Excel file whose filename is
% given as an input to this function in xls1.  Store the numerical from
% this worksheet in A. Store the text data in B and store the raw data
% (entire worksheet) in C.
[A,B,C] = xlsread(xls1);
%B = NaN;
%C = NaN;

% D) Writing Excel files. Write the text data (variable B) to an Excel
% file whose filename is stored in xls2. Please note that if you are using
% a Mac, you will have to use VLab or a library computer (PC) to write to
% an Excel file properly.
xlswrite('xls2.xls',B);
end