clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for collatz

[out1, steps1] = collatz(1);
% 	out1 =>      1
% 	steps1 =>      0
% 
[out2, steps2] = collatz(54789);
% 	out2 =>      1
% 	steps2 =>    153
% 
[out3, steps3] = collatz(10);
% 	out3 =>      1
% 	steps3 =>      6

[out1s, steps1s] = collatz_soln(1);
[out2s, steps2s] = collatz_soln(54789);
[out3s, steps3s] = collatz_soln(10);



t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);
t4=isequal(steps1,steps1s);
t5=isequal(steps2,steps2s);
t6=isequal(steps3,steps3s);


if (isequal(t1,t2,t3,t4,t5,t6)&&t1==1)
    x =1
else
    x=0
end