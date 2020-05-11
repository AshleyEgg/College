function [dvdt]=para(v)
%This function defines the specific details of the parachutist problem
%including gravity, mass and the drag coefficient and calculates the
%velocity of a falling parachutist as a function of time.
%
%Inputs:
%   v = velocity of the parachutist
%
%Outputs:
%   dvdt = velocity of the parachutist as a function of time
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: HW0
%Date: 8/25/2018

g = 9.81; %Gravity
m = 68.1; %Mass
c = 12.5; %Drag Coefficient 

dvdt=g-c/m*v;
end