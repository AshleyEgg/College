clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for asciiBurger

asciiBurger('me');
% 		Output text file(s) should be identical to that produced by the solution file
% 
asciiBurger('sally,lettuce,tomato,kale');
% 		Output text file(s) should be identical to that produced by the solution file
% 
asciiBurger('joe,bun,pickles,onions,pickles,burger');
% 		Output text file(s) should be identical to that produced by the solution file
% 
asciiBurger('bob,bun,tomato,lettuce,pickles,onions,bacon,cheese,burger,cheese,burger,cheese,burger');
% 		Output text file(s) should be identical to that produced by the solution file

asciiBurger_soln('me');
asciiBurger_soln('sally,lettuce,tomato,kale');
asciiBurger_soln('joe,bun,pickles,onions,pickles,burger');
asciiBurger_soln('bob,bun,tomato,lettuce,pickles,onions,bacon,cheese,burger,cheese,burger,cheese,burger');



%Use visdiff(filename,solnfilename) to comapre the files
visdiff('me_order.txt','me_order_soln.txt')
visdiff('sally_order.txt','sally_order_soln.txt')
visdiff('joe_order.txt','joe_order_soln.txt')
visdiff('bob_order.txt','bob_order_soln.txt')