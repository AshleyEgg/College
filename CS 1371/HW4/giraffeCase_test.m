clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for giraffeCase
[out1] = giraffeCase('I want to be a giraffe someday!');
% 	out1 => IwanTtObEAGIRAFFEsomedaY
% 
[out2] = giraffeCase('They''re my favorite exhibit at the zoo.');
% 	out2 => theyrEmYfavoritEexhibiTaTthEzoO
% 
[out3] = giraffeCase('Giraffes live in    the African Savannah. Not the  city in Georgia.');
% 	out3 => GIRAFFESlivEiNthEafricaNsavannaHnoTthEcitYiNgeorgiA

[out1s] = giraffeCase_soln('I want to be a giraffe someday!');
[out2s] = giraffeCase_soln('They''re my favorite exhibit at the zoo.');
[out3s] = giraffeCase_soln('Giraffes live in    the African Savannah. Not the  city in Georgia.');



t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
