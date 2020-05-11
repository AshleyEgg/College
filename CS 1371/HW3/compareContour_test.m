clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for compareContour
[isSame1] = compareContour([1, 2, 3], [2, 3, 4]);
% 	isSame1 =>      1
% 
[isSame2] = compareContour([-3, 0, -10], [0, 2, 3]);
% 	isSame2 =>      0
% 
[isSame3] = compareContour([3, 0, 3], [10, -10, 10]);
% 	isSame3 =>      1
% 
[isSame4] = compareContour([3, 0, 0], [10, -10, -10]);
% 	isSame4 =>      1

[isSame1s] = compareContour_soln([1, 2, 3], [2, 3, 4]);
[isSame2s] = compareContour_soln([-3, 0, -10], [0, 2, 3]);
[isSame3s] = compareContour_soln([3, 0, 3], [10, -10, 10]);
[isSame4s] = compareContour_soln([3, 0, 0], [10, -10, -10]);

t1=isequal(isSame1,isSame1s);
t2=isequal(isSame2,isSame2s);
t3=isequal(isSame3,isSame3s);
t4=isequal(isSame3,isSame3s);

if (isequal(t1,t2,t3,t4)&t1==1)
    x =1
else
    x=0
end
