clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for arr2text

arr2text([4, 2, 8; 5, 2, 1], 'test1.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
arr2text(7, 'test2.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
arr2text(magic(100), 'test3.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
arr2text([923451, 567, 18934; 4, 2, 8; 347899, 23, 1324789234], 'test4.txt');
% 		Output text file(s) should be identical to that produced by the solution file

arr2text_soln([4, 2, 8; 5, 2, 1], 'test1.txt');
arr2text_soln(7, 'test2.txt');
arr2text_soln(magic(100), 'test3.txt');
arr2text_soln([923451, 567, 18934; 4, 2, 8; 347899, 23, 1324789234], 'test4.txt');


%Use visdiff(filename,solnfilename) to comapre the files
visdiff('test1.txt','test1_soln.txt')
visdiff('test2.txt','test2_soln.txt')
visdiff('test3.txt','test3_soln.txt')
visdiff('test4.txt','test4_soln.txt')