clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for getRose
load('roseTest.mat')

[winner1] = getRose(sa3, ca3);
% 	winner1 => Sheryl
% 
[winner2] = getRose(sa2, ca2);
% 	winner2 => Fonzy
% 
[winner3] = getRose(sa1, ca1);
% 	winner3 => Corinne

[winner1s] = getRose_soln(sa3, ca3);
[winner2s] = getRose_soln(sa2, ca2);
[winner3s] = getRose_soln(sa1, ca1);

t1=isequal(winner1,winner1s);
t2=isequal(winner2,winner2s);
t3=isequal(winner3,winner3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end