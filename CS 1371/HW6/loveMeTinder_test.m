clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for loveMeTinder

[swipe1] = loveMeTinder([22,3], 'Harrison,21,16,UCLA,family picture,Cats are better than dogs');
% 	swipe1 => Swipe left on Harrison's picture
% 
[swipe2] = loveMeTinder([25,15], 'Samantha,20,7,Brandeis,no picture,"If you want something done, ask a woman"');
% 	swipe2 => Swipe right on Samantha's picture
% 
[swipe3] = loveMeTinder([30,2], 'Daniel,32,5,UAB,selfie,CS1371 is the best class ever');
% 	swipe3 => Swipe left on Daniel's picture
% 
[swipe4] = loveMeTinder([19,20], 'Adam,23,15,Georgia Tech,selfie,"Professional MATLAB"');
% 	swipe4 => Super Like Adam's picture

[swipe1s] = loveMeTinder_soln([22,3], 'Harrison,21,16,UCLA,family picture,Cats are better than dogs');
[swipe2s] = loveMeTinder_soln([25,15], 'Samantha,20,7,Brandeis,no picture,"If you want something done, ask a woman"');
[swipe3s] = loveMeTinder_soln([30,2], 'Daniel,32,5,UAB,selfie,CS1371 is the best class ever');
[swipe4s] = loveMeTinder_soln([19,20], 'Adam,23,15,Georgia Tech,selfie,"Professional MATLAB"');



t1=isequal(swipe1,swipe1s);
t2=isequal(swipe2,swipe2s);
t3=isequal(swipe3,swipe3s);
t4=isequal(swipe4,swipe4s);

if (isequal(t1,t2,t3,t4)&t1==1)
    x =1
else
    x=0
end
