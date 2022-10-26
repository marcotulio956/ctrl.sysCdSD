clear;
close all;

% Definição arbitrária das variáveis do sistema
m = 2;
k = 2;
c = 1;
T = 1.6;

% Espaço de estados contínuo
Ac = [0 1;-k/m -c/m];
Bc = [0;1/m];
Cc = [1 0];
Dc = [0];
ssc = ss(Ac,Bc,Cc,Dc);

% Espaço de estados discreto
Ad = [0 1;((T*c)/m)-((T*T*k)/m)-1 -2+((T*c)/m)];
Bd = [0;(T*T)/m];
Cd = [1 0];
Dd = [0];
ssd = ss(Ad,Bd,Cd,Dd);

% Degrau unitário
u=zeros(1,100);
u=[u, ones(1,1001)];
t=-1:0.01:10;
plot(t,u,'r'), axis([-1 10 -0.5 1.2])
title('Degrau unitário');
hold on;

% Plotagem da ondas ondas dos estados e da saída
% Contínuo
[yc,timec,xc]=lsim(ssc, u, t);
plot(timec,xc,'-c');
hold on;
plot(timec,yc,'-b');
hold on;
% Discreto
[yd,timed,xd]=lsim(ssd, u, t);
plot(timed,xd, '--m');
hold on;
plot(timed,yd, '--k');
hold on;
legend('Entrada', 'Estado 1 Contínuo', 'Estado 2 Contínuo', 'Saída Contínua', 'Estado 1 Discreto', 'Estado 2 Discreto', 'Saída Discreta');
figure;

% Rampa unitário
u=zeros(1,10000);
u=[u, 0:0.0001:10;];
t=-1:0.0001:10;
plot(t,u,'r'), axis([-1 10 -1 11])
title('Rampa unitário');
hold on;

% Plotagem da ondas ondas dos estados e da saída
% Contínuo
[yc,timec,xc]=lsim(ssc, u, t);
plot(t,xc,'-c');
hold on;
plot(t,yc,'-b');
hold on;
% Discreto
[yd,timed,xd]=lsim(ssd, u, t);
plot(t,xd, '--m');
hold on;
plot(t,yd, '--k');
hold on;
legend('Entrada', 'Estado 1 Contínuo', 'Estado 2 Contínuo', 'Saída Contínua', 'Estado 1 Discreto', 'Estado 2 Discreto', 'Saída Discreta');
figure;

% Seno
u=zeros(1,100);
u=[u, 0:0.01:20*pi];
u=sin(u);
t=-1:0.01:62.83;
plot(t,u,'r'), axis([-1 10 -1.2 1.2])
title('Senoide');
hold on;

% Plotagem da ondas ondas dos estados e da saída
% Contínuo
[yc,timec,xc]=lsim(ssc, u, t);
plot(t,xc,'-c');
hold on;
plot(t,yc,'-b');
hold on;
% Discreto
[yd,timed,xd]=lsim(ssd, u, t);
plot(t,xd, '--m');
hold on;
plot(t,yd, '--k');
hold on;
legend('Entrada', 'Estado 1 Contínuo', 'Estado 2 Contínuo', 'Saída Contínua', 'Estado 1 Discreto', 'Estado 2 Discreto', 'Saída Discreta');