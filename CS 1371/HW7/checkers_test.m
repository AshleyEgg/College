clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for checkers
load('boards.mat');

[jumps1] = checkers(board1);
% 	jumps1 =>      6
% 
[jumps2] = checkers(board2);
% 	jumps2 =>      2
% 
[jumps3] = checkers(board3);
% 	jumps3 =>     14
% 
[jumps4] = checkers(board4);
% 	jumps4 =>      4

[jumps1s] = checkers_soln(board1);
[jumps2s] = checkers_soln(board2);
[jumps3s] = checkers_soln(board3);
[jumps4s] = checkers_soln(board4);




t1=isequal(jumps1,jumps1s);
t2=isequal(jumps2,jumps2s);
t3=isequal(jumps3,jumps3s);
t4=isequal(jumps4,jumps4s);



if (isequal(t1,t2,t3,t4)&&t1==1)
    x =1
else
    x=0
end
