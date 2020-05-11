%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 13 Original
% Course       : CS1371
% Section      : A01
% Collaboration: "I worked on the homework assignment alone, using
%                  only course materials."
%                 
%
% Files to submit:
%	ABCs_images.m
%	beeMovie.m
%	fifteenPuzzle.m
%	hw13.m
%	imagePoker.m
%	memeGenerator.m
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
% Part of this homework is an m-file called "ABCs_images.m".
% Open this file in MATLAB and complete it
% according to the directions contained within. You can test your answers with
% the test file listed below.
%
% Files to Complete: 
%	ABCs_images.m

%
% ABCs File Testing:
%	ABCs_hw13_pretest.p
%
%==========================================================================
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW13_DrillProblems.pdf",
% containing instructions for 4 drill problems that cover the
% following topic:
%
%	Images
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
%% Function Name: memeGenerator
%
% Setup:
%	load font.mat
%
% Test Cases:
% memeGenerator('Swarm: He would yell', 'Me: TO HELL WITH GEORGIA', 'merylStreep.png', [20 200 20])
% 		Output image(s) should be identical to that produced by solution file
% 
% memeGenerator('Cash all 3 red routes at nave', 'How bout dat', 'cashMeOutside.png', [200 200 90])
% 		Output image(s) should be identical to that produced by solution file
% 
% memeGenerator('You can''t get test cases wrong', 'If you never check them', 'rollSafe.png', [200 100 1])
% 		Output image(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: fifteenPuzzle
%
% Test Cases:
% [direction1] = fifteenPuzzle('image1puzzle.png')
% 	direction1 => L
% 		Output image(s) should be identical to that produced by solution file
% 
% [direction2] = fifteenPuzzle('image2puzzle.png')
% 	direction2 => D
% 		Output image(s) should be identical to that produced by solution file
% 
% [direction3] = fifteenPuzzle('image3puzzle.png')
% 	direction3 => U
% 		Output image(s) should be identical to that produced by solution file
% 
% [direction4] = fifteenPuzzle('image4puzzle.png')
% 	direction4 => R
% 		Output image(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: beeMovie
%
% Test Cases:
% beeMovie('bee1.jpg', [1 3])
% 		Output image(s) should be identical to that produced by solution file
% 
% beeMovie('bee2.jpg', [4 4 4])
% 		Output image(s) should be identical to that produced by solution file
% 
% beeMovie('bee3.jpg', [2 3 4 1 2])
% 		Output image(s) should be identical to that produced by solution file
% 
% beeMovie('bee4.jpg', [2 2 1 4 3 2])
% 		Output image(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: imagePoker
%
% Setup:
%	load cards.mat
%
% Test Cases:
% [cards1] = imagePoker('poker1.png', cards)
% 	cards1 =>     'ace'
% 
% [cards2] = imagePoker('poker2.png', cards)
% 	cards2 =>     'six'
% 
% [cards3] = imagePoker('poker3.png', cards)
% 	cards3 =>     'six'
%
