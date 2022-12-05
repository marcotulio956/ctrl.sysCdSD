% parte 3, trab cdsd
% TFP

close all
clc
clear
w = 0.9982
Tau = 8.1053
Tsampling = 10^(1)
zeta = 4.8715

t = 0:0.01:10

s=tf('s');

num = [w^2*Tau w^2];
den = [1, 2*zeta*w, w^2];

Gs = tf(num,den);

Gz = c2d(Gs,Tsampling)

subplot(1,4,1)
hold on;
impulse(Gz)
legend("T=10s, Ruim")

Tsampling = 100*10^(-3)
Gz = c2d(Gs,Tsampling)
subplot(1,4,2)
impulse(Gz)
legend("T=0.1s, Bom")

Tsampling = 1*10^(-3)
Gz = c2d(Gs,Tsampling)
subplot(1,4,3)
impulse(Gz)
legend("T=1ps, Otimo")

subplot(1,4,4)
impulse(Gs)
legend("G(s) Continuo")

sgtitle('Respota ao Impulso de G(z)')