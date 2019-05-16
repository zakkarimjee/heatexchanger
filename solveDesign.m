function Eff = solveDesign(design)
    %definition of input vector
    L = design(1);
    NoT = design(2);
    NoB = design(3);
    Y = design(4);
    a = design(5);
    n_shell = design(6);
    n_tube = design(7);
    
    function d = cold(mc)
        d = dp_pump_cold(mc) - dp_hx_cold(mc, L, NoT, NoB, Y, a);
    end
    function d = hot(mh)
        d = dp_pump_hot(mh) - dp_hx_hot(mh, L, NoT);
    end

    mc = fzero(@cold,0.5);
    mh = fzero(@hot,0.5);

    [dp_hot, Re_hot] = dp_hx_hot(mh,L,NoT);
    [dp_cold, Re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a);
    [valid, mass] = constraint(L,NoT,NoB,Y);
    if valid
        [Q, ThOut, TcOut, Eff] = thermal(mh,mc,Re_hot,Re_cold,L,NoT);
    else
        Eff = 0;
        return
    end
    
end

