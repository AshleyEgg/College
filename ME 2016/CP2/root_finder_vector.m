function X = root_finder_vector(f,x0,V)
%This function is a generic function to solve the root finding problem of
%type f(x)-V =0
%
%Inputs:
%   f = a function handle
%   x0 = either a scalar or a vector of initial guesses
%   V = a vector
%
%Outputs:
%   X = a vector containing the roots 
%
%Author: Ashley Eggart
%Section: ME 2016 - A
%Assignment: CP2
%Date: 10/25/2018


X = zeros(1,length(V));             %Initilize empty array of correct size
for i = 1:length(V)                 
    const = @(x) V(i);              %Make V and function handle
    fun = @(x) f(x) - const(x);     %Make the actual func to root find
    if isscalar(x0)                 %if x0 is a scalar
        x = fzero(fun,x0);
    else                            %if x0 is a vector
        x = fzero(fun,x0(i));
    end
    X(i)= x;
end
X = X';                             %Invert from row array to col array
end