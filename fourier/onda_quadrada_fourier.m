clear  all
close all
clc

omega_0 = 2*pi;
T1 = 1/4;
T = 2*pi/omega_0;
t = -T:0.0001:T;

valores_N = [1 3 5 7 9 11 21 31 41 51 61 71 81 91 101 201 301 401 501 601 701 801 901 1001 ...
    1101 1201 1301 1401 1501 1601 1701 1801 1901 2001];
N = max(valores_N);
x = ones(size(t))*2*T1/T;
plot(t,(1/2)*square(2*pi*t+pi/2)+1/2)
hold on
plot(t,x), title(sprintf('N=%i',0))
axis([0 1 -0.2 1.2]), axis equal
pause%(1)

for k = 1:N
    x = x + (sin(k*omega_0*T1)/(k*pi))*2*cos(k*omega_0*t);
    hold off
    if sum(valores_N == k)
    plot(t,(1/2)*square(2*pi*t+pi/2)+1/2)
    hold on
    plot(t,x), title(sprintf('N = %i',k))
    axis([0 1 -0.2 1.2]), axis equal
    pause%(1)
    end
end

