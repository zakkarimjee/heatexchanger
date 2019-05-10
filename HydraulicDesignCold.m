%% Inputs
Dsh = 0.064; %fixed
Y = 0.014; %variable
d0 = 0.08; %fixed

L = 0.35; %varaible needs to be blow 0.3 
NoB = 9; %variable number of baffles
NoT = 13; %varaible number of tubes

B = L/(NoB+1); 
Ash = Dsh*(Y-d0)*B/Y;

%% Properties 

rho = 990.1; %fixed
mu = 6.51e-04; %fixed

%% Calc

mc = 0.5; %guess

Vsh = mc/(rho*Ash);

Resh = Vsh*d0*rho/mu; 

Psh = 4*a*Resh^-0.15*N*rho*Vsh^2;





