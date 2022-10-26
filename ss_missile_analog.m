% parte 2, trab cdsd
% ss continuo

close all
clc
clear
w = 0.9982
T = 8.1053
z = 4.8715

t = 0:0.01:10

s=tf('s');

num = [w^2*T w^2];
den = [1, 2*z*w, w^2];

gs = tf(num,den);

us=1; % step

sys=gs*us;

subplot(1,2,1)

step(sys,t)

hold on;

legend("sys G(s)")

[A, B, C, D] = tf2ss(num, den);
sys2 = ss(A,B,C,D)

subplot(1,2,2)

step(sys2,t)

legend("sys2 SS")