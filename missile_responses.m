% parte 1, trab cdsd

close all
clc
clear
w = 1.109982
T = 8.1053
z = 4.8715

t = 0:0.01:10

s=tf('s');

num = [w^2*T w^2] 
den = [1 2*z*w w^2]

gs = tf(num, den)

pi = 3.14

%u1=1*sin(t);
%u2=0.3*sin(t);
%u3=0.7*sin(t);

u1=1*sin(t);
u2=1*sin(t-pi/2);
u3=1*sin(t-pi);

[A, B, C, D]=tf2ss(num, den)

sys = ss(A,B,C,D);

[y1, t1] = lsim(sys, u1, t, [0 0]);
[y2, t2] = lsim(sys, u2, t, [0 0]);
[y3, t3] = lsim(sys, u3, t, [0 0]);

plot(t1,y1,t2,y2,t3,y3);

%legend("sin(t)","0.3sin(t)","0.7sin(t)")
%title("Senos Diferentes Amplitudes")
legend("sin(t)","sin(t-pi/2)","sin(t-pi)")
title("Senos Diferentes Atrasados")
ylabel('Amplitude') 
xlabel('Time (seconds)') 