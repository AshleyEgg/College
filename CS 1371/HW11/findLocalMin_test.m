clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for findLocalMin

[result1] = findLocalMin('f(x) = 2x^2 + -1x', -5, 5, -2);
% 	result1 =>                       0.25                    -0.125
% 		Output plot(s) should be identical to that produced by solution file
% 
[result2] = findLocalMin('f(y) = y^3 + -6y^2 + 11.1y + 6', 0, 4, 3);
% 	result2 =>                      2.563                    11.872
% 		Output plot(s) should be identical to that produced by solution file
% 
[result3] = findLocalMin('f(z) = z^4 + -8z^2', -3, 4, 4);
% 	result3 =>      2   -16
% 		Output plot(s) should be identical to that produced by solution file

[result1s] = findLocalMin_soln('f(x) = 2x^2 + -1x', -5, 5, -2);
[result2s] = findLocalMin_soln('f(y) = y^3 + -6y^2 + 11.1y + 6', 0, 4, 3);
[result3s] = findLocalMin_soln('f(z) = z^4 + -8z^2', -3, 4, 4);


t1=isequal(result1,result1s);
t2=isequal(result2,result2s);
t3=isequal(result3,result3s);

checkPlots('findLocalMin','f(x) = 2x^2 + -1x', -5, 5, -2)
checkPlots('findLocalMin','f(y) = y^3 + -6y^2 + 11.1y + 6', 0, 4, 3)
checkPlots('findLocalMin','f(z) = z^4 + -8z^2', -3, 4, 4)

if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end