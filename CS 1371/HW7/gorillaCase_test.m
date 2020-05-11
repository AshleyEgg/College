clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for checkers


[gorillaStr1] = gorillaCase('The Cincinnati Zoo leads the US in western lowland gorilla births.');
% 	gorillaStr1 => ThE cincinnati ZoO LeAdS ThE us in WeStErN LoWlAnD GoRiLlA births
% 
[gorillaStr2] = gorillaCase(' In tropical forests,  gorillas are hunted  to provide meat for the Bushmeat Trade.  Logging also destroys Gorilla habitats. ');
% 	gorillaStr2 => Value too large to display. Value should match that of the solution function.
% 
[gorillaStr3] = gorillaCase('-  -  23we98 w8ill   ne678vEr for%32get0../300,$$ha2R3aMb%e    has*h3ta$$g#swag     ');
% 	gorillaStr3 =>     we will   NeVeR FoRgEtHaRaMbE    HaShTaGsWaG 

[gorillaStr1s] = gorillaCase_soln('The Cincinnati Zoo leads the US in western lowland gorilla births.');
[gorillaStr2s] = gorillaCase_soln(' In tropical forests,  gorillas are hunted  to provide meat for the Bushmeat Trade.  Logging also destroys Gorilla habitats. ');
[gorillaStr3s] = gorillaCase_soln('-  -  23we98 w8ill   ne678vEr for%32get0../300,$$ha2R3aMb%e    has*h3ta$$g#swag     ');


t1=isequal(gorillaStr1,gorillaStr1s);
t2=isequal(gorillaStr2,gorillaStr2s);
t3=isequal(gorillaStr3,gorillaStr3s);



if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end
