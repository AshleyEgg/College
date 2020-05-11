clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for greenshield

greenshield('trafficflow1.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
greenshield('trafficflow2.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
greenshield('trafficflow3.xlsx')
% 		Output plot(s) should be identical to that produced by solution file


checkPlots('greenshield','trafficflow1.xlsx')
checkPlots('greenshield','trafficflow2.xlsx')
checkPlots('greenshield','trafficflow3.xlsx')

