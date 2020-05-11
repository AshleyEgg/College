function [out]=fivePrime(randomVec)
%Finds all the prime numbers and numbers divisible by 5 and finds their
%average then searches the original vector for that average and replaces it
%with NaN
primesInd=isprime(randomVec);%Finds prime number indices
primes=randomVec(primesInd);%Finds prime numbers
div5Ind=mod(randomVec,5)==0&randomVec~=5;%Finds numbers divisible by 5 indices
div5=randomVec(div5Ind);%Finds numbers divisible by 5
num=length(primes)+length(div5);%Number of primes and nums divisible by 5
avg=round((sum(primes)+sum(div5))./num);%Calculates the average
avgInd=find(randomVec==avg);%Searches the original vector for the average
randomVec(avgInd)=NaN;%Sets the avg in the vector to NaN
out=randomVec;
end