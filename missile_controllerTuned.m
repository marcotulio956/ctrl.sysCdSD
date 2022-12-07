% parte 4, trab cdsd
% controlador para erro de posicao menor que 5 porcento, sistema tipo 0(n.
% de polos integradores)
% a referencia eh o degrau

close all
clc
clear

t = 0:0.01:10;

w = 0.9982;
Tau = 8.1053;
Tsampling = 10^(-1);
zeta = 4.8715;
s=tf('s');
num = [w^2*Tau w^2];
den = [1, 2*zeta*w, w^2];
Gs = tf(num,den);
Gz = c2d(Gs,Tsampling)

hold on

C1 = pidtune(Gz, 'P')
mf1 = feedback(C1*Gz, 1);
step(mf1)

C2 = pidtune(Gz, 'PI')
mf2 = feedback(C2*Gz, 1);
step(mf2)

C3 = pidtune(Gz, 'PD')
mf3 = feedback(C3*Gz, 1);
step(mf3)

C4 = pidtune(Gz, 'PID')
mf4 = feedback(C4*Gz, 1);
step(mf4)

legend("P","PI","PD","PID");%, "Kp=0.0256 Ki=0.256 Kd=0.00064, Tuned")

