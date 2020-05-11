%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Ashley Eggart
% T-square ID  : aeggart6
% GT Email     : aeggart6@gatech.edu
% Homework     : Homework 9 resubmission
% Course       : CS1371
% Section      : A01
% Collaboration:"I worked on this homework with Sophia Cuellar, used solutions or partial
%                  solutions provided by no one, and referred to the MATLAB
%                  website.
%
% Files to submit:
%	ABCs_cellArrays.m
%	ABCs_highLevelFileIO.m
%	cellSearch.m
%	hw09.m
%	int2word.m
%	marchMadness.m
%	warrenBuffett.m
%	wordCounter.m
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
% Part of this homework are m-files called "ABCs_highLevelFileIO.m" and "ABCs_cellArrays.m".
% Open these files in MATLAB and complete them
% according to the directions contained within. You can test your answers with
% the test file listed below.
%
% Files to Complete: 
%	ABCs_highLevelFileIO.m
%	ABCs_cellArrays.m
%
% ABCs File Testing:
%	ABCs_hw09_pretest.p
%
%==========================================================================
%% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW09_DrillProblems.pdf",
% containing instructions for 5 drill problems that cover the
% following topic:
%
%	High Level File I/O
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
%% Function Name: cellSearch
%
% Setup:
%	load cellSearchTests.mat
%
% Test Cases:
% [val1] = cellSearch(ca1, idx1)
% 	val1 =>     16
% 
% [val2] = cellSearch(ca2, idx2)
% 	val2 => s
% 
% [val3] = cellSearch(ca3, idx3)
% 	val3 =>     26
% 
% [val4] = cellSearch(ca4, idx4)
% 	val4 => evading
%
%--------------------------------------------------------------------------------
%% Function Name: warrenBuffett
%
% Test Cases:
% [invest1, sheet1] = warrenBuffett('stocks1.xlsx')
% 	invest1 => NVIDIA Corporation
% 	sheet1 =>  
%     'Symbol'    'Name'                               'Price'     'Change'    '% Change'
%     'NVDA'      'NVIDIA Corporation'                 [101.46]    [  0.97]    [    0.96]
%     'PFE'       'Pfizer Inc.'                        [ 34.26]    [   0.2]    [    0.58]
%     'VZ'        'Verizon Communications Inc.'        [  50.6]    [  0.29]    [    0.57]
%     'TSLA'      'Tesla, Inc.'                        [   257]    [  1.01]    [    0.39]
%     'X'         'United States Steel Corporation'    [ 37.01]    [  -0.3]    [   -0.81]
%     'XOM'       'Exxon Mobil Corporation'            [ 81.08]    [  -0.7]    [   -0.86]
% 
% [invest2, sheet2] = warrenBuffett('stocks2.xlsx')
% 	invest2 => PPL Corp.
% 	sheet2 => Value too large to display. Value should match that of the solution function.
% 
% [invest3, sheet3] = warrenBuffett('stocks3.xlsx')
% 	invest3 => Rockwell Automation Inc.
% 	sheet3 =>  
%   Columns 1 through 4                                                                                 
%     'Symbol'    'Industry'                  'Location'                      'Name'                    
%     'ROK'       'Industrials'               'Milwaukee, Wisconsin'          'Rockwell Automation Inc.'
%     'JWN'       'Consumer Discretionary'    'Seattle, Washington'           'Nordstrom'               
%     'SPGI'      'Financials'                'New York, New York'            'S&P Global, Inc.'        
%     'ORCL'      'Information Technology'    'Redwood Shores, California'    'Oracle Corp.'            
%     'SWN'       'Energy'                    'Houston, Texas'                'Southwestern Energy'     
%     'PYPL'      'Information Technology'    'San Jose, California'          'PayPal'                  
%     'NRG'       'Utilities'                 'Princeton, New Jersey'         'NRG Energy'              
%   Columns 5 through 7                                                                                 
%     'Price'     'Change'    '% Change'                                                                
%     [ 56.02]    [  -0.3]    [   -0.54]                                                                
%     [ 17.99]    [ -0.12]    [   -0.67]                                                                
%     [232.59]    [ -2.22]    [   -0.95]                                                                
%     [  43.3]    [ -0.44]    [   -1.02]                                                                
%     [132.32]    [ -1.43]    [   -1.08]                                                                
%     [    32]    [  -0.5]    [   -1.56]                                                                
%     [ 92.12]    [ -5.28]    [   -5.73]                                                                
% 
% [invest4, sheet4] = warrenBuffett('stocks4.xlsx')
% 	invest4 => Kantwon Rogers
% 	sheet4 =>  
%   Columns 1 through 5                                                                              
%     'Symbol'    'Price'     'Change'    'Name'                    'Industry'                       
%     'KLR'       [  1000]    [ 50000]    'Kantwon Rogers'          'Education'                      
%     'KLAC'      [ 12.29]    [  0.11]    'KLA-Tencor Corp.'        'Information Technology'         
%     'K'         [120.77]    [  0.18]    'Kellogg Co.'             'Consumer Staples'               
%     'KR'        [  39.1]    [  0.04]    'Kroger Co.'              'Consumer Staples'               
%     'KMB'       [ 86.86]    [  0.08]    'Kimberly-Clark'          'Consumer Staples'               
%     'KEY'       [145.62]    [  0.09]    'KeyCorp'                 'Financials'                     
%     'KSU'       [ 36.43]    [  0.02]    'Kansas City Southern'    'Industrials'                    
%     'KIM'       [ 42.11]    [  0.02]    'Kimco Realty'            'Real Estate'                    
%     'KSS'       [  58.6]    [ -0.05]    'Kohl's Corp.'            'Consumer Discretionary'         
%     'KMI'       [ 65.09]    [ -0.12]    'Kinder Morgan'           'Energy'                         
%     'KHC'       [ 22.22]    [ -0.24]    'Kraft Heinz Co'          'Consumer Staples'               
%   Columns 6 through 8                                                                              
%     'Sub-Industry'                                       'Location'                      '% Change'
%     'Public University'                                  'Atlanta, Georgia'              [    5000]
%     'Semiconductor Equipment'                            'Milpitas, California'          [     0.9]
%     'Packaged Foods & Meats'                             'Battle Creek, Michigan'        [    0.15]
%     'Food Retail'                                        'Cincinnati, Ohio'              [     0.1]
%     'Household Products'                                 'Irving, Texas'                 [    0.09]
%     'Banks'                                              'Cleveland, Ohio'               [    0.06]
%     'Railroads'                                          'Kansas City, Missouri'         [    0.05]
%     'REITs'                                              'New Hyde Park, New York'       [    0.05]
%     'General Merchandise Stores'                         'Menomonee Falls, Wisconsin'    [   -0.09]
%     'Oil & Gas Refining & Marketing & Transportation'    'Houston, Texas'                [   -0.18]
%     'Packaged Foods & Meats'                             'Pittsburgh, Pennsylvania'      [   -1.08]
%
%--------------------------------------------------------------------------------
%% Function Name: wordCounter
%
% Test Cases:
% [cellarr1] = wordCounter('twinkle.txt')
% 	cellarr1 =>  
%     'are'    'how'    'i'    'little'    'star'    'twinkle'    'what'    'wonder'    'you'
%     [  1]    [  1]    [1]    [     1]    [   1]    [      2]    [   1]    [     1]    [  1]
% 
% [cellarr2] = wordCounter('Hooked_on_a_Feeling.txt')
% 	cellarr2 =>  
%   Columns 1 through 10                                                                                  
%     'a'    'al'    'all'    'alone'    'alright'    'another'    'arms'    'as'    'believing'    'blue'
%     [5]    [ 1]    [  1]    [    1]    [      1]    [      1]    [   1]    [ 2]    [        2]    [   1]
%   Columns 11 through 21                                                                                 
%     'bug'    'but'    'by'    'can'    'candy'    'cant'    'cup'    'cure'    'deep'    'do'    'dont' 
%     [  1]    [  1]    [ 1]    [  1]    [    1]    [   1]    [  1]    [   1]    [   1]    [ 1]    [   2] 
%   Columns 22 through 30                                                                                 
%     'everythings'    'feeling'    'for'    'from'    'girl'    'good'    'got'    'high'    'hold'      
%     [          1]    [      4]    [  2]    [   1]    [   4]    [   1]    [  2]    [   2]    [   1]      
%   Columns 31 through 41                                                                                 
%     'hooked'    'i'    'if'    'ill'    'im'    'in'    'inside'    'is'    'it'    'its'    'just'     
%     [     3]    [3]    [ 1]    [  1]    [ 4]    [ 3]    [     1]    [ 1]    [ 1]    [  1]    [   2]     
%   Columns 42 through 52                                                                                 
%     'keep'    'know'    'let'    'lips'    'love'    'me'    'mind'    'my'    'need'    'no'    'of'   
%     [   1]    [   1]    [  1]    [   1]    [   3]    [ 8]    [   1]    [ 1]    [   1]    [ 1]    [ 2]   
%   Columns 53 through 61                                                                                 
%     'on'    'oogachaka'    'oogaooga'    'realize'    'repeated'    'seude'    'so'    'stay'    'stop' 
%     [ 7]    [        1]    [       1]    [      1]    [       1]    [    1]    [ 1]    [   1]    [   1] 
%   Columns 62 through 71                                                                                 
%     'sure'    'sweet'    'taste'    'that'    'the'    'thirsty'    'this'    'tight'    'to'    'turn' 
%     [   1]    [    1]    [    1]    [   2]    [  1]    [      1]    [   1]    [    1]    [ 1]    [   1] 
%   Columns 72 through 81                                                                                 
%     'up'    'victim'    'were'    'what'    'when'    'wine'    'with'    'yeah'    'you'    'your'     
%     [ 1]    [     1]    [   1]    [   1]    [   2]    [   1]    [   2]    [   1]    [  7]    [   1]     
%   Column 82                                                                                             
%     'youre'                                                                                             
%     [    2]                                                                                             
% 
% [cellarr3] = wordCounter('The_Sorcerers_Stone.txt')
% 	cellarr3 => Value too large to display. Value should match that of the solution function.
%
%--------------------------------------------------------------------------------
%% Function Name: int2word
%
% Test Cases:
% [numWord1] = int2word(0)
% 	numWord1 => zero
% 
% [numWord2] = int2word(5)
% 	numWord2 => five
% 
% [numWord3] = int2word(-100)
% 	numWord3 => negative one hundred
% 
% [numWord4] = int2word(428)
% 	numWord4 => four hundred and twenty-eight
%
%--------------------------------------------------------------------------------
%% Function Name: marchMadness
%
% Test Cases:
% [bracket1] = marchMadness('ppg15.xlsx', 'oppg15.xlsx', 'winPct15.xlsx', 'seed15.xlsx', 'matches.xlsx')
% 	bracket1 => Value too large to display. Value should match that of the solution function.
% 
% [bracket2] = marchMadness('ppg16.xlsx', 'oppg16.xlsx', 'winPct16.xlsx', 'seed16.xlsx', 'matches.xlsx')
% 	bracket2 => Value too large to display. Value should match that of the solution function.
% 
% [bracket3] = marchMadness('ppg15.xlsx', 'oppg16.xlsx', 'winPct15.xlsx', 'seed16.xlsx', 'matches.xlsx')
% 	bracket3 => Value too large to display. Value should match that of the solution function.
% 
% [bracket4] = marchMadness('ppg16.xlsx', 'oppg15.xlsx', 'winPct16.xlsx', 'seed15.xlsx', 'matches.xlsx')
% 	bracket4 => Value too large to display. Value should match that of the solution function.
%
