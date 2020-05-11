clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for deepestLayer

[out1] = deepestLayer({{{{934}}}});
% 	out1 =>    934
% 
[out2] = deepestLayer({{{'Dumbledore > Gandalf'}}});
% 	out2 => Dumbledore > Gandalf
% 
[out3] = deepestLayer(true);
% 	out3 =>    1

[out1s] = deepestLayer_soln({{{{934}}}});
[out2s] = deepestLayer_soln({{{'Dumbledore > Gandalf'}}});
[out3s] = deepestLayer_soln(true);


t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end