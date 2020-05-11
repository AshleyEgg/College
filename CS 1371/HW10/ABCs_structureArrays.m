% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A, B, C, D, E, F, G, H, I, J] = ABCs_structureArrays_soln(st1, st2, st3, sa1, sa2)

%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
% Part I:
%   1. st1 - A structure with the same fields as str2 and str3
%   2. st2 - A structure with the same fields as str1 and str3 
%   3. st3 - A structure with the same fields as str1 and str2
%   4. sa1 - A structure array with the fields 'college' and 'state'
% Part II:
%   1. sa2 - A structure array with any number of fields (social media)
%
% st1, st2, and st3 could look like the following:
%   st1 = struct('field1', value1, 'field2', value2);
%   st2 = struct('field1', value3, 'field2', value4);
%   st3 = struct('field1', value5, 'field2', value6);

% 1. Creating structure arrays manually. st1, st2, and st3 are three
%    similar structures (similar means they have the same fields). Create a 
%    structure array of length three containing st3, st2, and st1 in that 
%    order. (A)
%    Hint: Structure Concatenation.
A = [st3,st2,st1];
%    of its fields are 'college' and 'state'. Add another structure to the 
%    end of the array by setting the value of the 'college' field to 
%    'UCLA'. (B)
%    Hint: First alter sa1 then assign the value to B. Indexing with 
%          (end+1) may be be helpful.
sa1(end+1).college='UCLA';
%    the value would be to (C).
C = sa1(end).state;
%    'model', and 'color'. The field values for each of the three
%    structures should be as follows:
%
%   1)  make: 'Honda'   model: 'Accord'   color: 'silver'
%   2)  make: 'BMW'     model: '335i'     color: 'silver'
%   3)  make: 'Volvo'   model: 'C70'      color: 'silver'
%
% Note: You *MUST* use struct() for this problem. (D)
D = struct('make',{'Honda','BMW','Volvo'},'model',{'Accord','335i','C70'},'color',{'silver'});
%    from the 'college' field from sa1. Do not use iteration. (E)
%    Hint: Consider how you can combine using structure indexing and the 
%          curly brackets {}.
E = {sa1.college};

% Open and read through the file "ABCs_structureArraysPractice.pdf". The 
% file contains an example drill problem, which we are going to solve 
% together. Follow the directions and write your code to satisfy the 
% instructions. *DO NOT* uncomment any of the already commented lines
% below.

% 1. Get out all of the social medias (field names) in sa2 and store them 
%    in (F).
F = fieldnames(sa2);
%    through each of the field names stored in G. At each iteration of the
%    for loop, make a vector (vec) of length N (same length as the 
%    structure array) with all of the hours for that particular social 
%    media. Then vertically concatenate vec onto G (vec below G).
%    Hint: to make a vector with all of the hours, use: 
%          vec = [sa2.<fieldname>]
G = [];
%    vector in (H).
H = sum(G,2);
%    (most number of total hours). Store this index in (I).
[~,I] = max(H);
%    to (most total hours spent on) as a string. (J)
J = F{I};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end