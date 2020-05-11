clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for starCrossed
load('student.mat');

[out1] = starCrossed(bday1, bday2, log);
% 	out1 => Your stars are crossed...a Aquarius and a Pisces can never be together.
% 
[out2] = starCrossed(bday3, bday4, log);
% 	out2 => Your stars are crossed...a Libra and a Capricorn can never be together.
% 
[out3] = starCrossed(bday5, bday6, log);
% 	out3 => A Virgo and a Gemini? Your stars are aligned! You are destined to be together.

[out1s] = starCrossed_soln(bday1, bday2, log);
[out2s] = starCrossed_soln(bday3, bday4, log);
[out3s] = starCrossed_soln(bday5, bday6, log);



t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
