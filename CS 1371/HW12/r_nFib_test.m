clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for r_nFib

[seq1] = r_nFib(4, 10);
% 	seq1 =>      4     4     8    12    20    32    52    84   136   220
% 
[seq2] = r_nFib(0, 6);
% 	seq2 =>      0     1     1     2     3     5
% 
[seq3] = r_nFib(400, 1);
% 	seq3 =>    400

[seq1s] = r_nFib_soln(4, 10);
[seq2s] = r_nFib_soln(0, 6);
[seq3s] = r_nFib_soln(400, 1);



t1=isequal(seq1,seq1s);
t2=isequal(seq2,seq2s);
t3=isequal(seq3,seq3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end