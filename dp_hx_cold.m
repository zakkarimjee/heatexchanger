function [dp_cold, Re_cold] = dp_hx_cold(mc, L, NoT, NoB, Y, a, n_shell, n_tube)

global Dsh d0 rho visc dnozzle

B = L/(NoB+1);
Ash = Dsh*(Y-d0)*B/(Y*n_shell); %divide by n 

Vsh = mc/(rho*Ash);

Resh = Vsh*d0*rho/visc; 

Psh = 4*a*Resh^-0.15*NoT*rho*Vsh^2; % same divide by n multiply by n 

Vnozzle = mc/(rho*pi*dnozzle^2/4);

Pnozzle = rho*Vnozzle^2;

PshTOT = Psh + Pnozzle;

dp_cold = PshTOT;

Re_cold = Resh;

end

