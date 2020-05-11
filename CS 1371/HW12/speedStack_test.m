clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for speedStack

[stack1] = speedStack(3, '1');
% 	stack1 =>  
%   1  
%  1 1 
% 1 1 1
% 
[stack2] = speedStack(10, 'O');
% 	stack2 =>  
%          O         
%         O O        
%        O O O       
%       O O O O      
%      O O O O O     
%     O O O O O O    
%    O O O O O O O   
%   O O O O O O O O  
%  O O O O O O O O O 
% O O O O O O O O O O
% 
[stack3] = speedStack(30, '#');
% 	stack3 =>  
%                              #                             
%                             # #                            
%                            # # #                           
%                           # # # #                          
%                          # # # # #                         
%                         # # # # # #                        
%                        # # # # # # #                       
%                       # # # # # # # #                      
%                      # # # # # # # # #                     
%                     # # # # # # # # # #                    
%                    # # # # # # # # # # #                   
%                   # # # # # # # # # # # #                  
%                  # # # # # # # # # # # # #                 
%                 # # # # # # # # # # # # # #                
%                # # # # # # # # # # # # # # #               
%               # # # # # # # # # # # # # # # #              
%              # # # # # # # # # # # # # # # # #             
%             # # # # # # # # # # # # # # # # # #            
%            # # # # # # # # # # # # # # # # # # #           
%           # # # # # # # # # # # # # # # # # # # #          
%          # # # # # # # # # # # # # # # # # # # # #         
%         # # # # # # # # # # # # # # # # # # # # # #        
%        # # # # # # # # # # # # # # # # # # # # # # #       
%       # # # # # # # # # # # # # # # # # # # # # # # #      
%      # # # # # # # # # # # # # # # # # # # # # # # # #     
%     # # # # # # # # # # # # # # # # # # # # # # # # # #    
%    # # # # # # # # # # # # # # # # # # # # # # # # # # #   
%   # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
%  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
% # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
%

[stack1s] = speedStack_soln(3, '1');
[stack2s] = speedStack_soln(10, 'O');
[stack3s] = speedStack_soln(30, '#');




t1=isequal(stack1,stack1s);
t2=isequal(stack2,stack2s);
t3=isequal(stack3,stack3s);


if (isequal(t1,t2,t3)&&t1==1)
    x =1
else
    x=0
end