function lenkwinkel=controller(y,kappaStr)
persistent y_alt
% initialize persistent (in C: static) variables
if isempty(y_alt)
  y_alt=y;
end

H = 1/60; % frame rate of Unity


% Vorschlag für Reglerverstärkungen
Kp = 0.02; 
Kd = 0.02;

% Hier Regler implementieren; im Moment geht's einfach geradeaus
lenkwinkel = 0.00;
