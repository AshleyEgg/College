function []=tankTrials(old,new)
%Compares new tank prototypes with current tanks
fhNew=fopen(new);
outF=[new(1:end-4),'_results.txt'];%Creates output file with correct name
fhOut=fopen(outF,'w');%Opens with write acess

fprintf(fhOut,'Tank Trial Results:\n');%Prints the top line

labels=fgetl(fhNew);%Gets the labels for the columns
proto=fgetl(fhNew);%Gets the first prototype

while ischar(proto)%runs through prototypes
    count=0;%Intilizes variables
    strongest=0;
    fhOld=fopen(old);%Gets one of the old tanks stats
    [pName,rem]=strtok(proto,',');%splits name and firepower
    fire=strtok(rem,',');
    fire=str2double(fire);%Gets out firepower as a double
    
    labels=fgetl(fhOld);%Gets labels for old vehicles
    current=fgetl(fhOld);%Gets data on a current tank
    while ischar(current)%Checks prototypes against all current tanks       
        [name,rem]=strtok(current,',');
        [thick,rem]=strtok(rem,',');
        angle=strtok(rem,',');
        thick=str2double(thick);
        angle=str2double(angle);
        armor=thick/cosd(angle);%Calculates the armor for each old tank
        if fire>=armor%If the proto defeats the old tank
            count=count+1;%Increase count of defeated
            if armor>strongest%Keeps track of strongest opponent
                strongest=armor;
               defeat=name;%Keeps track of name of defeated tank   
            end
        end
        current=fgetl(fhOld);
    end
    proto=fgetl(fhNew);

    %Determines which line to print out based on how many defeated and if
    %the last line
    if isnumeric(proto)
       if count==0
            fprintf(fhOut,'The %s was not able to defeat any old vehicles.',pName);
        else
            fprintf(fhOut,'The %s was able to defeat %d old vehicles! The toughest opponent it beat was the %s.',pName,count,defeat);
        end
    else
        if count==0
            fprintf(fhOut,'The %s was not able to defeat any old vehicles.\n',pName);
        else
            fprintf(fhOut,'The %s was able to defeat %d old vehicles! The toughest opponent it beat was the %s.\n',pName,count,defeat);
        end
    end
    
    fclose(fhOld);
end

fclose(fhNew);
fclose(fhOut);
end