function []=chooseAdventure(name)
fh=fopen(name)
name=[name(1:end-4),'_chAdv.txt'];
fhOut=fopen(name,'w');
line=fgetl(fh);
[sent,rem]=strtok(line,'<');
end