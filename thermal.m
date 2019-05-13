function [SolQ, SolThOut, SolTcOut, Eff] = thermal(mh,mc,Re_hot,Re_cold,L,NoT)

global d0 di ThIn TcIn cp Pr K Ktube c

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Re_cold^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

syms Q ThOut TcOut

eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn)))];
vars = [Q,ThOut,TcOut];
[SolQ, SolThOut, SolTcOut] = vpasolve(eqns,vars);

Eff = SolQ/(min(mh,mc)*cp*(ThIn-TcIn));

end