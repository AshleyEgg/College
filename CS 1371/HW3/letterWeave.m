function [final] = letterWeave (str1, str2, str3)
%Should take the first two strings and alternates the componets to make a
%new string
mixed=[str1;str2];%See teachersPet for details on how these two lines work
mixed=mixed(:)';
middle=fliplr(str3);%Flipps the third string
part1=mixed(1:1:(length(mixed)/2));%Next two lines cut the unscrambled letters in half
part2=mixed((length(mixed)/2)+1:1:end);
final=[part1,middle,part2];%Concatinates all the vectors togethter

end
