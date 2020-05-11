clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for structSort
load('studentStructs.mat')

[str1] = structSort(simpleStruct);
% 	str1 => Structure array should be identical to that produced by solution file
% 
[str2] = structSort(taStruct1);
% 	str2 => Structure array should be identical to that produced by solution file
% 
[str3] = structSort(taStruct2);
% 	str3 => Structure array should be identical to that produced by solution file
%

[str1s] = structSort_soln(simpleStruct);
[str2s] = structSort_soln(taStruct1);
[str3s] = structSort_soln(taStruct2);


t1=isequal(str1,str1s);
t2=isequal(str2,str2s);
t3=isequal(str3,str3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end