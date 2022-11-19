% parte 2, trab cdsd
close all
clc
clear

w = 0.9982;
Tau_alpha = 8.1053;
Tsampling = Tau_alpha/10;
z = 4.8715;
sin_freq = 2;

dK = 0.05;
ksimtime = 10;
k = 0:dK:ksimtime;

dT = 0.01;
tsimtime = 10;
t = 0:dT:tsimtime;

s=tf('s');
num = [w^2*Tau_alpha w^2];
den = [1, 2*z*w, w^2];

uk_impulse = [ones(2,1) zeros(2, length(k)-1)];
stepAmplitude = 1;
uk_step = stepAmplitude .* ones(2,length(k));
uk_ramp = repmat(linspace(0,stepAmplitude*10,length(k)), 2, 1);
uk_sin = repmat(stepAmplitude + stepAmplitude * sin(k*sin_freq),2,1);

ut_impulse = [ones(1,1) zeros(1, length(t)-1)];
ut_step = stepAmplitude .* ones(1,length(t));
ut_ramp = linspace(0,stepAmplitude*10,length(t));
ut_sin = stepAmplitude + stepAmplitude * sin(t*sin_freq);

us_impulse = 1;
us_step=1/s;
us_ramp=1/s^2;
us_sin=stepAmplitude*sin_freq/(s^2+sin_freq^2);%sinusoidal

a1=2*z*w; a2=w^2; b1=w^2*Tau_alpha; b2=w^2;

% SS k
Ak = [0 1; (-1-Tsampling*a1-Tsampling^2*a2) (2-Tsampling*a1)];
[P,D]=eig(Ak);
Ak=P*D*P^(-1);
Bk = [0 0; (Tsampling^2*b2-Tsampling*b1) (Tsampling*b1)];
Ck = [1 0; 0 0];
Dk = zeros(2);
sysSSk = ss(Ak,Bk,Ck,Dk);
[ySSk, kSSk] = lsim(sysSSk, uk_sin, k);
subplot(1,2,1)
stem(kSSk,ySSk(:,1),'LineWidth',0.1)
hold on;

% SS s
[As, Bs, Cs, Ds] = tf2ss(num, den);
sysSSs = ss(As,stepAmplitude.*Bs,Cs,Ds);
[ySSs, kSSs] = lsim(sysSSs, ut_sin, t);
%subplot(1,2,2);
plot(kSSs,ySSs)
plot(t,ut_sin)
legend("sys SS k","sys1 SS s","u(t)")
title("Espaço de Estados")

% G(s)
sysGs = tf(num,den);
[y1, t1] = lsim(sysGs, ut_sin, t);
subplot(1,2,2)
plot(t1,y1,t1,ut_sin)
title("Função de Transferência")

ylabel("Gain")
xlabel("Time (seconds)")

legend("sys2 G(s)", "u(t)");

sgtitle('Resposta ao Degrau')

