function [in]=runHomeworkCode(in)
name=[in.name,'.m'];%Gets the name of the function
fhOut=fopen(name,'w');%Opens a .m file with write acess

fprintf(fhOut,'function [out]= %s(in)\n',name(1:end-2));%puts the function header into the file
for i=1:length(in.lines)%Takes all the lines and prints them to the program
    fprintf(fhOut,'%s;\n',in.lines{i});
end
fprintf(fhOut,'end');%Puts the end at the end of the function

hold=[];
for j=1:length(in.inputs)%Takes the inputs evaluates them and saves the outputs
    temp=feval(in.name,in.inputs{j});
    hold=[hold,{temp}];
end
in.outputs=hold;

in=rmfield(in,'lines');%Removes the lines field
end