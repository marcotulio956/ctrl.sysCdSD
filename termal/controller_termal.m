
close all
clc
clear

current_folder = pwd;
%vs = readtable ( strcat( current_folder,'/termal/ALL0004_resfriamento1/F0004CH1.CSV' ) )
%vs = readtable ( strcat( current_folder,'/termal/ALL0003_resfriamento2/F0003CH1.CSV' ) )
vs = readtable ( strcat( current_folder,'/termal/ALL0001_resfriamento3/F0001CH1.CSV' ) )


vst = table2array(vs (:,4));
vsv = table2array(vs (:,5));

rslice = 1126
%vsv=vsv(1:rslice); vst=vst(1:rslice);

figure;
plot (vst, vsv);
hold on;
title('Grafico vs x tempo');
xlabel('Tempo[s]');
ylabel('Tensao[V]');
   
v0 = vsv(1); vn = vsv(end); 

maxv = 0
for i=1:length(vsv)
    if vsv(i) >= maxv
        maxv = vsv(i);
    end
end

minv = 10
for i=1:length(vsv)
    if vsv(i) <= minv & vsv(i) > 0.25
        minv = vsv(i);
    end
end


dv =  v0 - vn;

% zsixtythree = dv * 0.63;
zthirdysev = dv * 0.37;

% search vsv row corresponding with zsixtythree

tau = vst(333) - vst(295)



