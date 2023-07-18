function nn_bode(trfn,am,ph)


cols = [0 0 0];

if ~exist('am','var')
  f=gcf;
  am=f.Children(2);
end
if ~exist('ph','var')
  f=gcf;
  ph=f.Children(1);
end

[a,p,w]=bode(trfn);
a = squeeze(a(1,1,:));
p = squeeze(p(1,1,:));
plot(am,w,20*log10(a),'Linewidth',3,'Color', 'magenta');
plot(ph,w,p,'Linewidth',3, 'Color', 'magenta');
