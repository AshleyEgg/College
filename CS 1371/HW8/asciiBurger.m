function []=asciiBurger(order)
%Makes a visual representation of a hamburger order and includes the price
[name,list]=strtok(order,',');
name=[name,'_order.txt'];
fhOrder=fopen(name,'w');%Opens a file to write in
[ingr,rem]=strtok(list,',');

while ~isempty(ingr)%Prints ASCII image for each order
    fhM=fopen('menu.txt');%opens menu
    line=fgetl(fhM);%gets first line
    while ~strcmp(line,['_', ingr])%searches for the ingredient we want
        line=fgetl(fhM);
    end
    layer=fgetl(fhM);%gets the image for the ingr we want
    first=layer(1);%First letter of the current layer
    while ~strcmp(first,'_')&& ischar(layer)%Prints multi-layer ingredients
        fprintf(fhOrder,'%s\n',layer);
        layer=fgetl(fhM);
        first=layer(1);
    end
    fclose(fhM);%closes menu to start at the beginning with the next ingr
    [ingr,rem]=strtok(rem,',');
end

%Deals with adding the bottom bun
top=strtok(list,',');
if strcmp(top,'bun')
    fhM=fopen('menu.txt');
    layer=fgetl(fhM);
    layer=fgetl(fhM);
    first=layer(1);
    while ~strcmp(first,'_')%Prints multi-layer ingredients
        fprintf(fhOrder,'%s\n',layer);
        layer=fgetl(fhM);
        first=layer(1);
    end
    fclose(fhM);
end

%finds total price based on ingr ordered
total=0;
[ingr,rem]=strtok(list,',');
while ~isempty(ingr)%Finds price for each order
    fhP=fopen('prices.txt');
    line=fgetl(fhP);
    [temp,price]=strtok(line,':');
    while ~strcmp(temp,ingr)%Searches for ingr we want
        line=fgetl(fhP);
        [temp,price]=strtok(line,':');
    end
    total=total+str2double(price(4:end));%Increases the price 
    fclose(fhP);
    [ingr,rem]=strtok(rem,',');
end

fprintf(fhOrder,'Price: $%0.2f',total);

end