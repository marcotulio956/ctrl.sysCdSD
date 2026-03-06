clear all
close all
clc

N = 20;
k = -N:N;
alpha = 0.8;
x = [zeros(1,N) alpha.^k(end-N:end)];
h = [zeros(1,N) ones(1,N+1)];

y = [];
figure
i = 1;
for n = -N:N
    subplot(4,2,1)
    stem(k,h,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel('h[k]')
    subplot(4,2,2)
    stem(k,x,'r','MarkerFaceColor','red'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel('x[k]')
  
    if n<0
        subplot(4,2,[3,4])
        stem(k,[x(end-abs(n):-1:1) zeros(1,abs(n))],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
        stem(k,h,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel(sprintf('h[k], x[%i-k]',n))
        hold off
        subplot(4,2,[5,6])
        stem(k,h.*[x(end-abs(n):-1:1) zeros(1,abs(n))],'k','MarkerFaceColor','black'), axis([-N N -1.5 1.5])
        xlabel('k'), ylabel(sprintf('h[k]x[%i-k]',n))
        subplot(4,2,[7,8])
        y = [y sum(h.*[x(end-abs(n):-1:1) zeros(1,abs(n))])];
        stem(k,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
        stem(k(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
        axis([-N N -1 1/(1-alpha)+1]), xlabel('n'), ylabel('y[n] = h[n]\ast x[n]')
    else
        subplot(4,2,[3,4])
        stem(k,[zeros(1,n) x(end:-1:1+n) ],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
        stem(k,h,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel(sprintf('h[k], x[%i-k]',n))
        hold off 
        subplot(4,2,[5,6])
        stem(k,h.*[zeros(1,n) x(end:-1:1+n)],'k','MarkerFaceColor','black'), axis([-N N -1.5 1.5])
        xlabel('k'), ylabel(sprintf('h[k]x[%i-k]',n))
        subplot(4,2,[7,8])
        y = [y sum(h.*[zeros(1,n) x(end:-1:1+n)])];
        stem(k,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
        stem(k(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
        axis([-N N -1 1/(1-alpha)+1]), xlabel('n'), ylabel('y[n] = h[n]\ast x[n]')
    end
    hold off
    pause
    i = i + 1;
end
