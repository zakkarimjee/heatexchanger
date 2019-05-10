clear 

di = 0.006;
d0 = 0.008;
L = 0.35;
NoT = 13;

TcIn = 20;
ThIn = 60;
mc = 2;
mh = 4;
Pr = 4.31;
K = 0.632;
Ktube = 386;

Resh = 6400;
Re_hot = 12036;

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = 0.023*Resh^0.8*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/2*Ktube + di/(d0*h0))^-1;
A = pi*di*L*NoT;

syms Q TcOut ThOut 
% syms x y a

% [solx,soly] = solve(x^2*y^2 == 0, x-y/2 == a);
eqns = [mc*(TcOut-TcIn)==Q, mh*(ThIn - ThOut)==Q, Q==U*A*((ThIn-TcOut)-(ThOut-TcIn)/log((ThIn-TcOut)/(ThOut-TcIn)))]
vpasolve(eqns,Q)
