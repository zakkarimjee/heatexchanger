function [dp_cold, Re_cold] = dp_hx_cold2(mc, L, NoT, NoB, Y, a)

global Dsh d0 rho visc dnozzle

B = L/(NoB+1); 
Ash = Dsh*(Y-d0)*B/Y;

Vsh = mc/(rho*Ash);

Resh = Vsh*d0*rho/visc; 

Psh = 4*a*Resh^-0.15*NoT*rho*Vsh^2;

Vnozzle = mc/(rho*pi*dnozzle^2/4);

Pnozzle = rho*Vnozzle^2; 

PshTOT = Psh + Pnozzle;

dp_cold = PshTOT;

Re_cold = Resh;

end

