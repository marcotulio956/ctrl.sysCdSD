% parte 1, trab cdsd

close all
clc
clear
w = 1.109982
T = 8.1053
z = 4.8715

t = 0:0.01:10

s=tf('s');

gs = tf([w^2*T, w^2],[1, 2*z*w, w^2])

us=1

sys=gs*us

step(sys,t)

hold on 

us2=0.7

sys2=gs*us2

step(sys2,t)

hold on 

us3=0.3

sys3=gs*us3

step(sys3,t)

legend("1(t-1)","1(t-2)","1(t-3)")

title("Degraus Diferentes Atrasados")