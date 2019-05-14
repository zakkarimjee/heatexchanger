% Fcoef Test 
close all
clear 

TcIn = 20;
TcOut = 30;
ThIn = 60;
ThOut = 55;

T1 = TcIn;
T2 = TcOut;
t1 = ThIn;
t2 = ThOut;

% R = (T1 - T2)/(t2-t1);
% P = (t2 - t1)/(T1 - t1);
R8 = 0.8;
R = linspace(0.2,0.8,4);
P = linspace(0.3,0.8,50);

FP = ((R8^2+1)^0.5).*log((1-P)./(1-R8*P))./((R8-1).*log(((1-P)+(1-R8*P)+P.*((R8^2+1)^0.5))./((1-P)+(1-R8*P)-P.*((R8^2+1).^0.5))));

F = zeros(length(R),length(P));

for r = 1:length(R)
    F(r,:) = ((R(r)^2+1)^0.5).*log((1-P)./(1-R(r)*P))./((R(r)-1).*log(((1-P)+(1-R(r)*P)+P.*((R(r)^2+1)^0.5))./((1-P)+(1-R(r)*P)-P.*((R(r)^2+1).^0.5))));
end

figure
hold on 
plot(P,FP,'x')
plot(P,F)
hold off

n = 2; %shell pass
R = 
P = 

F2 = ((R^2+1)^0.5)*log((1-P*R)/(1-P))^/(R-1)*...
log(1+((1-P*R)/(1-P))^(1/n)-((R^2+1)^0.5)/(R-1)+((R^2+1)^0.5)*((1-R*P)/(1-P))^(1/n)/(R-1)/(1+((1-P*R)/(1-P))^(1/n)+((R^2+1)^0.5)/(R-1)-((R^2+1)^0.5)*((1-R*P)/(1-P))^(1/n)/(R-1)))

