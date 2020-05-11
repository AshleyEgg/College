function [arrN]=arrReplace(arr1,arr2,num)
%Replaces the components of the one array with the componets of another
%where there is certain number in the first array
mask1=arr1==num;%Makes a mask of where the array equals the num
arr1(mask1)=arr2(mask1);%Replaces num in arr1 with arr2 value
arrN=arr1;%Outputs the final array
end