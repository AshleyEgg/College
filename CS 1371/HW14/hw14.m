%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 14 Original
% Course       : CS1371
% Section      : A01
% Collaboration: "I worked on this homework with Sophia Cuellar and Nisha Detch911420, used solutions or partial
%                  solutions provided by Sophia Cuellar, and referred to
%                  the Matlab website."
%
% Files to submit:
%	bridges.m
%	carShopping.m
%	chooseAdventure.m
%	dragRace.m
%	hw14.m
%	shiaSurprise.m
%	subsetSum.m
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
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW14_DrillProblems.pdf",
% containing instructions for 6 drill problems that cover the
% following topic:
%
%	Extra Credit
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
%% Function Name: chooseAdventure
%
% Test Cases:
% chooseAdventure('giveAMouseACookie.txt')
% 		Output text file(s) should be identical to that produced by the solution file
% 
% chooseAdventure('rudolph.txt')
% 		Output text file(s) should be identical to that produced by the solution file
% 
% chooseAdventure('georgePBurdell.txt')
% 		Output text file(s) should be identical to that produced by the solution file
%
%--------------------------------------------------------------------------------
%% Function Name: carShopping
%
% Test Cases:
% cars1 = carShopping('carstats1.xlsx','Fuel Tank','Horsepower')
% 	cars1 =>  
%   Columns 1 through 5                                                        
%     'Make'        'Model'             'Year'    'Engine Size'    'Horsepower'
%     'Cadillac'    'Escalade'          [2016]    [        6.2]    [       420]
%     'Jeep'        'Grand Cherokee'    [2012]    [        6.4]    [       470]
%     'Lexus'       'LS 600h'           [2012]    [          5]    [       389]
%   Columns 6 through 7                                                        
%     'Fuel Tank'    'RAC Rating'                                              
%     [       26]    [      52.9]                                              
%     [     24.6]    [      53.5]                                              
%     [     22.2]    [      43.8]                                              
% 
% cars2 = carShopping('carstats2.xlsx','Engine Size','Year')
% 	cars2 =>  
%   Columns 1 through 6                                                       
%     'Make'      'Model'     'Year'    'Engine Size'    'Horsepower'    'MPG'
%     'Subaru'    'Legacy'    [2013]    [        3.6]    [       256]    [ 25]
%     'Acura'     'RDX'       [2017]    [        3.5]    [       279]    [ 29]
%     'Nissan'    'Maxima'    [2016]    [        3.5]    [       300]    [ 30]
%   Columns 7 through 8                                                       
%     'Fuel Tank'    'RAC Rating'                                             
%     [     18.5]    [      31.5]                                             
%     [       16]    [      29.5]                                             
%     [       18]    [      33.9]                                             
% 
% cars3 = carShopping('carstats3.xlsx','MPG','RAC Rating')
% 	cars3 =>  
%   Columns 1 through 5                                              
%     'Make'      'Model'     'Year'    'Engine Size'    'RAC Rating'
%     'Ford'      'Focus'     [2016]    [          1]    [       9.6]
%     'Nissan'    'Sentra'    [2016]    [        1.8]    [      15.8]
%     'Subaru'    'Legacy'    [2016]    [        2.5]    [      21.9]
%   Columns 6 through 8                                              
%     'Fuel Tank'    'MPG'    'Horsepower'                           
%     [     12.4]    [ 42]    [       123]                           
%     [     13.2]    [ 38]    [       130]                           
%     [     18.5]    [ 36]    [       175]                           
%
%--------------------------------------------------------------------------------
%% Function Name: dragRace
%
% Setup:
%	load studentRaceCases.mat
%
% Test Cases:
% stOut1 = dragRace(stTimes1,stVelocities1,carsST1,330)
% 	stOut1 => The PHANTOM won the 330 meter race in 8.6 seconds! The CLK GTR had the fastest acceleration at 76.9 m/s^2!
% 
% stOut2 = dragRace(stTimes2,stVelocities2,carsST2,245)
% 	stOut2 => The IMPALA won the 245 meter race in 6.9 seconds! The IMPALA had the fastest acceleration at 230.8 m/s^2!
% 
% stOut3 = dragRace(stTimes3,stVelocities3,carsST3,397)
% 	stOut3 => The TVP 50/51 won the 397 meter race in 9.8 seconds! The T1 CUNNINGHAM had the fastest acceleration at 230.8 m/s^2!
%
%--------------------------------------------------------------------------------
%% Function Name: shiaSurprise
%
% Test Cases:
% shiaSurprise('justDoIt1.jpg', 'BinaryBridge.jpg', 40)
% 		Output plot(s) should be identical to that produced by solution file
% 		Output image(s) should be identical to that produced by solution file
% 
% shiaSurprise('justDoIt2.jpg', 'Klaus.jpg', 45)
% 		Output plot(s) should be identical to that produced by solution file
% 		Output image(s) should be identical to that produced by solution file
% 
% shiaSurprise('iAmNotFamous.jpg', 'Library.jpg', 60)
% 		Output plot(s) should be identical to that produced by solution file
% 		Output image(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: bridges
%
% Setup:
%	load bridges_studentCases.mat
%
% Test Cases:
% [islands1, path1] = bridges(bridges1)
% 	islands1 => Structure array should be identical to that produced by solution file
% 	path1 =>     'd'    'c'    'b'    'a'
% 
% [islands2, path2] = bridges(bridges2)
% 	islands2 => Structure array should be identical to that produced by solution file
% 	path2 =>     'd'    'a'    'e'    'c'    'b'
% 
% [islands3, path3] = bridges(bridges3)
% 	islands3 => Structure array should be identical to that produced by solution file
% 	path3 =>     [3]    [5]    [3]    [3]
%
%--------------------------------------------------------------------------------
%% Function Name: subsetSum
%
% Test Cases:
% [log1, sub1] = subsetSum([3, 4, 1, 7], 10)
% 	log1 =>    1
% 	sub1 =>      3     7
% 
% [log2, sub2] = subsetSum([1, 8, -5, -2], 4)
% 	log2 =>    1
% 	sub2 =>      1     8    -5
% 
% [log3, sub3] = subsetSum([10, 6, 1, 5, 8], 26)
% 	log3 =>    0
% 	sub3 => []
%
