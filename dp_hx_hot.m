function [dp_hot, Re_hot] = dp_hx_hot(mh, L, NoT,n_tube)

global Dsh rho visc dnozzle di

A_tubes = NoT*pi*(di^2)/(4*n_tube); %divides by n_tube
A_shell = 0.25*pi*Dsh^2; 

q = mh/rho; % volumetric flow rate

%Find velocity 

V_tube = q/A_tubes;
Re_tube = rho*V_tube*di/visc;

%Pressure drop along tubes
f_factor = (1.82*log10(Re_tube) - 1.64)^(-2);
dp_tube = f_factor*(L*n_tube/di)*0.5*rho*(V_tube^2); %L *n_tube

%entrance/exit pressure drop - using infinite Re, turbulent flow assumption
sigma = A_tubes/A_shell;
Kc = 0.4 - 0.4*sigma;
Ke = (1 - sigma)^2;

dp_ends = 0.5*rho*(V_tube^2)*(Kc+Ke); % same 
dp_pass = (1+Kc)*0.5*rho*(V_tube^2); %loses all dynamic head at
%nozzle pressure drop - assume loss of all dynamic pressure
V_nozzle = q/(0.25*pi*dnozzle^2);
dp_nozzle = rho*V_nozzle^2;

dp_hot = dp_tube + dp_pass + dp_ends + dp_nozzle;

Re_hot = Re_tube;
end

