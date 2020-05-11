function [old]=updateRoster(old,ros,remove)
%Needs to take the current roster and update it with the new info and
%remove the people not playing anymore
[r,c]=size(ros);
oldnames=fieldnames(old);

for i=2:r %for the number of players in newR skips the header row
    name=ros{i,1};%Get their name from newR
    stats=ros(i,2:end);%Get their stats and puts in a single cell array
    old.(name)=stats;%Put new stats into the roster   
    hold=strcmp(oldnames,name);
    oldnames=oldnames(~hold);
end

for j=1:length(remove) %For the length of remove get rid of these players
    temp=remove{j};
    old=rmfield(old,temp);
    hold=strcmp(oldnames,temp);
    oldnames=oldnames(~hold);
end

for k=1:length(oldnames)%For all the oldnames left
    temp=oldnames{k};
    old.(temp)=[old.(temp),'Hall of Fame'];
end


end