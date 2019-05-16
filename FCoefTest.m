% Fcoef Test 
close all
clear 

% TcIn = 20;
% TcOut = 30;
% ThIn = 60;
% ThOut = 55;
% 
% T1 = TcIn;
% T2 = TcOut;
% t1 = ThIn;
% t2 = ThOut;

% R = (T1 - T2)/(t2-t1);
% P = (t2 - t1)/(T1 - t1);
R1 = 0.8;
R = linspace(0.2,0.8,4);
P = linspace(0.3,0.8,50);

F1 = ((R1^2+1)^0.5).*log((1-P)./(1-R1*P))./((R1-1).*log(((1-P)+(1-R1*P)+P.*((R1^2+1)^0.5))./((1-P)+(1-R1*P)-P.*((R1^2+1).^0.5))));

F = zeros(length(R),length(P));

for r = 1:length(R)
    F(r,:) = ((R(r)^2+1)^0.5).*log((1-P)./(1-R(r)*P))./((R(r)-1).*log(((1-P)+(1-R(r)*P)+P.*((R(r)^2+1)^0.5))./((1-P)+(1-R(r)*P)-P.*((R(r)^2+1).^0.5))));
end

figure
hold on 
plot(P,F1,'x')
plot(P,F)
% hold off

n = 2; %shell pass
R = 0.8;
P = linspace(0.3,0.8,50);

S = ((R^2+1)^0.5)/(R-1);
W = ((1-P*R)./(1-P)).^(1/n);

F2vec = S*log(W)./log((1+W-S+S*W)./(1+W+S-S*W));
F3vec = ((R^2+1)^0.5)/(R-1)*log(((1-P*R)./(1-P)).^(1/n))./...
    log((1+((1-P*R)./(1-P)).^(1/n)-((R^2+1)^0.5)/(R-1)+((R^2+1)^0.5)/(R-1)*((1-P*R)./(1-P)).^(1/n))./...
    (1+((1-P*R)./(1-P)).^(1/n)+((R^2+1)^0.5)/(R-1)-((R^2+1)^0.5)/(R-1)*((1-P*R)./(1-P)).^(1/n)));

R = linspace(0.2,0.8,4);
F4 = zeros(length(R),length(P));

for r = 1:length(R)
    F4(r,:) = ((R(r)^2+1)^0.5)/(R(r)-1)*log(((1-P*R(r))./(1-P)).^(1/n))./...
    log((1+((1-P*R(r))./(1-P)).^(1/n)-((R(r)^2+1)^0.5)/(R(r)-1)+((R(r)^2+1)^0.5)/(R(r)-1)*((1-P*R(r))./(1-P)).^(1/n))./...
    (1+((1-P*R(r))./(1-P)).^(1/n)+((R(r)^2+1)^0.5)/(R(r)-1)-((R(r)^2+1)^0.5)/(R(r)-1)*((1-P*R(r))./(1-P)).^(1/n)));
end

figure 
hold on 
plot(P,F2vec,'x')
plot(P,F3vec,'o')
plot(P,F4)
hold off

figure
hold on
plot(P,F)
plot(P,F4,'o')
hold off
