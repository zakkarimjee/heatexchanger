clear
init
global L NoT NoB Y a
L = 0.35; %m length
NoT = 13; %tubes
NoB = 14; %baffles
Y = 0.0156; %m pitch
a = 0.34; %square pitch, 0.2 for triangular
n = 20;
mcs = linspace(0.1,1,n);
dpc = zeros(size(mcs));
dph = zeros(size(mcs));

for i = 1:n
    dph(i) = dp_diff_hot(mcs(i));
    dpc(i) = dp_diff_cold(mcs(i));
end
hold on
plot(mcs,dph,'r');
plot(mcs,dpc,'b');

mc = fzero(@dp_diff_cold,[0.1 0.9]);
mh = fzero(@dp_diff_hot,[0.1 0.9]);

[dp_hot, re_hot] = dp_hx_hot(mh,L,NoT);
[dp_cold, re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a);

[Q, ThOut, TcOut, Eff] = thermal(mh,mc,re_hot,re_cold,L,NoT);


