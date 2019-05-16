function d = dp_diff_cold(mc)
global Dsh d0 rho visc dnozzle;

global L NoT NoB Y a

d = dp_pump_cold(mc) - dp_hx_cold(mc, L, NoT, NoB, Y, a, n_shell, n_tube);

end

