function [Eff, valid, mass] = solveDesign(design)
    %definition of input vector
    L = design(1);
    NoT = design(2);
    NoB = design(3);
    Y = design(4);
    a = design(5);
    n_shell = design(6);
    n_tube = design(7);
    
    if a == 0.34 
        c = 0.15;
    elseif a == 0.2
        c = 0.2;
    end
    
    [valid, mass] = constraint(L,NoT,NoB,Y,a,n_shell,n_tube);
    Eff = 0;
    
    if valid == 0
        return
    end
    
    function dc = cold(mc)
        dc = dp_pump_cold(mc) - dp_hx_cold(mc, L, NoT, NoB, Y, a, n_shell, n_tube);
    end
    function dh = hot(mh)
        dh = dp_pump_hot(mh) - dp_hx_hot(mh, L, NoT, n_tube);
    end

    mh = fzero(@hot,[0.1 0.9]);
    mc = fzero(@cold,[0.1 0.9]);

    [dp_hot, Re_hot] = dp_hx_hot(mh,L,NoT,n_tube);
    [dp_cold, Re_cold] = dp_hx_cold(mc,L,NoT,NoB,Y,a,n_shell,n_tube);
    [Q, ThOut, TcOut, Eff] = thermal3(mh,mc,Re_hot,Re_cold,L,NoT,c,n_shell,n_tube);
    
end

