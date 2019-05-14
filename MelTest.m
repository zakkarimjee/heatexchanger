clear 

Y = 0.014; %variable

L = 0.35; %varaible needs to be below 0.3 
NoB = 9; %variable number of baffles
NoT = 13; %varaible number of tubes

a = 0.34; %for square (0.2 for triangular)

mh = 0.45;
mc = 0.5;

[dp_hot, Re_hot] = dp_hx_hot(0.48, L, NoT)
[dp_cold, Re_cold] = dp_hx_cold(0.5, L, NoT, NoB, Y, a)

[SolQ, SolThOut, SolTcOut, Eff] = thermal(mh,mc,Re_hot,Re_cold,L,NoT)

dp_hot_pump = dp_pump_hot(mh)
dp_cold_pump = dp_pump_cold(mc)

d = dp_diff_hot(0.5)

% syms Mc Dp
% 
% eqns = [Dp==dp_pump_cold(Mc), Dp == dp_hx_cold(Mc, L, NoT, NoB, Y, a)];
% [SolMc, SolDp] = fsolve(eqns,vars)
