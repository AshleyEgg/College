%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 11 Original
% Course       : CS1371
% Section      : A01
% Collaboration: "I worked on this homework with Sophia Cuellar, used solutions or partial
%                  solutions provided by no one, and referred to the MATLAB
%                  website
%
% Files to submit:
%	ABCs_numericalMethods.m
%	ABCs_plotting.m
%	findLocalMin.m
%	greenshield.m
%	hw11.m
%	rollerCoaster.m
%	scoreBoard.m
%	spaceship.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
%% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework are m-files called "ABCs_plotting.m" and "ABCs_numericalMethods.m".
% Open these files in MATLAB and complete them
% according to the directions contained within. You can test your answers with
% the test file listed below.
%
% Files to Complete: 
%	ABCs_plotting.m
%	ABCs_numericalMethods.m
%
% ABCs File Testing:
%	ABCs_hw11_pretest.p
%
%==========================================================================
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW11_DrillProblems.pdf",
% containing instructions for 5 drill problems that cover the
% following topics:
%
%	Plotting
%	Numerical Methods
%
% Follow the directions carefully to write code to complete the drill
% problems as described. Make sure file names as well as function headers
% are written exactly as described in the problem text. If your function
% headers are not written as specified, you will recieve an automatic
% zero for that problem.
%
%==========================================================================
%% PART 3. Testing Your Code
%--------------------------------------------------------------------------
%
% You may use the following test cases for each problem to test your code.
% The function call with the test-inputs is shown in the first line of each
% test case, and the correct outputs are displayed in subsequent lines.
%
%% Function Name: spaceship
%
% Setup:
%	load spaceshipStudentCases.mat
%
% Test Cases:
% [ship1] = spaceship(data1, dist1)
% 	ship1 => The spaceship's warning alarm sounded 99387.29 meters from the Earth. Unfortunately, the ship did not make it.
% 
% [ship2] = spaceship(data2, dist2)
% 	ship2 => The spaceship's warning alarm sounded 48223.67 meters from the Earth. Unfortunately, the ship did not make it.
% 
% [ship3] = spaceship(data3, dist3)
% 	ship3 => The spaceship's warning alarm sounded 72.02 meters from the Earth. Luckily, the ship landed safely!
%
%--------------------------------------------------------------------------------
%% Function Name: scoreBoard
%
% Setup:
%	load testCases.mat
%
% Test Cases:
% [report1] = scoreBoard(teams1, game1)
% 	report1 => Geargia Tech totally dominated this game and took home the win from University of Indiana!
% 		Output plot(s) should be identical to that produced by solution file
% 
% [report2] = scoreBoard(teams2, game2)
% 	report2 => Although a fairly evenly matched game, Warriors came out on top over Hawks tonight!
% 		Output plot(s) should be identical to that produced by solution file
% 
% [report3] = scoreBoard(teams3, game3)
% 	report3 => Monstars totally dominated this game but Tune Squad stole the win tonight!
% 		Output plot(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: greenshield
%
% Test Cases:
% greenshield('trafficflow1.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
% greenshield('trafficflow2.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
% greenshield('trafficflow3.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: findLocalMin
%
% Test Cases:
% [result1] = findLocalMin('f(x) = 2x^2 + -1x', -5, 5, -2)
% 	result1 =>                       0.25                    -0.125
% 		Output plot(s) should be identical to that produced by solution file
% 
% [result2] = findLocalMin('f(y) = y^3 + -6y^2 + 11.1y + 6', 0, 4, 3)
% 	result2 =>                      2.563                    11.872
% 		Output plot(s) should be identical to that produced by solution file
% 
% [result3] = findLocalMin('f(z) = z^4 + -8z^2', -3, 4, 4)
% 	result3 =>      2   -16
% 		Output plot(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: rollerCoaster
%
% Test Cases:
% rollerCoaster('coaster1.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
% rollerCoaster('coaster2.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
% 
% rollerCoaster('coaster3.xlsx')
% 		Output plot(s) should be identical to that produced by solution file
%
