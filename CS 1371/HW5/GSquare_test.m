clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for GSquare
load('GSquareStudentCases.mat');

[finalGrade1] = GSquare(grades1, comments1, gradeMode1);
% 	finalGrade1 =>                       78.6
% 
[finalGrade2] = GSquare(grades2, comments2, gradeMode2);
% 	finalGrade2 =>                       44.8
% 
[finalGrade3] = GSquare(grades3, comments3, gradeMode3);
% 	finalGrade3 =>                       36.7

[finalGrade1s] = GSquare_soln(grades1, comments1, gradeMode1);
[finalGrade2s] = GSquare_soln(grades2, comments2, gradeMode2);
[finalGrade3s] = GSquare_soln(grades3, comments3, gradeMode3);

t1=isequal(finalGrade1,finalGrade1s);
t2=isequal(finalGrade2,finalGrade2s);
t3=isequal(finalGrade3,finalGrade3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end