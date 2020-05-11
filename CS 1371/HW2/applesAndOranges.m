function [badA, badO]= applesAndOranges(numA,numO,goodA,goodO)
%Calculates the probability of picking bad fruit from the total bucket of
%fruit.
total=numA+numO;
numBA = numA-goodA;
numBO = numO-goodO;
badA = round((numBA./total).*100,2);
badO = round((numBO./total).*100,2);
end