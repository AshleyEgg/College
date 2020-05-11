clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for wordCounter

[cellarr1] = wordCounter('twinkle.txt');
% 	cellarr1 =>  
%     'are'    'how'    'i'    'little'    'star'    'twinkle'    'what'    'wonder'    'you'
%     [  1]    [  1]    [1]    [     1]    [   1]    [      2]    [   1]    [     1]    [  1]
% 
[cellarr2] = wordCounter('Hooked_on_a_Feeling.txt');
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
[cellarr3] = wordCounter('The_Sorcerers_Stone.txt');
% 	cellarr3 => Value too large to display. Value should match that of the solution function.

[cellarr1s] = wordCounter_soln('twinkle.txt');
[cellarr2s] = wordCounter_soln('Hooked_on_a_Feeling.txt');
[cellarr3s] = wordCounter_soln('The_Sorcerers_Stone.txt');



t1=isequal(cellarr1,cellarr1s);
t2=isequal(cellarr2,cellarr2s);
t3=isequal(cellarr3,cellarr3s);



if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end