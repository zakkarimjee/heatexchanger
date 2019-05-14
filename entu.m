function [Q, ThOut, TcOut, Eff] = entu(mh,mc,Re_hot,Re_cold,L,NoT)

global d0 di ThIn TcIn cp Pr K Ktube c

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Re_cold^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

NTU = U*A/(cp*min([mh mc]));

Rc = min([mh mc])/max([mh mc]);

%counterflow
Eff = (1 - exp(-NTU*(1 - Rc)))/(1 - Rc*exp(-NTU*(1 - Rc)));

Q_max = min([mc mh])*cp*(ThIn - TcIn);
Q = Eff*Q_max;

ThOut = ThIn - Q/(mh*cp);
TcOut = TcIn + Q/(mc*cp);


end
