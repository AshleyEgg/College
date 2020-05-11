function [out]=gorillaCase(in)
%Puts a sentence into gorillaCase
in=lower(in);%Lowercases everything
letters=in>='a'&in<='z'|in==' ';%Finds letters and spaces
in=in(letters);%Gets rid of all non letters
spaces=in==' ';%mask of spaces
[tok,rem]=strtok(in);%Initilizes the first word
vec='';%Makes an empty string
while ~isempty(tok)
    k=strfind(tok,tok(end));%Finds where indicies of where the last letter
    len=k(end);%Finds the length of the word
    if mod(len,2)==1
       tok(1:2:end)=upper(tok(1:2:end));%If the length is odd uppercase the odd letters
    end
    vec=[vec,tok];%Adds edited strings to vec
    [tok,rem]=strtok(rem);%Finds the next word to run with
end
out='';%Intilizes empty string
out(~spaces)=vec;%Where there are not spaces fill in the letters
out(spaces)=' ';%Adds the spaces back in

end