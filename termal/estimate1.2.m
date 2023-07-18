
close all
clc
clear

current_folder = pwd;
vs = readtable ( strcat( current_folder,'/ALL0000_aquecimento12v_resfriamento5v/F0000CH1.CSV'))

vstraw = table2array(vs (:,4));
vsvraw = table2array(vs (:,5));


vst = vstraw(1267:2352);
vsv = vsvraw(1267:2352);


vsv = 100*vsv;
vst = vst - 253.2;


T = 1
s = tf('s')
tau = 16.2;
gain = 340;
g1s = gain*s/(tau*s+1)+32;
step(g1s, '-r')
hold on;

g1z = c2d(g1s,1);
step(g1z, '-g')
hold on

plot (vst, vsv);


title('Resfriamento 5V');
ylabel('Temperatura Graus');
xlabel('Tempo s');

legend('G(s)', 'G(z)', 'Resistor')