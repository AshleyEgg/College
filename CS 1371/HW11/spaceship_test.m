clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for spaceship
load('spaceshipStudentCases.mat')

[ship1] = spaceship(data1, dist1);
% 	ship1 => The spaceship's warning alarm sounded 99387.29 meters from the Earth. Unfortunately, the ship did not make it.
% 
[ship2] = spaceship(data2, dist2);
% 	ship2 => The spaceship's warning alarm sounded 48223.67 meters from the Earth. Unfortunately, the ship did not make it.
% 
[ship3] = spaceship(data3, dist3);
% 	ship3 => The spaceship's warning alarm sounded 72.02 meters from the Earth. Luckily, the ship landed safely!                 
%

[ship1s] = spaceship_soln(data1, dist1);
[ship2s] = spaceship_soln(data2, dist2);
[ship3s] = spaceship_soln(data3, dist3);


t1=strcmp(ship1,ship1s);
t2=strcmp(ship2,ship2s);
t3=strcmp(ship3,ship3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end