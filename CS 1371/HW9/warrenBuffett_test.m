clear
clc
%Program to run test cases in my files and solution files and compare the
%answers for warrenBuffett

 [invest1, sheet1] = warrenBuffett('stocks1.xlsx');
% 	invest1 => NVIDIA Corporation
% 	sheet1 =>  
%     'Symbol'    'Name'                               'Price'     'Change'    '% Change'
%     'NVDA'      'NVIDIA Corporation'                 [101.46]    [  0.97]    [    0.96]
%     'PFE'       'Pfizer Inc.'                        [ 34.26]    [   0.2]    [    0.58]
%     'VZ'        'Verizon Communications Inc.'        [  50.6]    [  0.29]    [    0.57]
%     'TSLA'      'Tesla, Inc.'                        [   257]    [  1.01]    [    0.39]
%     'X'         'United States Steel Corporation'    [ 37.01]    [  -0.3]    [   -0.81]
%     'XOM'       'Exxon Mobil Corporation'            [ 81.08]    [  -0.7]    [   -0.86]
% 
 [invest2, sheet2] = warrenBuffett('stocks2.xlsx');
% 	invest2 => PPL Corp.
% 	sheet2 => Value too large to display. Value should match that of the solution function.
% 
[invest3, sheet3] = warrenBuffett('stocks3.xlsx');
% 	invest3 => Rockwell Automation Inc.
% 	sheet3 =>  
%   Columns 1 through 4                                                                                 
%     'Symbol'    'Industry'                  'Location'                      'Name'                    
%     'ROK'       'Industrials'               'Milwaukee, Wisconsin'          'Rockwell Automation Inc.'
%     'JWN'       'Consumer Discretionary'    'Seattle, Washington'           'Nordstrom'               
%     'SPGI'      'Financials'                'New York, New York'            'S&P Global, Inc.'        
%     'ORCL'      'Information Technology'    'Redwood Shores, California'    'Oracle Corp.'            
%     'SWN'       'Energy'                    'Houston, Texas'                'Southwestern Energy'     
%     'PYPL'      'Information Technology'    'San Jose, California'          'PayPal'                  
%     'NRG'       'Utilities'                 'Princeton, New Jersey'         'NRG Energy'              
%   Columns 5 through 7                                                                                 
%     'Price'     'Change'    '% Change'                                                                
%     [ 56.02]    [  -0.3]    [   -0.54]                                                                
%     [ 17.99]    [ -0.12]    [   -0.67]                                                                
%     [232.59]    [ -2.22]    [   -0.95]                                                                
%     [  43.3]    [ -0.44]    [   -1.02]                                                                
%     [132.32]    [ -1.43]    [   -1.08]                                                                
%     [    32]    [  -0.5]    [   -1.56]                                                                
%     [ 92.12]    [ -5.28]    [   -5.73]                                                                
% 
[invest4, sheet4] = warrenBuffett('stocks4.xlsx');
% 	invest4 => Kantwon Rogers
% 	sheet4 =>  
%   Columns 1 through 5                                                                              
%     'Symbol'    'Price'     'Change'    'Name'                    'Industry'                       
%     'KLR'       [  1000]    [ 50000]    'Kantwon Rogers'          'Education'                      
%     'KLAC'      [ 12.29]    [  0.11]    'KLA-Tencor Corp.'        'Information Technology'         
%     'K'         [120.77]    [  0.18]    'Kellogg Co.'             'Consumer Staples'               
%     'KR'        [  39.1]    [  0.04]    'Kroger Co.'              'Consumer Staples'               
%     'KMB'       [ 86.86]    [  0.08]    'Kimberly-Clark'          'Consumer Staples'               
%     'KEY'       [145.62]    [  0.09]    'KeyCorp'                 'Financials'                     
%     'KSU'       [ 36.43]    [  0.02]    'Kansas City Southern'    'Industrials'                    
%     'KIM'       [ 42.11]    [  0.02]    'Kimco Realty'            'Real Estate'                    
%     'KSS'       [  58.6]    [ -0.05]    'Kohl's Corp.'            'Consumer Discretionary'         
%     'KMI'       [ 65.09]    [ -0.12]    'Kinder Morgan'           'Energy'                         
%     'KHC'       [ 22.22]    [ -0.24]    'Kraft Heinz Co'          'Consumer Staples'               
%   Columns 6 through 8                                                                              
%     'Sub-Industry'                                       'Location'                      '% Change'
%     'Public University'                                  'Atlanta, Georgia'              [    5000]
%     'Semiconductor Equipment'                            'Milpitas, California'          [     0.9]
%     'Packaged Foods & Meats'                             'Battle Creek, Michigan'        [    0.15]
%     'Food Retail'                                        'Cincinnati, Ohio'              [     0.1]
%     'Household Products'                                 'Irving, Texas'                 [    0.09]
%     'Banks'                                              'Cleveland, Ohio'               [    0.06]
%     'Railroads'                                          'Kansas City, Missouri'         [    0.05]
%     'REITs'                                              'New Hyde Park, New York'       [    0.05]
%     'General Merchandise Stores'                         'Menomonee Falls, Wisconsin'    [   -0.09]
%     'Oil & Gas Refining & Marketing & Transportation'    'Houston, Texas'                [   -0.18]
%     'Packaged Foods & Meats'                             'Pittsburgh, Pennsylvania'      [   -1.08]

[invest1s, sheet1s] = warrenBuffett_soln('stocks1.xlsx');
[invest2s, sheet2s] = warrenBuffett_soln('stocks2.xlsx');
[invest3s, sheet3s] = warrenBuffett_soln('stocks3.xlsx');
[invest4s, sheet4s] = warrenBuffett_soln('stocks4.xlsx');



t1=isequal(invest1,invest1s);
t2=isequal(invest2,invest2s);
t3=isequal(invest3,invest3s);
t4=isequal(invest4,invest4s);
t5=isequal(sheet1,sheet1s);
t6=isequal(sheet2,sheet2s);
t7=isequal(sheet3,sheet3s);
t8=isequal(sheet4,sheet4s);



if (isequal(t1,t2,t3,t4,t5,t6,t7,t8)&&t1==1)
    x =1
else
    x=0
end