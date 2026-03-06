clear  all
close all
clc

omega_0 = 2*pi;
T = 2*pi/omega_0;
T_max = 2.5*T;
t = -T_max:0.00005:T_max;

valores_N = [1:30 1000 2000 3000 4000 5000]; 
N = max(valores_N);
% x = ones(size(t))*2*T1/T;
% plot(t,(1/2)*square(2*pi*t+pi/2)+1/2)
% hold on
x = (1/T)*2*cos(0*omega_0*t);
plot(t,x), title(sprintf('N=%i',0))
axis([-T_max T_max -0.2 70])%, axis equal
pause%(1)

for k = 1:N
    x = x + (1/T)*2*cos(k*omega_0*t);
    if sum(valores_N == k)
        plot(t,x), title(sprintf('N = %i',k))
        axis([-T_max T_max -0.2 70])%, axis equal
        pause%(1)
    end
end

