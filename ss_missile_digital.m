% parte 2, trab cdsd
% ss discreto

close all
clc
clear
w = 0.9982
Tau_alpha = 8.1053
Tsampling = 6*10^(1)
z = 4.8715

k = 0:0.05:3 % one by one

% u = [one(2,1) zeros(2, length(k)-1)] % impulse
stepAmplitude = 1
u = stepAmplitude .* ones(2,length(k)) % step

a1=2*z*w; a2=w^2; b1=w^2*Tau_alpha; b2=w^2;

A = [0 1; (-1-Tsampling*a1-Tsampling^2*a2) (2-Tsampling*a1)];
B = [0 0; (Tsampling^2*b2-Tsampling*b1) (Tsampling*b1)];
C = [1 0; 0 0];
D = zeros(2);

sys = ss(A,B,C,D)

[y, k1] = lsim(sys, u, k)

%subplot(1,2,1)

stem(k1,y(:,1))

hold on;

t = 0:0.01:3

s=tf('s');

num = [w^2*Tau_alpha w^2];
den = [1, 2*z*w, w^2];

gs = tf(num,den);

us=1; % step
u1 = stepAmplitude .* ones(1,length(t)) % step

sys2=gs*us;

%subplot(1,2,2)

[y1, t1] = lsim(sys2, u1, t)

plot(t1,y1)

ylabel("Gain")
xlabel("Time (seconds)")

legend("sys SS k","sys2 G(s)")

