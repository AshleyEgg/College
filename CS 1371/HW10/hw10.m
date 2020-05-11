%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 10 Resubmission
% Course       : CS1371
% Section      : A01
% Collaboration: "I worked on the homework assignment alone, using
%                  only course materials."
%                 
%
% Files to submit:
%	ABCs_structureArrays.m
%	ABCs_structures.m
%	getRose.m
%	helpDesk.m
%	hw10.m
%	runHomeworkCode.m
%	structSort.m
%	updateRoster.m
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
% Part of this homework are m-files called "ABCs_structures.m" and "ABCs_structureArrays.m".
% Open these files in MATLAB and complete them
% according to the directions contained within. You can test your answers with
% the test file listed below.
%
% Files to Complete: 
%	ABCs_structures.m
%	ABCs_structureArrays.m
%
% ABCs File Testing:
%	ABCs_hw10_pretest.p
%
%==========================================================================
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW10_DrillProblems.pdf",
% containing instructions for 5 drill problems that cover the
% following topic:
%
%	Structures
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
%% Function Name: updateRoster
%
% Setup:
%	load updateRosterTests.mat
%
% Test Cases:
% [outt1] = updateRoster(oldst1, nca1, removed1)
% 	outt1 =>  
%     AasenGrant: {[82]  'P'  [6020]} 
%      BryanWill: {[70]  'OL'  [6040]}
%      CampJalen: {[80]  'WR'  [6020]}
% 
% [outt2] = updateRoster(oldst2, nca2, removed2)
% 	outt2 =>  
%       JohnCena: {[1738]  'Pro'  [9000]}               
%     Undertaker: {[122]  'Pro'  [5646]  'Hall of Fame'}
%       Duckhunt: {[70]  'LOL'  [6254]}                 
% 
% [outt3] = updateRoster(oldst3, nca3, removed3)
% 	outt3 =>  
%     XzavionCurry: {'R/R'  'RHP'  '5-10'  [185]  'FR'  'Atlanta, Ga'}               
%       CarterHall: {'R/R'  'MIF'  '6-0'  [178]  'SO'  'Alpharetta, GA'}             
%       WadeBailey: {'R/R'  'MIF'  '5-9'  [182]  'JR'  'Villa Rica, GA'}             
%       BuckFarmer: {'R/R'  'MIF'  '6-4'  [225]  'JR'  'Conyers, GA'  'Hall of Fame'}
%       KyleMcCann: {'L/R'  'C'  '6-2'  [204]  'FR'  'Suwanee, GA'}                  
%
%--------------------------------------------------------------------------------
%% Function Name: structSort
%
% Setup:
%	load studentStructs.mat
%
% Test Cases:
% [str1] = structSort(simpleStruct);
% 	str1 => Structure array should be identical to that produced by solution file
% 
% [str2] = structSort(taStruct1);
% 	str2 => Structure array should be identical to that produced by solution file
% 
% [str3] = structSort(taStruct2);
% 	str3 => Structure array should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: getRose
%
% Setup:
%	load roseTest.mat
%
% Test Cases:
% [winner1] = getRose(sa3, ca3)
% 	winner1 => Sheryl
% 
% [winner2] = getRose(sa2, ca2)
% 	winner2 => Fonzy
% 
% [winner3] = getRose(sa1, ca1)
% 	winner3 => Corinne
%
%--------------------------------------------------------------------------------
%% Function Name: runHomeworkCode
%
% Setup:
%	load runHomeworkCode_studentcases.mat
%
% Test Cases:
% [out1] = runHomeworkCode(problem1)
% 	out1 =>  
%      inputs: {[0]  [15]  [17]  [19]}                                           
%        name: 'p1'                                                              
%     outputs: {[17]  [248.082201995573]  [312.611489018458]  [385.120367358902]}
% 
% [out1] = runHomeworkCode(problem2)
% 	out1 =>  
%        name: 'sortdesc'                                 
%      inputs: {[-2 -3 -4 1]  [1×10 double]  [4×4 double]}
%     outputs: {[1 -2 -3 -4]  [1×10 double]  [4×4 double]}
% 
% [out1] = runHomeworkCode(problem3)
% 	out1 =>  
%        name: 'isAllUppercase'
%      inputs: {1×3 cell}      
%     outputs: {[1]  [0]  [0]} 
%
%--------------------------------------------------------------------------------
%% Function Name: helpDesk
%
% Setup:
%	load helpDeskStructures.mat
%
% Test Cases:
% [helpdeskAssignments1] = helpDesk(HDstruc1, 'TApreferences1.txt', 'Tuesday28FebHelpdesk.xlsx')
% 	helpdeskAssignments1 => Structure array should be identical to that produced by solution file
% 
% [helpdeskAssignments2] = helpDesk(HDstruc2, 'TApreferences2.txt', 'Wednesday15MarHelpdesk.xlsx')
% 	helpdeskAssignments2 => Structure array should be identical to that produced by solution file
% 
% [helpdeskAssignments3] = helpDesk(HDstruc3, 'TApreferences3.txt', 'Friday03MarHelpdesk.xlsx')
% 	helpdeskAssignments3 => Structure array should be identical to that produced by solution file
%
