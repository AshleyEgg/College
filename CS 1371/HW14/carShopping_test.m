clear
clc

%Runs test cases for carShopping

cars1 = carShopping('carstats1.xlsx','Fuel Tank','Horsepower');
% 	cars1 =>  
%   Columns 1 through 5                                                        
%     'Make'        'Model'             'Year'    'Engine Size'    'Horsepower'
%     'Cadillac'    'Escalade'          [2016]    [        6.2]    [       420]
%     'Jeep'        'Grand Cherokee'    [2012]    [        6.4]    [       470]
%     'Lexus'       'LS 600h'           [2012]    [          5]    [       389]
%   Columns 6 through 7                                                        
%     'Fuel Tank'    'RAC Rating'                                              
%     [       26]    [      52.9]                                              
%     [     24.6]    [      53.5]                                              
%     [     22.2]    [      43.8]                                              
% 
 cars2 = carShopping('carstats2.xlsx','Engine Size','Year');
% 	cars2 =>  
%   Columns 1 through 6                                                       
%     'Make'      'Model'     'Year'    'Engine Size'    'Horsepower'    'MPG'
%     'Subaru'    'Legacy'    [2013]    [        3.6]    [       256]    [ 25]
%     'Acura'     'RDX'       [2017]    [        3.5]    [       279]    [ 29]
%     'Nissan'    'Maxima'    [2016]    [        3.5]    [       300]    [ 30]
%   Columns 7 through 8                                                       
%     'Fuel Tank'    'RAC Rating'                                             
%     [     18.5]    [      31.5]                                             
%     [       16]    [      29.5]                                             
%     [       18]    [      33.9]                                             
% 
cars3 = carShopping('carstats3.xlsx','MPG','RAC Rating');
% 	cars3 =>  
%   Columns 1 through 5                                              
%     'Make'      'Model'     'Year'    'Engine Size'    'RAC Rating'
%     'Ford'      'Focus'     [2016]    [          1]    [       9.6]
%     'Nissan'    'Sentra'    [2016]    [        1.8]    [      15.8]
%     'Subaru'    'Legacy'    [2016]    [        2.5]    [      21.9]
%   Columns 6 through 8                                              
%     'Fuel Tank'    'MPG'    'Horsepower'                           
%     [     12.4]    [ 42]    [       123]                           
%     [     13.2]    [ 38]    [       130]                           
%     [     18.5]    [ 36]    [       175]  


cars1s = carShopping_soln('carstats1.xlsx','Fuel Tank','Horsepower');
cars2s = carShopping_soln('carstats2.xlsx','Engine Size','Year');
cars3s = carShopping_soln('carstats3.xlsx','MPG','RAC Rating');

t1=isequal(cars1,cars1s);
t2=isequal(cars2,cars2s);
t3=isequal(cars3,cars3s);

if t1==t2 && t1==t3 && t1==1
    x=1
else
    x=0
end
 