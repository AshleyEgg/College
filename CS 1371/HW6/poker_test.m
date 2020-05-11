clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for poker
load('pokerCases.mat');

[winner1] = poker(cards1);
% 	winner1 => Player 3 won with a Three of a Kind.
% 
[winner2] = poker(cards2);
% 	winner2 => Player 5 won with a Straight.
% 
[winner3] = poker(cards3);
% 	winner3 => Thank you for your donation to Hope and Zell Miller.

[winner1s] = poker_soln(cards1);
[winner2s] = poker_soln(cards2);
[winner3s] = poker_soln(cards3);


t1=isequal(winner1,winner1s);
t2=isequal(winner2,winner2s);
t3=isequal(winner3,winner3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
