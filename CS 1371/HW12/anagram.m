function []=anagram(ana,name)
name=[name,'.txt'];
fh=fopen(name,'w');%Opens file with write acess

ana=lower(ana);%Makes the string all lowercase
lett=ana>='a'&&ana<'z';
ana=ana(lett);%Gets rid of all non-letters

for i=1:length(ana)%For each letter in anagram
    
end
end

function []=help()%Helper function to find permutations

end