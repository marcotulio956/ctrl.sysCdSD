% parte 4, trab cdsd
% controlador para erro de posicao menor que 5 porcento, sistema tipo 0(n.
% de polos integradores)
% a referencia eh o deg

close all
clear
clc

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

syms x
gz2 = (0.5193*x - 0.5129)/(x^2 - 1.372*x + 0.3781);
mf2 = (0.5193*x - 0.5129)/(x^2 - 0.8525*x - 0.134);
kerp = 0.98
mf2c = kerp*(0.5193*x - 0.5129)/(x^2 - kerp*0.8525*x - kerp*0.134)


ustep = x/(x-1);

gz2f = limit((x-1)*1/(1+gz2)*ustep,x,1)
mf2f = limit((x-1)*mf2*ustep,x,1)
mf2cerpf = limit((x-1)*mf2c*ustep,x,1)

mf = feedback(Gz, 1);

Kp1 = 2.6641;
Kp2 = 2.6642;
%C1 = tf([1],[1 0.2498])
%C1 = c2d(C1,Tsampling)
C1 = Kp1;
mfC1 = feedback(C1*Gz, 1);

C2 = Kp2;
mfC2 = feedback(C2*Gz, 1);

%C2 =  pidtune(mf,'P')
%mfC2 = feedback(C2*Gz, 1);

%C3 = pidtune(mf,'PID')
%mfC3 = feedback(C3*Gz, 1);


hold on
%step(Gz, mf)
%legend("Gz", "mf - No Controller")
step(mfC2, mfC1)
legend("Kp=2.6642","Kp=2.6641")
%step(Gz, mf, mfC1, mfC2, mfC3)
%legend("Gz", "mf - No Controller", "Kp=Var", "P", "PID")
