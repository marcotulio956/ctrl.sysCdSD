
close all
clc
clear

current_folder = pwd;
vs = readtable ( strcat( current_folder,'/ALL0000_aquecimento12v_resfriamento5v/F0000CH1.CSV'))
%vs = readtable ( 'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.csv')

vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

vst = vst(104:1216);
vsv = vsv(104:1216);

vsv = 100*vsv;
vsv = vsv;
vst = vst + 50.5;

s = tf('s')
tau = 77.4
gain = 55
g1s = gain/(tau*s+1);
step(g1s, '-r')
hold on

T=1
g1z = c2d(g1s,T);
step(g1z, '-g')
hold on

z = tf('z')
kp = 1
d = kp
gfz = gain*(1-exp(-T/tau))/(z-exp(-T/tau))
mf = feedback(d*gfz, 1)
step(mf)

plot (vst, vsv);
hold on;
title('Aquecimento 12V e Sem Ventoinha');
xlabel('Tempo s');
ylabel('Temperatura Graus');

legend('G(s)', 'G(z)', 'Gf(z)', 'Resistor')
