function [data]=deepestLayer(data)
%Goes through a nested cell array to find the data inside it
while iscell(data)%While data is a cell array 
    data=deepestLayer(data{1});  
end
end