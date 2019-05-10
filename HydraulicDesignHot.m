%% Inputs

L = 0.3; %lengthof pipes m, less than 0.3
NoT = 13; %number of tubes

A_tubes = NoT*pi*(di^2)/4;


%% Calculations

mh = 0.5; % guess at mass flow rate
q = mh/rho; % volumetric flow rate

%Find velocity 

V_tube = (mh/rho)/A_tubes; %TODO check rho
Re_tube = rho*V_tube*di/mu; %TODO check mu

%Pressure drop along tubes
f_factor = (1.82*log10(Re_tube) - 1.64)^(-2);
dp_tube = f_factor*(L/di)*0.5*rho*(V_tube^2);

%entrance/exit pressure drop - using 


%nozzle pressure drop

