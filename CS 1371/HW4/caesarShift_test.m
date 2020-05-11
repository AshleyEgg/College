clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for caesarShift
[out1] = caesarShift('i love matlab', 0);
% 	out1 => I LOVE MATLAB6
% 
[out2] = caesarShift('Alea Jacta Est', 10);
% 	out1 => QVVQ TQSDQ VID11
% 
[out3] = caesarShift('Inter arma enim silent leges', -100);
% 	out1 => ERXAV WVIW AREI OEPARX PACAO12

[out1s] = caesarShift_soln('i love matlab', 0);
[out2s] = caesarShift_soln('Alea Jacta Est', 10);
[out3s] = caesarShift_soln('Inter arma enim silent leges', -100);



t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
