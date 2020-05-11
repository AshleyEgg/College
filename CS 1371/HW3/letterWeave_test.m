clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for letterWeave
[decoded1] = letterWeave('Ti sasnec', 'hsi  etne', 'tset');
% 	decoded1 => This is atest sentence
% 
[decoded2] = letterWeave('Tecwjme h on', 'h o uprtemo!', 'vo de');
% 	decoded2 => The cow jumped over the moon!
% 
[decoded3] = letterWeave('TeQikBonFOe h ayDg', 'h uc rw ovrteLz o.', ' spmuJ x');
% 	decoded3 => The Quick Brown Fox Jumps Over the Lazy Dog.


[sdecoded1] = letterWeave_soln('Ti sasnec', 'hsi  etne', 'tset');
[sdecoded2] = letterWeave_soln('Tecwjme h on', 'h o uprtemo!', 'vo de');
[sdecoded3] = letterWeave_soln('TeQikBonFOe h ayDg', 'h uc rw ovrteLz o.', ' spmuJ x');

t1=isequal(decoded1,sdecoded1);
t2=isequal(decoded2,sdecoded2);
t3=isequal(decoded3,sdecoded3);

if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
