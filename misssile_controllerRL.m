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

C1 = 0.05
C5 = pidtune(Gz, 'PID')
mf5 = feedback(C5*Gz, 1);

rlocus(mf5)
legend("mf com PID")

%case1 = feedback(1.0263*C5*Gz,1);
%step(case1);
%legend("M1")