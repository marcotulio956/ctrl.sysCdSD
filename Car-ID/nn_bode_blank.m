function [am,ph]=nn_bode_blank(wlim, alim, plim,astep,pstep)

f=figure();
am = axes('Position',[0.16 0.55 0.75 0.43]);hold on;
ph = axes('Position',[0.16 0.1 0.75 0.43]);hold on;
tx = axes('Position',[0 0 1 1],'Visible','off');uistack(tx,'bottom');
% f.Units = 'centimeters';
% f.Position = [20 10 13 15];
f.Units = 'normalized';
f.Position = [0 0 0.5 1];

am.XLim=10.^wlim;
ph.XLim=10.^wlim;
am.XTick=10.^[wlim(1):wlim(2)];
ph.XTick=10.^[wlim(1):wlim(2)];

am.YLim = alim;
ph.YLim = plim;

if ~exist('astep','var')
  astep = 20;
end
if ~exist('pstep','var')
  pstep = 45;
end

am.YTick = [am.YLim(1):astep:am.YLim(2)];
ph.YTick = [ph.YLim(1):pstep:ph.YLim(2)];

am.YAxis.MinorTickValues=[am.YLim(1):5:am.YLim(2)];
ph.YAxis.MinorTickValues=[ph.YLim(1):15:ph.YLim(2)];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

am.FontName = 'Latin Modern Math';
ph.FontName = 'Latin Modern Math';

am.FontSize = 14;
ph.FontSize = 14;

% math_y = char([55349 56422]);
% math_omega = char([55349 57108]);
% math_A = char([55349 57058]);
% math_phi = char([55349 57105]);
% math_j = char([55349 56407]);

text(tx,0.54,0.04,['$\omega\mathrm{[rad/s]}$'],...
  'FontName','Latin Modern Math','FontSize',14,'HorizontalAlignment','Center',...
  'Interpreter','latex');
text(tx,0.06,0.78,['$A(j\omega)\mathrm{[dB]}$'],...
  'FontName','Latin Modern Math','FontSize',14,'HorizontalAlignment','Center',...
  'Rotation',90,'VerticalAlignment','baseline','Interpreter','latex');
text(tx,0.06,0.32,['$\varphi(j\omega)\mathrm{[^\circ]}$'],...
  'FontName','Latin Modern Math','FontSize',14,'HorizontalAlignment','Center',...
  'Rotation',90,'VerticalAlignment','baseline','Interpreter','latex');


am.XTickLabel={};

am.XGrid='on';
am.YGrid='on';
am.XMinorGrid='on';
am.YMinorGrid='on';


ph.XGrid='on';
ph.YGrid='on';
ph.XMinorGrid='on';
ph.YMinorGrid='on';

am.XScale='log';
ph.XScale='log';


am.GridAlpha=1;
am.GridColor=[0.6 0.6 0.6];
am.GridLineStyle='-';

ph.GridAlpha=1;
ph.GridColor=[0.6 0.6 0.6];
ph.GridLineStyle='-';

am.MinorGridAlpha=1;
am.MinorGridColor=[0.9 0.9 0.9];
am.MinorGridLineStyle='-';

ph.MinorGridAlpha=1;
ph.MinorGridColor=[0.9 0.9 0.9];
ph.MinorGridLineStyle='-';

