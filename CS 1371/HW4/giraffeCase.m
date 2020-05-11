function [out]=giraffeCase(in)
%Puts the message in giraffeCase
in=lower(in);%puts everything into lower case
girInd=strfind(in,'giraffe');%Finds starting index of giraffe
in(girInd:girInd+6)=upper(in(girInd:girInd+6));%Capitilizes giraffe

maskLetS=(in>='A' & in<='Z') | (in>='a' & in<='z')| in==' ';
in=in(maskLetS);%Removes all non-letters and non-spaces
in=strcat(in,' ');%Adds a space to the end of the string

maskSpace=(in==' ');%finds the location of all the spaces
lastLetMask=[maskSpace(2:end) true];%Finds the last letter in the string
in(lastLetMask)=upper(in(lastLetMask));%Capitalizes the last letter

in(maskSpace)=[];%Removes all spaces
out=in;%Prints out final string

end