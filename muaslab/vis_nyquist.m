clc; close all; clear
s  =tf('s');
%Note: Algorithm may provide wrong result in case of non-proper systems (e.g. s)

%% Chose your System:
% Set "Simulation" time step size
st = 0.03; % seconds (larger than 3/100 recommended)

% Slide 12  - stable PT4 with 2 different P-controller
G = 2/(s+1)^4;
% G = 20/(s+1)^4;

% Slide 13 -  IT2 with 2 different P controller
% G = 1/s/(s+1)^2;
% G = 5/s/(s+1)^2;

% Slide 14 - unstable PDT2 with 2 different P controllers
%G = .25*(s+1)/(s^2 -0.4*s + 1);
%G = .5*(s+1)/(s^2 -0.4*s + 1);

% Slide 15 - stable PDT4 with 2 different RHP-zeros
% G = (-s+1)/(s+1)^4;
% G = (-3*s+1)/(s+1)^4;

% A300 from Lab 3/4 (stable PDT2) with P controller - PASSIVE System!
% G = (3.6*s+2.52)/(s^2+1.8*s+3.27);
% R = 0.3;
% R = 4*(0.33*s+1)/s;
% G=G*R;

%Car from Lab 5/6 (I2T2) with P and PD controller
% R = 0.0128*(s+1);
%R = 0.0128;
% G = 4/s^2 *(0.05*s + 1)/(s^2+2*0.6*5*s+16);
% G = R*G;

% I3- System
%G = 1/(s^3);

% Random
% G = 1*tf(rss(8,1,1))                % PDnTn System
% G = s/(0.01*s+1)*tf(rss(8,1,1))    % gloabally differentiating 
% G = 1/s*tf(rss(4,1,1));            % globally integrating 
%G = 1.1*(s+2)/(s*(s-1))*(s^2/0.1+.1*s+1)/(s^2/0.1+1*s+1)

%% 
[~,~,w] = nyquist(G);

if w(1)>1e-5
   w = [1e-5; w]; 
end

nfull = length(find(real(pole(G))>0));
nhalf = length(find(real(pole(G))==0));

requR = nfull*180 + nhalf*90;

[mag,pha] = bode(G,w); mag = squeeze(mag); pha = squeeze(pha); 
H = freqresp(G,w); H = squeeze(H);

reH = real(H);
reC = real(H)+1;   % coordinate shift to CP
imH = imag(H);

phaS = unwrap(angle(reC + imH*j))*180/pi;

figure; 
plot(reH,imH,'Linewidth',2)
grid on; hold on; box on
axis equal 
h = gca;
XL = h.XLim;

if nhalf == 0
    h.XLim(1) = min(h.XLim(1),-1); h.XLim(2) = max(h.XLim(2),1);
    h.YLim(1) = min(h.YLim(1),-1); h.YLim(2) = max(h.YLim(2),1);
else
    mi_reH = min(reH); ma_reH = max(reH);
    mi_imH = min(imH); ma_imH = max(imH);
    dlim = sort(1+[abs(mi_reH),abs(ma_reH),abs(mi_imH),abs(ma_imH)]);
    h.XLim = [-dlim(3),dlim(3)];
    h.YLim= [-dlim(3),dlim(3)];
    % or
%     fact = .5;
%     h.XLim = [-1,1]*fact;
%     h.YLim= [-1,1]*fact;
end

h = gca;
XL = h.XLim; DXL = XL(2)-XL(1); YL = h.YLim; DYL = YL(2)-YL(1);

plot(XL,[0 0],'Linewidth',1,'Color',0.5*ones(1,3))
plot([0 0],YL,'Linewidth',1,'Color',0.5*ones(1,3))
plot([-1 -1],[-0.02*DYL 0.02*DYL],'r','Linewidth',2)
plot([-0.02*DXL-1 0.02*DXL-1],[0 0],'r','Linewidth',2)
T = text(XL(1)+DXL/2,0.5*YL(2),['Requ. Rot.: ',num2str(requR),'°']);
children = get(gca, 'children');
children(1).Color = [1 0 1];
children(1).BackgroundColor = 0.9*[1 1 1];


rot_ang = 0;
for i =1:length(w)

    plot([-1,reH(i)],[0,imH(i)],'m:','Linewidth',1.5)
    if i>1
         rot_ang(i) = rot_ang(i-1) + phaS(i)- phaS(i-1);
         txt = ['Rotation: ' num2str(round(rot_ang(i))),'°'];
        T = text(XL(1)+DXL/2,0.8*YL(2),txt);
        children = get(gca, 'children');
        children(1).BackgroundColor = 0.9*[1 1 1];
    else
        T = text(XL(1)+DXL/2,0.8*YL(2),'Rotation: 0°');
        children = get(gca, 'children');
        children(1).BackgroundColor = 0.9*[1 1 1];
    end
    pause(st) 

children = get(gca, 'children');
delete(children(1));delete(children(2));    

    if mag(i)<10^-6 && i>length(w)/2 || length(w) == i
       if abs(rot_ang(end) - requR) > 20

                txt = ['Rotation: ' num2str(round(rot_ang(i))),'° - CL UNSTABLE'];
                T = text(XL(1)+DXL/2,0.8*YL(2),txt);
                children = get(gca, 'children');
                children(1).Color = [.8 0 0];
                children(1).BackgroundColor = 0.9*[1 1 1];
            else
                txt = ['Rotation: ' num2str(round(rot_ang(i))),'° - CL STABLE'];
                T = text(XL(1)+DXL/2,0.8*YL(2),txt);
                children = get(gca, 'children');
                children(1).Color = [0 .6 0];
                children(1).BackgroundColor = 0.9*[1 1 1];
       end
    break
    end
  
end
if nhalf ~= 0
   figure(2)
   nyquist(G)
end
%  figure
%  plot(w(1:i),rot_ang(1:i),'Linewidth',2); grid on; set(gca, 'XScale', 'log')
% 
    