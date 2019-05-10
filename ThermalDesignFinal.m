clear 

di = 0.006;
d0 = 0.008;
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

Resh = 6400;
Re_hot = 12036;

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = 0.023*Resh^0.8*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

% ThOut = 55.42;
% TcOut = 23.93;
% 
% Q1 = mc*cp*(TcOut-TcIn)
% Q2 = mh*cp*(ThIn - ThOut)
% Q3 = U*A*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn)))

syms Q TcOut ThOut 

% ThOut = 55.42;
% syms Q TcOut

% TcOut = 23.93;

% syms x y a

% eqns = [x^2*y^2 == 2, x-y/2 == a];
% vars = [x,y,a];
% [solx, soly, solz] = vpasolve(eqns,vars)

syms Q ThOut TcOut

eqns = [mh*cp*(ThIn - ThOut)==Q, mc*cp*(TcOut-TcIn)==Q, Q==U*A*(((ThIn-TcOut)-(ThOut-TcIn))/log((ThIn-TcOut)/(ThOut-TcIn)))];
vars = [Q,ThOut,TcOut];
[SolQ, SolThOut, SolTcOut] = vpasolve(eqns,vars)


