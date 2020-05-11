clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for gravity
[a1] = gravity(5e10, 4e12, 9);
% 	a1 =>                       3.29
% 
[a2] = gravity(3e12, 4e14, 50);
% 	a2 =>                      10.67
% 
[a3] = gravity(70, 5.972e24, 6.371e6);
% 	a3 =>                       9.81


[s1] = gravity_soln(5e10, 4e12, 9);
[s2] = gravity_soln(3e12, 4e14, 50);
[s3] = gravity_soln(70, 5.972e24, 6.371e6);

t1=isequal(a1,s1);
t2=isequal(a2,s2);
t3=isequal(a3,s3);

if (isequal(t1,t2,t3))
    x =1
else
    x=0
end