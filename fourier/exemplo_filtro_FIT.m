clear all
close all
clc

n = 1:1:30;
x = cos(pi/8*n);
for j = 2:(length(n)-1)
   y(j) = 1/3*(x(j-1) + x(j) + x(j+1)); 
   
end

stem(n,x)
hold on
stem(y,'r')
