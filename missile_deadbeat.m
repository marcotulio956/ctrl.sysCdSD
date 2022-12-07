
syms z
num2 = [1,-1.3720,0.3781];
den2 = [0.5193,-1.0322,0.5129];
ts = 0.1;
dz = tf(num2,den2,ts);
sys=dz*Gz/(1+dz*Gz);
step(sys)