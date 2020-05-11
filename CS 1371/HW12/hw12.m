%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 12 Original
% Course       : CS1371
% Section      : A01
% Collaboration: "I worked on this homework with Sophia Cuellar, used solutions or partial
%                  solutions provided by no one, and referred to MATLAB
%                  website
%
% Files to submit:
%	ABCs_recursion.m
%	anagram.m
%	collatz.m
%	deepestLayer.m
%	fabricShop.m
%	fountainOfYouth.m
%	hw12.m
%	r_nFib.m
%	recursiveCampanile.m
%	recursiveCheckers.m
%	sixDegreesOfPotter.m
%	solveSudoku.m
%	spaceJam.m
%	speedStack.m
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
% Part of this homework is an m-file called "ABCs_recursion.m".
% Open this file in MATLAB and complete it
% according to the directions contained within. You can test your answers with
% the test file listed below.
%
% Files to Complete: 
%	ABCs_recursion.m

%
% ABCs File Testing:
%	ABCs_hw12_pretest.p
%
%==========================================================================
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW12_DrillProblems.pdf",
% containing instructions for 12 drill problems that cover the
% following topic:
%
%	Recursion
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
%% Function Name: deepestLayer
%
% Test Cases:
% [out1] = deepestLayer({{{{934}}}})
% 	out1 =>    934
% 
% [out2] = deepestLayer({{{'Dumbledore > Gandalf'}}})
% 	out2 => Dumbledore > Gandalf
% 
% [out3] = deepestLayer(true)
% 	out3 =>    1
%
%--------------------------------------------------------------------------------
%% Function Name: anagram
%
% Test Cases:
% anagram('abc', 'anagram1.txt')
% 		Output text file(s) should be identical to that produced by the solution file
% 
% anagram('anagram', 'anagram2.txt')
% 		Output text file(s) should be identical to that produced by the solution file
% 
% anagram('MATLABae', 'anagram3.txt')
% 		Output text file(s) should be identical to that produced by the solution file
% 
% anagram('I<3CS1371', 'anagram4.txt')
% 		Output text file(s) should be identical to that produced by the solution file
%
%--------------------------------------------------------------------------------
%% Function Name: fabricShop
%
% Test Cases:
% [numCuts1] = fabricShop(3)
% 	numCuts1 =>      1
% 
% [numCuts2] = fabricShop(16)
% 	numCuts2 =>      8
% 
% [numCuts3] = fabricShop(65)
% 	numCuts3 =>    147
% 
% [numCuts4] = fabricShop(150)
% 	numCuts4 =>         1296
%
%--------------------------------------------------------------------------------
%% Function Name: recursiveCheckers
%
% Setup:
%	load boards.mat
%
% Test Cases:
% [jumps1] = recursiveCheckers(board1)
% 	jumps1 =>      2
% 
% [jumps2] = recursiveCheckers(board2)
% 	jumps2 =>      2
% 
% [jumps3] = recursiveCheckers(board3)
% 	jumps3 =>      3
% 
% [jumps4] = recursiveCheckers(board4)
% 	jumps4 =>      2
%
%--------------------------------------------------------------------------------
%% Function Name: collatz
%
% Test Cases:
% [out1, steps1] = collatz(1)
% 	out1 =>      1
% 	steps1 =>      0
% 
% [out2, steps2] = collatz(54789)
% 	out2 =>      1
% 	steps2 =>    153
% 
% [out3, steps3] = collatz(10)
% 	out3 =>      1
% 	steps3 =>      6
%
%--------------------------------------------------------------------------------
%% Function Name: speedStack
%
% Test Cases:
% [stack1] = speedStack(3, '1')
% 	stack1 =>  
%   1  
%  1 1 
% 1 1 1
% 
% [stack2] = speedStack(10, 'O')
% 	stack2 =>  
%          O         
%         O O        
%        O O O       
%       O O O O      
%      O O O O O     
%     O O O O O O    
%    O O O O O O O   
%   O O O O O O O O  
%  O O O O O O O O O 
% O O O O O O O O O O
% 
% [stack3] = speedStack(30, '#')
% 	stack3 =>  
%                              #                             
%                             # #                            
%                            # # #                           
%                           # # # #                          
%                          # # # # #                         
%                         # # # # # #                        
%                        # # # # # # #                       
%                       # # # # # # # #                      
%                      # # # # # # # # #                     
%                     # # # # # # # # # #                    
%                    # # # # # # # # # # #                   
%                   # # # # # # # # # # # #                  
%                  # # # # # # # # # # # # #                 
%                 # # # # # # # # # # # # # #                
%                # # # # # # # # # # # # # # #               
%               # # # # # # # # # # # # # # # #              
%              # # # # # # # # # # # # # # # # #             
%             # # # # # # # # # # # # # # # # # #            
%            # # # # # # # # # # # # # # # # # # #           
%           # # # # # # # # # # # # # # # # # # # #          
%          # # # # # # # # # # # # # # # # # # # # #         
%         # # # # # # # # # # # # # # # # # # # # # #        
%        # # # # # # # # # # # # # # # # # # # # # # #       
%       # # # # # # # # # # # # # # # # # # # # # # # #      
%      # # # # # # # # # # # # # # # # # # # # # # # # #     
%     # # # # # # # # # # # # # # # # # # # # # # # # # #    
%    # # # # # # # # # # # # # # # # # # # # # # # # # # #   
%   # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
%  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
% # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
%
%--------------------------------------------------------------------------------
%% Function Name: r_nFib
%
% Test Cases:
% [seq1] = r_nFib(4, 10)
% 	seq1 =>      4     4     8    12    20    32    52    84   136   220
% 
% [seq2] = r_nFib(0, 6)
% 	seq2 =>      0     1     1     2     3     5
% 
% [seq3] = r_nFib(400, 1)
% 	seq3 =>    400
%
%--------------------------------------------------------------------------------
%% Function Name: fountainOfYouth
%
% Setup:
%	load mazes.mat
%
% Test Cases:
% [log1] = fountainOfYouth(maze1)
% 	log1 =>    1
% 
% [log2] = fountainOfYouth(maze2)
% 	log2 =>    0
% 
% [log3] = fountainOfYouth(maze3)
% 	log3 =>    1
%
%--------------------------------------------------------------------------------
%% Function Name: recursiveCampanile
%
% Test Cases:
% recursiveCampanile(10, 0, 'rkbgcym')
% 		Output plot(s) should be identical to that produced by solution file
% 
% recursiveCampanile(12, pi/32, 'b')
% 		Output plot(s) should be identical to that produced by solution file
% 
% recursiveCampanile(15, pi/45, 'kg')
% 		Output plot(s) should be identical to that produced by solution file
% 
% recursiveCampanile(15, pi/40, 'cbk')
% 		Output plot(s) should be identical to that produced by solution file
%
%--------------------------------------------------------------------------------
%% Function Name: solveSudoku
%
% Setup:
%	load sudoku.mat
%
% Test Cases:
% [arr1] = solveSudoku(board1)
% 	arr1 =>  
%      1     2     3     4     5     6     7     8     9
%      7     8     9     1     2     3     4     5     6
%      4     5     6     7     8     9     1     2     3
%      9     1     2     3     4     5     6     7     8
%      6     7     8     9     1     2     3     4     5
%      3     4     5     6     7     8     9     1     2
%      8     9     1     2     3     4     5     6     7
%      5     6     7     8     9     1     2     3     4
%      2     3     4     5     6     7     8     9     1
% 
% [arr2] = solveSudoku(board2)
% 	arr2 =>  
%      1     4     6     2     7     8     9     3     5
%      8     5     7     3     4     9     1     6     2
%      2     9     3     6     1     5     8     4     7
%      3     7     9     8     2     1     6     5     4
%      4     6     1     5     3     7     2     8     9
%      5     8     2     9     6     4     3     7     1
%      7     3     4     1     9     6     5     2     8
%      6     1     8     7     5     2     4     9     3
%      9     2     5     4     8     3     7     1     6
% 
% [arr3] = solveSudoku(board3)
% 	arr3 =>  
%      1     3     6     2     5     9     7     4     8
%      7     2     5     4     1     8     9     3     6
%      4     8     9     3     6     7     1     5     2
%      3     6     4     7     8     5     2     1     9
%      5     1     8     6     9     2     3     7     4
%      9     7     2     1     3     4     6     8     5
%      2     4     1     5     7     6     8     9     3
%      8     5     3     9     2     1     4     6     7
%      6     9     7     8     4     3     5     2     1
%
%--------------------------------------------------------------------------------
%% Function Name: spaceJam
%
% Setup:
%	load student.mat
%
% Test Cases:
% [space1,path1] = spaceJam(st1);
% 	space1 =>         5838
% 	path1 => \Chrysanthemumjpg
% 
% [space2, path2] = spaceJam(st2);
% 	space2 =>         6513
% 	path2 =>     '\ENGL1101\oralfinalmp'    '\ENGL1101\videosubmission'
% 
% [space3, path3] = spaceJam(st3);
% 	space3 =>         1897
% 	path3 => \CS1371\HW6\easterEggpng
%
%--------------------------------------------------------------------------------
%% Function Name: sixDegreesOfPotter
%
% Setup:
%	load PotterTest.mat
%
% Test Cases:
% [exists1, separation1] = sixDegreesOfPotter(person1)
% 	exists1 =>    0
% 	separation1 =>      0
% 
% [exists2, separation2] = sixDegreesOfPotter(person2)
% 	exists2 =>    1
% 	separation2 =>      0
% 
% [exists3, separation3] = sixDegreesOfPotter(person3)
% 	exists3 =>    1
% 	separation3 =>      2
%
