init 

% di = 0.006;
% d0 = 0.008;
L = 0.35;
NoT = 13;

TcIn = 20;
ThIn = 60;
mc = 0.5;
mh = 0.48;
cp = 4179;
Pr = 4.31;
K = 0.632;
Ktube = 386;
c = 0.15; % for square pitch 

Resh = 6400;
Re_hot = 12036;

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Resh^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

syms Q ThOut TcOut

eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn)))];
vars = [Q,ThOut,TcOut];
[SolQ, SolThOut, SolTcOut] = vpasolve(eqns,vars)

Eff = SolQ/(min(mh,mc)*cp*(ThIn-TcIn))

