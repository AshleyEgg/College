clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for criminalMinds
[suspectNumber1] = criminalMinds([true true false true], [true false false true], [true true false true], [true true false true]);
% 	suspectNumber1 => Suspect #2 is lying.
% 
[suspectNumber2] = criminalMinds([true false false], [true false true], [true false true], [true false true]);
% 	suspectNumber2 => Suspect #1 is lying.
% 
[suspectNumber3] = criminalMinds([false false false false false], [false false false false false], [false false false false false], [false true false false false]);
% 	suspectNumber3 => Suspect #4 is lying.
% 
[suspectNumber4] = criminalMinds([true true], [false false], [true true], [true true]);
% 	suspectNumber4 => Suspect #2 is lying.

[suspectNumber1s] = criminalMinds_soln([true true false true], [true false false true], [true true false true], [true true false true]);
[suspectNumber2s] = criminalMinds_soln([true false false], [true false true], [true false true], [true false true]);
[suspectNumber3s] = criminalMinds_soln([false false false false false], [false false false false false], [false false false false false], [false true false false false]);
[suspectNumber4s] = criminalMinds_soln([true true], [false false], [true true], [true true]);




t1=isequal(suspectNumber1,suspectNumber1s);
t2=isequal(suspectNumber2,suspectNumber2s);
t3=isequal(suspectNumber3,suspectNumber3s);
t4=isequal(suspectNumber4,suspectNumber4s);

if (isequal(t1,t2,t3,t4)&t1==1)
    x =1
else
    x=0
end
