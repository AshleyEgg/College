clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for gcdLCM


[g1, l1] = gcdLCM(12, 15);
% 	g1 =>      3
% 	l1 =>     60
% 
[g2, l2] = gcdLCM(11, 29);
% 	g2 =>      1
% 	l2 =>    319
% 
[g3, l3] = gcdLCM(6498, 228);
% 	g3 =>    114
% 	l3 =>        12996

[g1s, l1s] = gcdLCM_soln(12, 15);
[g2s, l2s] = gcdLCM_soln(11, 29);
[g3s, l3s] = gcdLCM_soln(6498, 228);



t1=isequal(g1,g1s);
t2=isequal(g2,g2s);
t3=isequal(g3,g3s);
t4=isequal(l1,l1s);
t5=isequal(l2,l2s);
t6=isequal(l3,l3s);


if (isequal(t1,t2,t3,t4,t5,t6)&t1==1)
    x =1
else
    x=0
end
