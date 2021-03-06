function [Q, ThOut, TcOut, Eff] = entu(mh,mc,Re_hot,Re_cold,L,NoT,c,n_shell,n_tube)

global d0 di ThIn TcIn cp Pr K Ktube

Nui = 0.023*Re_hot^0.8*Pr^0.3;
hi = Nui*K/di;
Nu0 = c*Re_cold^0.6*Pr^0.3;
h0 = Nu0*K/d0;
U = (1/hi + di*log(d0/di)/(2*Ktube) + di/(d0*h0))^-1;
A = pi*di*L*NoT;

NTU = U*A/(cp*min([mh mc]));

Rc = min([mh mc])/max([mh mc]);

%counterflow

%equations from https://books.google.co.uk/books?id=YBaNaLurTD4C&lpg=RA1-PA691&ots=tPREepqKcC&dq=shell%20and%20tube%2011.30b&pg=PA691#v=onepage&q&f=false
%Introduction to Heat Transfer (Bergman, Incropera) pg724

if (mod(n_tube,n_shell)~= 0) && (n_tube ~= 1) && (n_shell ~= 1)
   Eff = 0;
   error("Invalid pass numbers");
end

if n_shell == 1
    if n_tube == 1
        Eff = (1 - exp(-NTU*(1 - Rc)))/(1 - Rc*exp(-NTU*(1 - Rc)));
        %disp("Single pass");
    end
end
if mod(n_tube,2) == 0
    Z = sqrt(1+Rc^2);
    NTU1 = NTU/n_shell;
    Eff1 = 2/(1+Rc+Z*(1+exp(-NTU1*Z))/(1-exp(-NTU1*Z)));
    if n_shell>1
        J = (1-Eff1*Rc)/(1-Eff1);
        Eff = (J^n_shell - 1)/(J^n_shell - Rc);
        %disp("Multi tube and shell pass");
    else
        Eff = Eff1;
        %disp("Single shell, multi tube pass");
    end
end
Q_max = min([mc mh])*cp*(ThIn - TcIn);
Q = Eff*Q_max;

ThOut = ThIn - Q/(mh*cp);
TcOut = TcIn + Q/(mc*cp);


end
