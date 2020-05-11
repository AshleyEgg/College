clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for pknmBattle
load('pkmnBattle_studentCases.mat');

[out1] = pkmnBattle(myPKMN1, enemyPKMN1, myMove1, enemyMove1);
% 	out1 => You lost the battle and blacked out! The enemy had 96 HP remaining.
% 
[out2] = pkmnBattle(myPKMN2, enemyPKMN2, myMove2, enemyMove2);
% 	out2 => Congratulations, Champion of the Pokemon League! Your Pokemon survived with 45 HP.
% 
[out3] = pkmnBattle(myPKMN3, enemyPKMN3, myMove3, enemyMove3);
% 	out3 => Congratulations, Champion of the Pokemon League! Your Pokemon survived with 792 HP.

[out1s] = pkmnBattle_soln(myPKMN1, enemyPKMN1, myMove1, enemyMove1);
[out2s] = pkmnBattle_soln(myPKMN2, enemyPKMN2, myMove2, enemyMove2);
[out3s] = pkmnBattle_soln(myPKMN3, enemyPKMN3, myMove3, enemyMove3);

t1=isequal(out1,out1s);
t2=isequal(out2,out2s);
t3=isequal(out3,out3s);



if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end
