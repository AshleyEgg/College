clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for fivePrime
[newVec1] = fivePrime([4 5 6]);
% 	newVec1 =>      4   NaN     6
% 
[newVec2] = fivePrime([7 5 7 9 10 7 15]);
% 	newVec2 =>      7     5     7   NaN    10     7    15
% 
[newVec3] = fivePrime([2 12 7 8 7 2 15 9]);
% 	newVec3 =>      2    12   NaN     8   NaN     2    15     9

[newVec1s] = fivePrime_soln([4 5 6]);
[newVec2s] = fivePrime_soln([7 5 7 9 10 7 15]);
[newVec3s] = fivePrime_soln([2 12 7 8 7 2 15 9]);


t1=isequaln(newVec1,newVec1s);
t2=isequaln(newVec2,newVec2s);
t3=isequaln(newVec3,newVec3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
