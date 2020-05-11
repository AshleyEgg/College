clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for arrReplace
[result1] = arrReplace([4, 0, 4; 0, 4, 0; 4, 0, 4], magic(3), 4);
% 	result1 =>  
%      8     0     6
%      0     5     0
%      4     0     2
% 
[result2] = arrReplace([12 3 7 1; 1 12 7 1; 1 3 12 1; 1 3 7 12], [1 2 4 6; 8 3 9 0; 4 5 7 2; 0 3 1 1], 12);
% 	result2 =>  
%      1     3     7     1
%      1     3     7     1
%      1     3     7     1
%      1     3     7     1
% 
[result3] = arrReplace([1 9 2 3 5; 8 13 9 9 55; 89 9 233 9 9], [100 1 53 19 70; 8 96 21 34 1678; 722 144 41 377 610], 9);
% 	result3 =>  
%      1     1     2     3     5
%      8    13    21    34    55
%     89   144   233   377   610

[result1s] = arrReplace_soln([4, 0, 4; 0, 4, 0; 4, 0, 4], magic(3), 4);
[result2s] = arrReplace_soln([12 3 7 1; 1 12 7 1; 1 3 12 1; 1 3 7 12], [1 2 4 6; 8 3 9 0; 4 5 7 2; 0 3 1 1], 12);
[result3s] = arrReplace_soln([1 9 2 3 5; 8 13 9 9 55; 89 9 233 9 9], [100 1 53 19 70; 8 96 21 34 1678; 722 144 41 377 610], 9);



t1=isequal(result1,result1s);
t2=isequal(result2,result2s);
t3=isequal(result3,result3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
