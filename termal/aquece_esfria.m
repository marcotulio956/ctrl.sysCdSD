
close all
clc
clear

current_folder = pwd;
vs = readtable ( strcat( current_folder,'/ALL0000_aquecimento12v_resfriamento5v/F0000CH1.CSV'))
%vs = readtable ( 'C:\Users\vitor\OneDrive\Desktop\lcdsd_trabson\ALL0000_aquecimento12v_resfriamento5v\F0000CH1.csv')

vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

vst = vst(1:end);
vsv = vsv(1:end);

vsv = 100*vsv;
vsv = vsv;
vst = vst + 50.5;

plot (vst, vsv);
hold on;
title('Aquecimento 12V e Resfriamento 5V');
xlabel('Tempo s');
ylabel('Temperatura Graus');

legend('Resistor')
