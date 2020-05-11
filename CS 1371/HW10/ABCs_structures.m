% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A, B, C, D, E, F, G, H, I, J, K, L, M, N] = ABCs_structures_soln(a_time, a_date, b_time, b_date, st1, st2, f1, var1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Structures
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parantheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
% Part I:
%   1. a_time - A string of some time
%   2. a_date - Some numerical date
%   3. b_time - A string of some time
%   4. b_date - Some numerical date
%   5. st1 - A structure with at least the field 'City'
%   6. st2 - A structure with at least the fields 'State' and 'TimeZone'
%   7. f1 - A string of a fieldname in the structure st2
%   8. var1 - An unknown value

%% Part I: Short Coding & Conceptual
% 1. Creating structures manually. Create a structure with two fields: 
%    'time' and 'date'. In the first field, 'time', store the value
%    contained in the variable "a_time". In the second field, 'date', store 
%    the value contained in the variable "a_date". Do *NOT* use the 
%    functions struct() or setfield() for this problem. (A)
A.time=a_time;
A.date=a_date;


% 2. Creating structures using struct(). Create a structure with two
%    fields: 'time' and 'date'. In the first field, 'time', store the value
%    contained in the variable "b_time". In the second field, 'date', store 
%    the value contained in the variable "b_date". You *MUST* use the 
%    function struct() for this problem. (B)
B = struct('time',b_time,'date',b_date);

% 3. setfield(). Create a structure that is the same as st1, but the field
%    named 'City' should have the value of 'Atlanta'. You should not be 
%    changing the original structure st1. You *MUST* use setfield() for 
%    this problem. (C)
C = setfield(st1,'City','Atlanta');

% 4. getfield(). What is the value of the field named 'City' in st1? You
%    *MUST* use getfield() for this problem. (D)
D = getfield(st1,'City');

% 5. Accessing. What is the value of the field named 'State' in st2? You
%    may *NOT* use getfield() for this problem. (E)
E = st2.State;

% 6. Accessing indirectly. The variable f1 will contain a string 
%    representing a fieldname. What is the value of the field f1 in the 
%    structure st2? You may *NOT* use getfield() for this problem. (F)
F = st2.(f1);

% 7. fieldnames(). Use the function fieldnames() to create a cell array
%    containing a list of all the fields from st2. (G)
G = fieldnames(st2);

% 8. rmfield(). Use the function rmfield() to create a structure equal to
%    st2 with the field named 'TimeZone' removed. The original structure st2 
%    should not be changed. (H)
H = rmfield(st2,'TimeZone');

% 9. After running the following line of code, will the field named 'City'
%    exist within st1? If yes, the answer should yield the logical true, 
%    and if no, the answer should yield the logical value false. (I)
%    >> rmfield(st1,'City')
%    Important Note: This is not the same as st1 = rmfield(st1,'City')
I = true;

% 10. isstruct(). Is the value of var1 a structure? You answer should be
%     either the logical true if var1 is a structure and false otherwise.
%     (J)
J = isstruct(var1);

% 11. isfield(). Does st1 have a field named 'Major'? You answer should be
%     either the logical value true if st1 does have a field named 'Major' 
%     and false otherwise. (K)
K = isfield(st1,'Major');

%% Part II: Tracing
% The following script is run.

% 1     st.type = 'Dominoes';
% 2     st.pizza = 'Pepperoni';
% 3     st.extraToppings = 'none';
% 4     st.quantity = 5;
% 5     fields = fieldnames(st);
% 6     for i = 1:length(fields)
% 7         curField = fields(i);
% 8         if strcmp(curField,'extraToppings') & isequal(st.curField,'none')
% 9             st.curField = {'mushrooms', 'onions', 'peppers'};
% 10        end
% 11    end
% 12    setfield(st,'quantity',10);

% 1. This code produces an ERROR. What line does the ERROR occur on? (L)
L = 8;

% 2. On line 7 and 8, "st.curField" is written incorrectly. How should it 
%    be re-written to run correctly? (M)
%    Assign variable M to the character of your selection.

% A. st.(curField)
% B. st.{curField}
% C. st.(curField{1})
% D. st.[curField]
M = 'C';

% 3. Once the script is fixed, and runs as intended. What value is returned
%    from running the following line of code? (N)
%    >> st.quantity;
N = 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
