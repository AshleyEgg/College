clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for teachersPet
[sort1] = teachersPet([75 84 72 71 87 91 54], 'OTEITLG', 'LGTTIEO');
% 	sort1 => LE TI TG OL ET IT GO
% 
[sort2] = teachersPet([66 70 64 89 65 99 100], 'ILCHBND', 'TDKOATO');
% 	sort2 => DO NT HO LD IT BA CK
% 
[sort3] = teachersPet([88 77 100], 'YRA', 'MEN');
% 	sort3 => AN YM RE

[sort1s] = teachersPet_soln([75 84 72 71 87 91 54], 'OTEITLG', 'LGTTIEO');
[sort2s] = teachersPet_soln([66 70 64 89 65 99 100], 'ILCHBND', 'TDKOATO');
[sort3s] = teachersPet_soln([88 77 100], 'YRA', 'MEN');


t1=isequal(sort1,sort1s);
t2=isequal(sort2,sort2s);
t3=isequal(sort3,sort3s);

if (isequal(t1,t2,t3)&t1==1)
    x =1
else
    x=0
end