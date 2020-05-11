clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for decodeASCII
load('studentCasesASCII.mat');
[out1] = decodeASCII(in1, 2, 2, '@', 3);
% 	out1 => Value too large to display. Value should match that of the solution function.
% 
[out2] = decodeASCII(in2, .5, 1.5, '*', 1);
% 	out2 => Value too large to display. Value should match that of the solution function.
% 
[out3] = decodeASCII(in3, .75, 2, 'X', 2);
% 	out3 => Value too large to display. Value should match that of the solution function.


[out1s] = decodeASCII_soln(in1, 2, 2, '@', 3); 
[out2s] = decodeASCII_soln(in2, .5, 1.5, '*', 1);
[out3s] = decodeASCII_soln(in3, .75, 2, 'X', 2);




t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end