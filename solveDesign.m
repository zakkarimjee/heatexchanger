function [Eff, valid] = solveDesign(design)
    %definition of input vector
    L = design(1);
    NoT = design(2);
    NoB = design(3);
    Y = design(4);
    a = design(5);
    n_shell = design(6);
    n_tube = design(7);
    
    [valid, mass] = constraint(L,NoT,NoB,Y,n_shell,n_tube)
    Eff = 0;
    
    if valid == 0
        return
    end
    
    function d = cold(mc)
        d = dp_pump_cold(mc) - dp_hx_cold(mc, L, NoT, NoB, Y, a, n_shell, n_tube);
    end
    function d = hot(mh)
        d = dp_pump_hot(mh) - dp_hx_hot(mh, L, NoT, n_tube);
    end
    mh = fzero(@hot,0.5);
    mc = fzero(@cold,0.5);

    [dp_hot, Re_hot] = dp_hx_hot(mh,L,NoT,n_tube);
    [dp_cold, Re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a,n_shell,n_tube);
    [Q, ThOut, TcOut, Eff] = thermal3(mh,mc,Re_hot,Re_cold,L,NoT,n_shell,n_tube);
    
end

