clear  all
close all
clc

omega_0 = 2*pi/1000;
valores_N = [1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 20000 ...
    30000 40000]; 
N = max(valores_N);
dt = 0.1*(pi/(N*omega_0)); % satisfaz o teorema da amostragem
T = 2*pi/omega_0;
T_max = 5; %2.5*T;
t = -T_max:dt:T_max;

% x = ones(size(t))*2*T1/T;
% plot(t,(1/2)*square(2*pi*t+pi/2)+1/2)
% hold on
x = (1)*2*cos(0*omega_0*t);
plot(t,x), title(sprintf('N=%i',0)),
xlabel('t (s)'), ylabel('x(t)')
axis([-T_max T_max -0.2e3 70e3])%, axis equal
pause(1)

for k = 1:N
    x = x + (1)*2*cos(k*omega_0*t);
    if sum(valores_N == k)
        plot(t,x), title(sprintf('N = %i',k)),
        xlabel('t (s)'), ylabel('x(t)')
        axis([-T_max T_max -0.2e3 70e3])%, axis equal
        pause(1)
    end
end

