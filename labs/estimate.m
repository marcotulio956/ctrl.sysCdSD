% cei, pratica 6

close all
clc
clear

current_folder = pwd;
vs = readtable ( strcat( current_folder,'/ALL0003/F0003CH2.CSV.xlsx' ) )

vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

slice = [295 333]


figure;
plot (vst, vsv);
hold on;
title('Grafico vs x tempo');
xlabel('Tempo');
ylabel('Tensao');

v0 = vsv(1); vn = vsv(end);  

dv =  v0 - vn;

% zsixtythree = dv * 0.63;
zthirtysev = dv * 0.37;

% search vsv row corresponding with zsixtythree

tau = vst(333) - vst(295)



