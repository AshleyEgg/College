function [sortedIn]= teachersPet(grades, firstIn, lastIn)
% Should sort the grades and then sort the corresponding initials and and
% output the combined 
[Y,I]=sort(grades,'descend');% Sorts grades in descending order and returns sorted array and indexes
sfin=firstIn(I);%Sorts first initials based on index of grades
slin=lastIn(I);
spaces = char(zeros(1, length(firstIn))+' ');%Creates a vector of spaces
sorted=[sfin;slin;spaces];%Puts each vector in a column
sorted(end)=[];
sortedIn=sorted(:)';%Reads across each row and creates final vector
end