function d = dp_diff_hot(mc)
global Dsh d0 rho visc dnozzle

global L NoT NoB Y a

d = dp_pump_hot(mc) - dp_hx_hot(mc, L, NoT,n_tube);

end

