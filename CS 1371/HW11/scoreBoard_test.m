clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for scoreBoard
load('testCases.mat')

[report1] = scoreBoard(teams1, game1);
% 	report1 => Geargia Tech totally dominated this game and took home the win from University of Indiana!
% 		Output plot(s) should be identical to that produced by solution file
% 
[report2] = scoreBoard(teams2, game2);
% 	report2 => Although a fairly evenly matched game, Warriors came out on top over Hawks tonight!
% 		Output plot(s) should be identical to that produced by solution file
% 
[report3] = scoreBoard(teams3, game3);
% 	report3 => Monstars totally dominated this game but Tune Squad stole the win tonight!
% 		Output plot(s) should be identical to that produced by solution file

[report1s] = scoreBoard_soln(teams1, game1);
[report2s] = scoreBoard_soln(teams2, game2);
[report3s] = scoreBoard_soln(teams3, game3);

t1=strcmp(report1,report1s);
t2=strcmp(report2,report2s);
t3=strcmp(report3,report3s);

checkPlots('scoreBoard',teams1, game1)
checkPlots('scoreBoard',teams2, game2)
checkPlots('scoreBoard',teams3, game3)

if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end