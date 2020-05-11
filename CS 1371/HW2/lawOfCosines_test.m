clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for lawOfCosines
c1 = lawOfCosines(10, 20, 30);
% 	c1 =>                      12.39
% 
c2 = lawOfCosines(10, 20, 80);
% 	c2 =>                      20.75
% 
c3 = lawOfCosines(2, 50, 170);
% 	c3 =>                      51.97

s1 = lawOfCosines_soln(10, 20, 30);
s2 = lawOfCosines_soln(10, 20, 80);
s3 = lawOfCosines_soln(2, 50, 170);

t1=isequal(c1,s1);
t2=isequal(c2,s2);
t3=isequal(c3,s3);

if (isequal(t1,t2,t3))
    x =1
else
    x=0
end