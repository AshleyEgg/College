clear
clc
%Program to run the test cases and determine if they are equal to the
%solution file solutions for applesAndOranges
[app1, ora1] = applesAndOranges(10, 10, 8, 8);
% 	app1 =>     10
% 	ora1 =>     10
% 
[app2, ora2] = applesAndOranges(20, 30, 20, 22);
% 	app2 =>      0
% 	ora2 =>     16
% 
[app3, ora3] = applesAndOranges(41, 10, 10, 10);
% 	app3 =>                      60.78
% 	ora3 =>      0

[sapp1, sora1] = applesAndOranges_soln(10, 10, 8, 8);
[sapp2, sora2] = applesAndOranges_soln(20, 30, 20, 22);
[sapp3, sora3] = applesAndOranges_soln(41, 10, 10, 10);

t1a=isequal(app1,sapp1);
t1o=isequal(ora1,sora1);
t2a = isequal(app2,sapp2);
t2o=isequal(ora2,sora2);
t3a=isequal(app3,sapp3);
t3o=isequal(ora3, sora3);

if (isequal(t1a,t1o,t2a,t2o,t3a,t3o)&&t1a==1)
    x =1
else
    x=0
end