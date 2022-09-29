t = 0:0.05:50;

%R=1
%L=1
%C=1

%wn=1/L*C
%xi=(R/2*L)*sqrt(L*C)
%k=1

subplot(2,2,1)
num= [k*wn^2]
den= [1 2*0*wn wn^2]
g= tf(num, den)
loop= feedback(g,1)
step(loop,t)
subtitle("Xi=0")
title('Não Amortecido')

subplot(2,2,2)
num= [k*wn^2]
den= [1 2*0.1*wn wn^2]
g= tf(num, den)
loop= feedback(g,1)
step(loop,t)
subtitle("Xi=0.1")
title('Subamortecido')

subplot(2,2,3)
num= [k*wn^2]
den= [1 2*1*wn wn^2]
g= tf(num, den)
loop= feedback(g,1)
step(loop,t)
subtitle("Xi=1")
title('Criticamente Amortecido')

subplot(2,2,4)
num= [k*wn^2]
den= [1 2*2*wn wn^2]
g= tf(num, den)
loop= feedback(g,1)
step(loop,t)
subtitle("Xi=2")
title('Sobamortecido')
