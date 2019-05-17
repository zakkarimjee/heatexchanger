L = 0.2
NoT = 10
NoB = 10
Y = 0.014
a = 0.34
n_shell = 1
n_tube = 1

mh = fzero(@hot,0.5)
mc = fzero(@cold,0.5)

function dc = cold(mc)
        dc = dp_pump_cold(mc) - dp_hx_cold(mc, L, NoT, NoB, Y, a, n_shell, n_tube);
    end
    function dh = hot(mh)
        dh = dp_pump_hot(mh) - dp_hx_hot(mh, L, NoT, n_tube);
    end

