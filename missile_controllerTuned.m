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

C = 0.05
mf = feedback(Gz, C);
step(mf)

C2 = pidtune(Gz, 'PID')
mf2 = feedback(C2*Gz, 1);
step(mf2)
legend("Kp=0.05", "Kp=0.0256 Ki=0.256 Kd=0.00064, Tuned")

