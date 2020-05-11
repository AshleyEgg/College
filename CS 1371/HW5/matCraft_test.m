clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for matCraft
load('matCraft_studentCases.mat');

[scores1, dist1] = matCraft(in1, in2, in3);
% 	scores1 =>                        -19                     2.616
% 	dist1 =>      0
% 
[scores2, dist2] = matCraft(in4, in5, in6);
% 	scores2 =>                        454                      5.12
% 	dist2 =>                      1.414
% 
[scores3, dist3] = matCraft(in7, in8, in9);
% 	scores3 =>                       9695                     4.298
% 	dist3 =>      1

[scores1s, dist1s] = matCraft_soln(in1, in2, in3);
[scores2s, dist2s] = matCraft_soln(in4, in5, in6);
[scores3s, dist3s] = matCraft_soln(in7, in8, in9);


t1=isequal(scores1,scores1s);
t2=isequal(scores2,scores2s);
t3=isequal(scores3,scores3s);
t4=isequal(dist1,dist1s);
t5=isequal(dist2,dist2s);
t6=isequal(dist3,dist3s);


if (isequal(t1,t2,t3,t4,t5,t6)&t1==1)
    x =1
else
    x=0
end