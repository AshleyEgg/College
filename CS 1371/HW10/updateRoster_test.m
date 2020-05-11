clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for updateRoster
load('updateRosterTests.mat')

[outt1] = updateRoster(oldst1, nca1, removed1);
% 	outt1 =>  
%     AasenGrant: {[82]  'P'  [6020]} 
%      BryanWill: {[70]  'OL'  [6040]}
%      CampJalen: {[80]  'WR'  [6020]}
% 
[outt2] = updateRoster(oldst2, nca2, removed2);
% 	outt2 =>  
%       JohnCena: {[1738]  'Pro'  [9000]}               
%     Undertaker: {[122]  'Pro'  [5646]  'Hall of Fame'}
%       Duckhunt: {[70]  'LOL'  [6254]}                 
% 
[outt3] = updateRoster(oldst3, nca3, removed3);
% 	outt3 =>  
%     XzavionCurry: {'R/R'  'RHP'  '5-10'  [185]  'FR'  'Atlanta, Ga'}               
%       CarterHall: {'R/R'  'MIF'  '6-0'  [178]  'SO'  'Alpharetta, GA'}             
%       WadeBailey: {'R/R'  'MIF'  '5-9'  [182]  'JR'  'Villa Rica, GA'}             
%       BuckFarmer: {'R/R'  'MIF'  '6-4'  [225]  'JR'  'Conyers, GA'  'Hall of Fame'}
%       KyleMcCann: {'L/R'  'C'  '6-2'  [204]  'FR'  'Suwanee, GA'}                  
%

[outt1s] = updateRoster_soln(oldst1, nca1, removed1);
[outt2s] = updateRoster_soln(oldst2, nca2, removed2);
[outt3s] = updateRoster_soln(oldst3, nca3, removed3);

t1=isequal(outt1,outt1s);
t2=isequal(outt2,outt2s);
t3=isequal(outt3,outt3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end