Y = 0.014; %variable

L = 0.35; %varaible needs to be below 0.3 
NoB = 9; %variable number of baffles
NoT = 13; %varaible number of tubes

a = 0.34; %for square (0.2 for triangular)

[dp_cold, Re_cold] = dp_hx_cold2(0.5, L, NoT, NoB, Y, a)