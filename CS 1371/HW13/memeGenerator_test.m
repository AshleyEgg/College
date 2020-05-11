clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for memeGenerator
load font.mat

memeGenerator('Swarm: He would yell', 'Me: TO HELL WITH GEORGIA', 'merylStreep.png', [20 200 20]);
% 		Output image(s) should be identical to that produced by solution file
% 
memeGenerator('Cash all 3 red routes at nave', 'How bout dat', 'cashMeOutside.png', [200 200 90]);
% 		Output image(s) should be identical to that produced by solution file
% 
memeGenerator('You can''t get test cases wrong', 'If you never check them', 'rollSafe.png', [200 100 1]);
% 		Output image(s) should be identical to that produced by solution file

memeGenerator_soln('Swarm: He would yell', 'Me: TO HELL WITH GEORGIA', 'merylStreep.png', [20 200 20]);
memeGenerator_soln('Cash all 3 red routes at nave', 'How bout dat', 'cashMeOutside.png', [200 200 90]);
memeGenerator_soln('You can''t get test cases wrong', 'If you never check them', 'rollSafe.png', [200 100 1]);

checkImage('merylStreep_meme.png','merylStreep_meme_soln.png')
checkImage('cashMeOutside_meme.png','cashMeOutside_meme_soln.png')
checkImage('rollSafe_meme.png','rollSafe_meme_soln.png')

