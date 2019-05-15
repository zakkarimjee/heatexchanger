close 
clear

init

global L NoT NoB Y a

L = 0.35; %m length
NoT = 13; %tubes
NoB = 14; %baffles
% Y = 0.0156; %m pitch
Y = 0.012; %m pitch
a = 0.34; %square pitch, 0.2 for triangular
n_shell = 2;
n_tube = 4;

mc = fzero(@dp_diff_cold,[0.1 0.9]);
mh = fzero(@dp_diff_hot,[0.1 0.9]);

[dp_hot, Re_hot] = dp_hx_hot(mh,L,NoT);
[dp_cold, Re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a);

[Q, ThOut, TcOut, Eff] = thermal(mh,mc,Re_hot,Re_cold,L,NoT);
[Q, ThOut, TcOut, Eff, R, P, F] = thermal2(mh,mc,Re_hot,Re_cold,L,NoT)



