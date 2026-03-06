clear all
close all
clc

T = 20;
dt = 0.1;
N = T/dt;
t = -T:dt:T;
alpha = exp(-0.2);
x = [zeros(1,N) alpha.^t(end-N:end)];
h = [zeros(1,N) ones(1,N+1)];

y = [];
figure
i = 1;
for n = -N:N
    if mod(n,1/dt) == 0
        subplot(4,2,1)
        plot(t,h,'MarkerFaceColor','blue'), axis([-T T -1.5 1.5]), xlabel('\tau'), ylabel('h(\tau)')
        subplot(4,2,2)
        plot(t,x,'r','MarkerFaceColor','red'), axis([-T T -1.5 1.5]), xlabel('\tau'), ylabel('x(\tau)')
    end
    if n<0
        if mod(n,1/dt) == 0
            subplot(4,2,[3,4])
            plot(t,[x(end-abs(n):-1:1) zeros(1,abs(n))],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
            plot(t,h,'MarkerFaceColor','blue'), axis([-T T -1.5 1.5]), xlabel('\tau'), ylabel(['h(\tau), x(' sprintf('%2.0f',n*dt) '-\tau)'])
            hold off
            subplot(4,2,[5,6])
            plot(t,h.*[x(end-abs(n):-1:1) zeros(1,abs(n))],'k','MarkerFaceColor','black'), axis([-T T -1.5 1.5])
            xlabel('\tau'), ylabel(['h(\tau)x(' sprintf('%2.0f',n*dt) '-\tau)'])
            subplot(4,2,[7,8])
        end
        y = [y sum(h.*[x(end-abs(n):-1:1) zeros(1,abs(n))])*dt];
        if mod(n,1/dt) == 0
            plot(t,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
            plot(t(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
            axis([-T T -1 1/(1-alpha)+1]), xlabel('t'), ylabel('y(t) = h(t)\ast x(t)')
        end
    else
        if mod(n,1/dt) == 0
            subplot(4,2,[3,4])
            plot(t,[zeros(1,n) x(end:-1:1+n) ],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
            plot(t,h,'MarkerFaceColor','blue'), axis([-T T -1.5 1.5]), xlabel('\tau'), ylabel(['h(\tau), x(' sprintf('%2.0f',n*dt) '-\tau)'])
            hold off
            subplot(4,2,[5,6])
            plot(t,h.*[zeros(1,n) x(end:-1:1+n)],'k','MarkerFaceColor','black'), axis([-T T -1.5 1.5])
            xlabel('t'), ylabel(['h(\tau)x(' sprintf('%2.0f',n*dt) '-\tau)'])
            subplot(4,2,[7,8])
        end
        
        y = [y sum(h.*[zeros(1,n) x(end:-1:1+n)])*dt];
        if mod(n,1/dt) == 0
            plot(t,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
            plot(t(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
            axis([-T T -1 1/(1-alpha)+1]), xlabel('t'), ylabel('y(t) = h(t)\astx(t)')
        end
    end
    if mod(n,1/dt) == 0
        hold off
        pause
    end
    i = i + 1;
end