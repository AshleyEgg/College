clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for cellSearch

load('cellSearchTests.mat');

[val1] = cellSearch(ca1, idx1);
% 	val1 =>     16
% 
[val2] = cellSearch(ca2, idx2);
% 	val2 => s
% 
[val3] = cellSearch(ca3, idx3);
% 	val3 =>     26
% 
[val4] = cellSearch(ca4, idx4);
% 	val4 => evading

[val1s] = cellSearch_soln(ca1, idx1);
[val2s] = cellSearch_soln(ca2, idx2);
[val3s] = cellSearch_soln(ca3, idx3);
[val4s] = cellSearch_soln(ca4, idx4);


t1=isequal(val1,val1s);
t2=isequal(val2,val2s);
t3=isequal(val3,val3s);
t4=isequal(val4,val4s);



if (isequal(t1,t2,t3,t4)&&t1==1)
    x =1
else
    x=0
end