function [kid wasted]= candy(numCandy, numKid)
%Based on ammount of candy and kids determines how many pieces each kid
%recieves and how much is left over.
kid=floor(numCandy/numKid);
wasted= mod(numCandy,numKid);
end