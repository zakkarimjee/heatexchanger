clear
init
global L NoT NoB Y a
L = 0.3; %m length
NoT = 4; %tubes
NoB = 40; %baffles
Y = 0.014; %m pitch
a = 0.34; %square pitch, 0.2 for triangular

mc = fzero(@dp_diff_cold,0.6);
mh = fzero(@dp_diff_hot,0.3);

[dp_hot, re_hot] = dp_hx_hot(mh,L,NoT);
[dp_cold, re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a);

[Q, ThOut, TcOut, Eff] = thermal(mh,mc,re_hot,re_cold,L,NoT);


