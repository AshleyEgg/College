clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for tankTrials

tankTrials('existingVehicles.txt', 'testVehicles1.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
tankTrials('existingVehicles.txt', 'testVehicles2.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
tankTrials('existingVehicles.txt', 'testVehicles3.txt');
% 		Output text file(s) should be identical to that produced by the solution file
% 
tankTrials('existingVehicles.txt', 'testVehicles4.txt');
% 		Output text file(s) should be identical to that produced by the solution file

tankTrials_soln('existingVehicles.txt', 'testVehicles1.txt');
tankTrials_soln('existingVehicles.txt', 'testVehicles2.txt');
tankTrials_soln('existingVehicles.txt', 'testVehicles3.txt');
tankTrials_soln('existingVehicles.txt', 'testVehicles4.txt');


%Use visdiff(filename,solnfilename) to comapre the files
visdiff('testVehicles1_results.txt','testVehicles1_results_soln.txt')
visdiff('testVehicles2_results.txt','testVehicles2_results_soln.txt')
visdiff('testVehicles3_results.txt','testVehicles3_results_soln.txt')
visdiff('testVehicles4_results.txt','testVehicles4_results_soln.txt')