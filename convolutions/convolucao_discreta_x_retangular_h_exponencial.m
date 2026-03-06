clear all
close all
clc

N = 20;
k = -N:N;
L = 5;
alpha = 0.8;
x = [zeros(1,N) ones(1,L) zeros(1,N-L+1)];
h = [zeros(1,N) alpha.^k(end-N:end)];

y = [];
figure
i = 1;
for n = -N:N
    subplot(4,2,1)
    stem(k,x,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel('x[k]')
    subplot(4,2,2)
    stem(k,h,'r','MarkerFaceColor','red'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel('h[k]')
  
    if n<0
        subplot(4,2,[3,4])
        stem(k,[h(end-abs(n):-1:1) zeros(1,abs(n))],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
        stem(k,x,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel(sprintf('x[k], h[%i-k]',n))
        hold off
        subplot(4,2,[5,6])
        stem(k,x.*[h(end-abs(n):-1:1) zeros(1,abs(n))],'k','MarkerFaceColor','black'), axis([-N N -1.5 1.5])
        xlabel('k'), ylabel(sprintf('x[k]h[%i-k]',n))
        subplot(4,2,[7,8])
        y = [y sum(x.*[h(end-abs(n):-1:1) zeros(1,abs(n))])];
        stem(k,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
        stem(k(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
        axis([-N N -1 1/(1-alpha)+1]), xlabel('n'), ylabel('y[n] = x[n]\ast h[n]')
    else
        subplot(4,2,[3,4])
        stem(k,[zeros(1,n) h(end:-1:1+n) ],'r','MarkerFaceColor','red','MarkerSize',10), hold on,
        stem(k,x,'MarkerFaceColor','blue'), axis([-N N -1.5 1.5]), xlabel('k'), ylabel(sprintf('x[k], h[%i-k]',n))
        hold off 
        subplot(4,2,[5,6])
        stem(k,x.*[zeros(1,n) h(end:-1:1+n)],'k','MarkerFaceColor','black'), axis([-N N -1.5 1.5])
        xlabel('k'), ylabel(sprintf('x[k]h[%i-k]',n))
        subplot(4,2,[7,8])
        y = [y sum(x.*[zeros(1,n) h(end:-1:1+n)])];
        stem(k,[y NaN(1,2*N+1-i)],'m','MarkerFaceColor','magenta'), hold on,
        stem(k(i),y(end),'m','MarkerFaceColor','magenta','MarkerSize',10),
        axis([-N N -1 1/(1-alpha)+1]), xlabel('n'), ylabel('y[n] = x[n]\ast h[n]')
    end
    hold off
    pause
    i = i + 1;
end