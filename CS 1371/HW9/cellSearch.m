function [val]=cellSearch(cA,ind)
%Searches through a nested cell array to find a specific value
temp=cA{ind(1)};%Intilizes value
for i=2:length(ind)%For the number of indecies    
    if i==length(ind)&& ~iscell(temp)%If last index and not a cell
        val=temp(ind(end));
    elseif i==length(ind)&& iscell(temp)%If last index and is a cell
        val=temp{ind(end)};
    else%Otherwise keep going
        temp=temp{ind(i)};
    end
end
end