clear  all
close all
clc

N_1 = 2;
N = 9; % omega_0 = 2*pi/9;
n = -2*N:1:2*N;

valores_M = [0 1 2 3 4];
M = max(valores_M);
x = ones(size(n))*(2*N_1 + 1)/N;
stem(n,(1/2)*square(2*pi/9*n+pi/2)+1/2)
hold on
stem(n,x), title(sprintf('M=%i',0))
axis([-2*N 2*N -0.5 1.5]),% axis equal
pause

for k = 1:M
    x = x + (1/N)*(sin(2*pi*k*(N_1+1/2)/N)/(sin(pi*k/N)))*2*cos(k*(2*pi/N)*n);
    hold off
    if sum(valores_M == k)
    stem(n,(1/2)*square(2*pi/9*n+pi/2)+1/2)
    hold on
    stem(n,x), title(sprintf('M = %i',k))
    axis([-2*N 2*N -0.5 1.5]),% axis equal
    pause
    end
end

