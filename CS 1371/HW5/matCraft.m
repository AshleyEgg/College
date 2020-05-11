function [ETscores,waterDist]=matCraft(elev,rate,myLoc)
%Evaluates a world based on terrain and elevation and distance to water
waterMask=elev<=0;%Finds underwater positions
mntMask=elev>=11;%Finds mountain positions
landMask=~(waterMask|mntMask);%Finds not water and not mountain

%Calculates elevation score
mntScore=sum(elev(mntMask));
waterScore=sum(elev(waterMask));
Escore=round(mntScore+waterScore,3);

%Calculates terrain score by finding geograhic mean
terr=rate(landMask);
n=length(terr);
landProd=prod(terr);
Tscore=round(nthroot(landProd,n),3);

ETscores=[Escore,Tscore];%Formats the output of E&T scores

%Finds the shortest distance to water
[row,col]=find(waterMask);
row=(row-myLoc(1)).^2;
col=(col-myLoc(2)).^2;
dist=sqrt(row+col);
waterDist=round(min(dist),3);

end