function [SolQ, SolThOut, SolTcOut, Eff, SolR, SolP, SolF] = thermal3(mh,mc,Re_hot,Re_cold,L,NoT,n_shell,n_tube)

global d0 di ThIn TcIn cp Pr K Ktube c 

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Re_cold^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

if n_tube > 1
    
    syms Q ThOut TcOut R P F
    
    eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*F*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn))),R==(TcIn-TcOut)/(ThOut-ThIn),P==(ThOut-ThIn)/(TcIn-ThIn),...
    F==((R^2+1)^0.5)/(R-1)*log(((1-P*R)./(1-P)).^(1/n_shell))./...
    log((1+((1-P*R)./(1-P)).^(1/n_shell)-((R^2+1)^0.5)/(R-1)+((R^2+1)^0.5)/(R-1)*((1-P*R)./(1-P)).^(1/n_shell))./...
    (1+((1-P*R)./(1-P)).^(1/n_shell)+((R^2+1)^0.5)/(R-1)-((R^2+1)^0.5)/(R-1)*((1-P*R)./(1-P)).^(1/n_shell)))];
    
    vars = [Q,ThOut,TcOut,R,P,F];
    [SolQ, SolThOut, SolTcOut, SolR, SolP, SolF] = vpasolve(eqns,vars);
    
else 
    syms Q ThOut TcOut

    eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn)))];
    vars = [Q,ThOut,TcOut];
    [SolQ, SolThOut, SolTcOut] = vpasolve(eqns,vars);
    SolR = 0; SolP = 0; SolF = 1;
end
Eff = SolQ/(min(mh,mc)*cp*(ThIn-TcIn));

ComplexCheck = isreal(SolF);

if ComplexCheck == 0
    disp('Complex F value')
end 
end