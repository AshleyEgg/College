clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for runHomeworkCode
load('runHomeworkCode_studentcases.mat')

[out1] = runHomeworkCode(problem1);
% 	out1 =>  
%      inputs: {[0]  [15]  [17]  [19]}                                           
%        name: 'p1'                                                              
%     outputs: {[17]  [248.082201995573]  [312.611489018458]  [385.120367358902]}
% 
[out2] = runHomeworkCode(problem2);
% 	out1 =>  
%        name: 'sortdesc'                                 
%      inputs: {[-2 -3 -4 1]  [1×10 double]  [4×4 double]}
%     outputs: {[1 -2 -3 -4]  [1×10 double]  [4×4 double]}
% 
[out3] = runHomeworkCode(problem3);
% 	out1 =>  
%        name: 'isAllUppercase'
%      inputs: {1×3 cell}      
%     outputs: {[1]  [0]  [0]} 

[out1s] = runHomeworkCode_soln(problem1);
[out2s] = runHomeworkCode_soln(problem2);
[out3s] = runHomeworkCode_soln(problem3);


t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end