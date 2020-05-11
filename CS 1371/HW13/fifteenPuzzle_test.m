clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for fifteenPuzzle
load font.mat
[direction1] = fifteenPuzzle('image1puzzle.png');
% 	direction1 => L
% 		Output image(s) should be identical to that produced by solution file
% 
[direction2] = fifteenPuzzle('image2puzzle.png');
% 	direction2 => D
% 		Output image(s) should be identical to that produced by solution file
% 
[direction3] = fifteenPuzzle('image3puzzle.png');
% 	direction3 => U
% 		Output image(s) should be identical to that produced by solution file
% 
[direction4] = fifteenPuzzle('image4puzzle.png');
% 	direction4 => R
% 		Output image(s) should be identical to that produced by solution file

[direction1s] = fifteenPuzzle_soln('image1puzzle.png');
[direction2s] = fifteenPuzzle_soln('image2puzzle.png');
[direction3s] = fifteenPuzzle_soln('image3puzzle.png');
[direction4s] = fifteenPuzzle_soln('image4puzzle.png');


checkImage('image1puzzle_solved.png','image1puzzle_solved.png')
checkImage('image2puzzle_solved.png','image2puzzle_solved.png')
checkImage('image3puzzle_solved.png','image3puzzle_solved.png')
checkImage('image4puzzle_solved.png','image4puzzle_solved.png')

t1=isequal(direction1,direction1s);
t2=isequal(direction2,direction2s);
t3=isequal(direction3,direction3s);
t4=isequal(direction4,direction4s);

if (isequal(t1,t2,t3,t4)&&t1==1)
    x =1
else
    x=0
end