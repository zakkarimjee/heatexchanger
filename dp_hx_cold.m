function [dp_cold Re_cold] = dp_hx_cold(mc, L, NoT, NoB, Y, a);
% Y = 0.014; %variable
% 
% L = 0.35; %varaible needs to be blow 0.3 
% NoB = 9; %variable number of baffles
% NoT = 13; %varaible number of tubes
% 
% a = 0.34; %for square (0.2 for triangular)

% this is checked to give the same output as HydraulicDesignCold

globals

%% Calc

B = L/(NoB+1); 
Ash = Dsh*(Y-d0)*B/Y;

mc = 0.5; %guess

Vsh = mc/(rho*Ash);

Resh = Vsh*d0*rho/mu; 

Psh = 4*a*Resh^-0.15*NoT*rho*Vsh^2;

Vnozzle = mc/(rho*pi*dnozzle^2/4);

Pnozzle = rho*Vnozzle^2; 

PshTOT = Psh + Pnozzle;

dp_cold = PshTOT;

Re_cold = rho*Vsh*d0/mu;

end

