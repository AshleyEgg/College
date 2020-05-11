clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for clockHands

[hr1, min1] = clockHands(6, 45, 10);
% 	hr1 =>      6
% 	min1 =>     55 
[hr2, min2] = clockHands(4, 45, -30);
% 	hr2 =>      4
% 	min2 =>     15
[hr3, min3] = clockHands(1, 10, -134);
% 	hr3 =>     10
% 	min3 =>     56

[shr1, smin1] = clockHands_soln(6, 45, 10);
[shr2, smin2] = clockHands_soln(4, 45, -30);
[shr3, smin3] = clockHands_soln(1, 10, -134);

t1h=isequal(hr1,shr1);
t1m=isequal(min1,smin1);
t2h = isequal(hr2,shr2);
t2m=isequal(min2,smin2);
t3h=isequal(hr3,shr3);
t3m=isequal(min3, smin3);

if (isequal(t1h,t1m,t2h,t2m,t3h,t3m))
    x =1
else
    x=0
end
