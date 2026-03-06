clear all
close all
clc

L = 5;
T = 10;
dt = 0.01;
N = T/dt;
atraso = 4;
t = -T:dt:T;
x = [zeros(1,N) ones(1,L/dt) zeros(1,N-L/dt+1)];
h = [zeros(1,N+atraso/dt) 1/dt zeros(1,N-atraso/dt)];

y = [];
figure
i = 1;
for n = -N:N
    if mod(n,1/dt) == 0
        subplot(4,2,1)
        plot(t,x,'MarkerFaceColor','blue'), axis([-T T -2 2]), xlabel('\tau'), ylabel('x(\tau)')
        subplot(4,2,2)
        plot(t,h,'r','MarkerFaceColor','red'), axis([-T T -2 2]), xlabel('\tau'), ylabel('h(\tau)')
    end
    if n<0
        if mod(n,1/dt) == 0
            subplot(4,2,[3,4])
            plot(t,[h(end-abs(n):-1:1) zeros(1,abs(n))],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
            plot(t,x,'MarkerFaceColor','blue'), axis([-T T -2 2]), xlabel('\tau'), ylabel(['x(\tau), h(' sprintf('%2.0f',n*dt) '-\tau)'])
            hold off
            subplot(4,2,[5,6])
            plot(t,x.*[h(end-abs(n):-1:1) zeros(1,abs(n))],'k','MarkerFaceColor','black'), axis([-T T -2 2])
            xlabel('\tau'), ylabel(['x(\tau)h(' sprintf('%2.0f',n*dt) '-\tau)'])
            subplot(4,2,[7,8])
        end
        y = [y sum(x.*[h(end-abs(n):-1:1) zeros(1,abs(n))])*dt];
        if mod(n,1/dt) == 0
            plot(t,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
            plot(t(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
            axis([-T T -2 2]), xlabel('t'), ylabel('y(t) = x(t)\ast h(t)')
         end
    else
        if mod(n,1/dt) == 0
            subplot(4,2,[3,4])
            plot(t,[zeros(1,n) h(end:-1:1+n) ],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
            plot(t,x,'MarkerFaceColor','blue'), axis([-T T -2 2]), xlabel('\tau'), ylabel(['x(\tau), h(' sprintf('%2.0f',n*dt) '-\tau)'])
            hold off
            subplot(4,2,[5,6])
            plot(t,x.*[zeros(1,n) h(end:-1:1+n)],'k','MarkerFaceColor','black'), axis([-T T -2 2])
            xlabel('\tau'), ylabel(['x(\tau)h(' sprintf('%2.0f',n*dt) '-\tau)'])
            subplot(4,2,[7,8])
        end
        y = [y sum(x.*[zeros(1,n) h(end:-1:1+n)])*dt];
        if mod(n,1/dt) == 0
            plot(t,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
            plot(t(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
            axis([-T T -2 2]), xlabel('t'), ylabel('y(t) = x(t)\ast h(t)')
         end
    end
    if mod(n,1/dt) == 0
        hold off
        pause
    end
    i = i + 1;
end




