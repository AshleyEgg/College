function [out]=structSort(in)
%Sorts a structure by in decreasing order by the length of the value in the
%longest fieldname

%Finds the longet fieldname
names=fieldnames(in);%Gets all the fieldnames
long='';%Intilizes the shortest possible fieldname
for i=1:length(names)%For every value in names
    if length(names{i})>=length(long)%If current fieldname is longer than current longest name
        long=names{i};%Stores that new value as the longest
    end
end

%Gets the value and sorts them by the length in decending order
hold={in.(long)};%Puts them all in a cell array 
temp=[];%Intilizes an empty vector
for i=1:length(hold)%For every value we need to sort
    len=length(hold{i});
    temp=[temp,len];%Makes a vector of the lengths of each element
end
[~,I]=sort(temp,'descend');%Sorts the vector

out=in(:,I);%Organizes the structure array according to the sorted data
end