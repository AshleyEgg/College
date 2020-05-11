clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for nationalTresure

[str1] = nationalTreasure('cipher1.txt', 'text.txt');
% 	str1 => hello world
% 
[str2] = nationalTreasure('cipher2.txt', 'declaration.txt');
% 	str2 => Nicolas Cage is the best
% 
[str3] = nationalTreasure('cipher3.txt', 'declaration.txt');
% 	str3 => Leo has nothing

[str1s] = nationalTreasure_soln('cipher1.txt', 'text.txt');
[str2s] = nationalTreasure_soln('cipher2.txt', 'declaration.txt');
[str3s] = nationalTreasure_soln('cipher3.txt', 'declaration.txt');


t1=strcmp(str1,str1s);
t2=strcmp(str2,str2s);
t3=strcmp(str3,str3s);



if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end
