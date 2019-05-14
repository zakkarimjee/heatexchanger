function [SolQ, SolThOut, SolTcOut, Eff, SolR, SolP, SolF] = thermal3(mh,mc,Re_hot,Re_cold,L,NoT,n)

global d0 di ThIn TcIn cp Pr K Ktube c 

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Re_cold^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

syms Q ThOut TcOut R P F

eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*F*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn))),R==(TcIn-TcOut)/(ThOut-ThIn),P==(ThOut-ThIn)/(TcIn-ThIn),...
F==((R^2+1)^0.5)*log(((1-R*P)/(1-P))^(1/n))/((R-1)*log(((1-P)+(1-R*P)+P*((R^2+1)^0.5))/((1-P)+(1-R*P)-P*((R^2+1)^0.5))))];
vars = [Q,ThOut,TcOut,R,P,F];
[SolQ, SolThOut, SolTcOut, SolR, SolP, SolF] = vpasolve(eqns,vars);

Eff = SolQ/(min(mh,mc)*cp*(ThIn-TcIn));

end