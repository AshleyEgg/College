function shakemax = towershake(f,method,output_logical)
%This function solves for the equation of motion
%
%Inputs:
%   f = forcing frequency
%   method = string to specify Euler or Heun or ODE45
%   output_logical = boolean to decide if plots and results will be displayed 
%
%Outputs:
%   shakemax = maximum value of the displacemnet at later times
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: CP3
%Date: 11/18/2018

%Define initial variables
tspan =[0,20];
y0 = [0,0]; 

if strcmpi(method,'ODE45')
    [T,Y]= ode45(@vibration,tspan,y0);  %Call ODE45
    h = [T;0]-[0;T];
    h = h(1:end-1);                 %Calculate step sizes used by ODE45
    tenPer = round(0.9*length(T));
    shakemax = max(Y(tenPer:end,1));    %Find the shakemax
elseif strcmpi(method,'Heun') || strcmpi(method,'Euler')
    dt = input('\n Please enter a time step \n');   %Request a timestep
    [T,Y]= my_ODE_solver(@vibration,tspan,y0,dt,method);   
    tenPer = round(0.9* length(T));
    shakemax = max(Y(tenPer:end,1));    %Find the shakemax
else 
    error('Please enter a valid method.(Euler, Heun or ODE45)\n');  
end

if nargin == 3 && strcmpi(output_logical,'true')    %if true display plots
    figure                  %Figure 1
    grid on
    Y2 = Y(:,1);
    plot(T,Y2)
    title('Displacment vs Time')
    xlabel('Time [s]')
    ylabel('Displacement [m]')
    hold off
    if strcmpi(method,'ODE45')
        figure                  %Figure 2
        grid on
        plot(1:length(T),h)
        title('Step Size vs Step Number')
        xlabel('Step Number')
        ylabel('Step Size')
        hold off
        fprintf('The largest step size used by ODE45 was %f\n',max(h))
    end
end

function dudt = vibration(t,u)      %Nested vibration function
    m = 9*10^3;                     %Mass [kg]
    k = 1.05 * 10^6;                %Effective stiffness of the tower N/m
    c =9 * 10^3;                    %Structural damping in system N*s/m
    A = 3 * 10^4;                   %Force amplitude N
    
    %System of First order ODEs
    dudt = zeros(2,1);
    dudt(1) = u(2);
    dudt(2) = (A*sin(2*pi*f*t)-c*u(2)-k*u(1))/m;
    
end
end