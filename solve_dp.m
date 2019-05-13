close all
clear

%design parameters
L = 0.3; %m length
NoT = 10; %tubes
NoB = 8; %baffles
Y = 0.014; %m pitch
a = 0.34; %square pitch, 0.2 for triangular

%find a first guess
% d = zeros(10,1);
% dpp = d;
% dphx = d;
% mc = 0:0.02:0.8;
% n = size(mc);
% n = n(2);
% 
% hold on
% for L = 0.05:0.05:0.5
%     for i = 1:n
%         [dphx(i), re] = dp_hx_cold(mc(i),L,NoT,NoB,Y,a);
%         dpp(i) = dp_pump_cold(mc(i));
%         d(i) = dphx(i) - dpp(i);
%     end
%     plot(mc,d,'DisplayName',num2str(L));
% end
% legend
% 
d = zeros(10,1);
dpp = d;
dphx = d;
mc = 0:0.02:1;
n = size(mc);
n = n(2);

figure(2)
hold on
    for i = 1:n
        [dphx(i), re_hot] = dp_hx_hot(mc(i),L,NoT);
        dpp(i) = dp_pump_hot(mc(i));
        d(i) = dphx(i) - dpp(i);
    end
    plot(mc,d);
    plot(mc, dphx);
    plot(mc,dpp);
    

legend


