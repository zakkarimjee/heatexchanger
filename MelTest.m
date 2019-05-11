Y = 0.014; %variable

L = 0.35; %varaible needs to be below 0.3 
NoB = 9; %variable number of baffles
NoT = 13; %varaible number of tubes

a = 0.34; %for square (0.2 for triangular)

[dp_cold, Re_cold] = dp_hx_cold2(0.5, L, NoT, NoB, Y, a)

mh = 0.45;
mc = 0.5;
Re_hot = 12036;

[SolQ, SolThOut, SolTcOut, Eff] = thermal(mh,mc,Re_hot,Re_cold,L,NoT)