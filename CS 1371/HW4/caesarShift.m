function [encoded]=caesarShift(message, shift)
%Preforms a complicated Caesar shift on a message
message=upper(message);%Makes everything uppercase
spaces=message==' ';%Finds location of spaces in original message
nums=double(message);%Turns message into numbers
mask1=(mod(nums,2))==0;%Finds even nums
mask2=mod(nums,2)==1;%Finds odd nums
nums(mask1)=nums(mask1)+shift;%Adds shift to even letter
nums(mask2)=nums(mask2)-shift;%Subtracts shift from odd letters

message=char(mod(nums-'A',26)+'A');%Puts numbers in between letters


message(message=='J')='I';%Replaces J with I
message(message=='U')='V';%Replaces U with V
message(spaces)=' ';%Puts spaces in where there were orignially spaces

mask3= message=='A'|message=='E'|message=='I'|message=='O'|message=='U'|message==' ';%Finds all vowels and spaces
conson=message(~mask3);%Finds consonants
numCon=num2str(length(conson));%Finds num of consants as a string

message=char(message);%Makes the message back into a string
encoded=strcat(message,numCon);%Concatinates the message and num of consonats
end
