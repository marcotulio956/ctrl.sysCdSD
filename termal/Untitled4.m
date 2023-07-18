
close all
clc
clear

current_folder = pwd;
%vs = readtable ( strcat( current_folder,'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.CSV'))
vs = readtable ( 'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.csv')

vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

vst = vst(103:1216);
vsv = vsv(103:1216);
close all
clc
clear

current_folder = pwd;
%vs = readtable ( strcat( current_folder,'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.CSV'))
vs = readtable ( 'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.csv')

vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

vst = vst(1266:2352);
vsv = vsv(1266:2352);

vsv = 100*vsv;
vsv = vsv;
vst = vst - 253.2;

plot (vst, vsv);
hold on;
title('Aquecimento 12V e Resfriamento 5V');
xlabel('Tempo s');
ylabel('Tensao Vs');

u = 55
s = tf('s')
tau = 77.4
g0 = 48/(tau*s+1);
ma = u * g0;
step(g0, '-r')
hold on