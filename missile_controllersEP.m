% parte 4, trab cdsd
% controlador para erro de posicao menor que 5 porcento, sistema tipo 0(n.
% de polos integradores)
% a referencia eh o 

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

Kp = 0.05;
C = Kp;
mf = feedback(Gz, C);
step(mf)
legend("Kp=0.05")

syms z
fz = (0.5193*z - 0.5129)/(z^2 - 1.372*z + 0.3781)
fmf = (0.5193*z - 0.5129)/(z^2 - 1.346*z + 0.3525)
limit(fz,z,1)
limit(fmf,z,1)

p = poles(fmf, z)

p1norm = norm(p(1))
p2norm = norm(p(2))
