clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for findDateLocation
[loc1] = findDateLocation('Wendy''s', 'McDonald''s', [1 2.5 4; 8.5 7.5 9], ['-';'+'], [10; 9.5]);
% 	loc1 => McDonald's
% 
[loc2] = findDateLocation('Georgia Aquarium', 'World of Coca-Cola', [10 8 0 9 0 9.2; 8 8 8 8.5 8 8.2], ['+';'+'], [8; 9]);
% 	loc2 => Georgia Aquarium
% 
[loc3] = findDateLocation('Paris', 'Rome', [10 10 10 0 9.2 0 1 3 0 7.1 7.2 0 0 0 7.2 10; 9.2 10 9.87 0 9.2 1.6 0 0 0 7.8 8.2 0 0 1.4 6.5 10], ['-';'-'], [9.8; 9.9]);
% 	loc3 => Rome

[loc1s] = findDateLocation_soln('Wendy''s', 'McDonald''s', [1 2.5 4; 8.5 7.5 9], ['-';'+'], [10; 9.5]);
[loc2s] = findDateLocation_soln('Georgia Aquarium', 'World of Coca-Cola', [10 8 0 9 0 9.2; 8 8 8 8.5 8 8.2], ['+';'+'], [8; 9]);
[loc3s] = findDateLocation_soln('Paris', 'Rome', [10 10 10 0 9.2 0 1 3 0 7.1 7.2 0 0 0 7.2 10; 9.2 10 9.87 0 9.2 1.6 0 0 0 7.8 8.2 0 0 1.4 6.5 10], ['-';'-'], [9.8; 9.9]);


t1=isequal(loc1,loc1s);
t2=isequal(loc2,loc2s);
t3=isequal(loc3,loc3s);


if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end
