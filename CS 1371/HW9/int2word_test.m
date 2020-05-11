clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for int2word

[numWord1] = int2word(0);
% 	numWord1 => zero
% 
[numWord2] = int2word(5);
% 	numWord2 => five
% 
[numWord3] = int2word(-100);
% 	numWord3 => negative one hundred
% 
[numWord4] = int2word(428);
% 	numWord4 => four hundred and twenty-eight

[numWord1s] = int2word_soln(0);
[numWord2s] = int2word_soln(5);
[numWord3s] = int2word_soln(-100);
[numWord4s] = int2word_soln(428);


t1=isequal(numWord1,numWord1s);
t2=isequal(numWord2,numWord2s);
t3=isequal(numWord3,numWord3s);
t4=isequal(numWord4,numWord4s);


if (isequal(t1,t2,t3,t4)&&t1==1)
    x =1
else
    x=0
end