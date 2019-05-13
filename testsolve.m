clear

init
global L NoT NoB Y a

L = 0.35; %m length
NoT = 4; %tubes
NoB = 14; %baffles
Y = 0.014; %m pitch
a = 0.34; %square pitch, 0.2 for triangular



mcs = [];
mhs = [];
NoBl = [40 45 50 55 60]
for NoB = NoBl

%% plot curves of two dps

n = 50;
mc = linspace(0,1,n);
dp = zeros(size(mc));
dph = zeros(size(mc));
dpd = zeros(size(mc));
figure(1);
title("Cold Pump");
for i = 1:n
    dp(i) = dp_pump_cold(mc(i));
    [dph(i) re] = dp_hx_cold(mc(i),L,NoT,NoB,Y,a);
    dpd(i) = dp_diff_cold(mc(i));
end
hold on
grid on 
% plot(mc,dp);
% plot(mc,dph);
plot(mc,dpd,'--',"DisplayName",num2str(NoB));
legend
mc = linspace(0.1,1,n);
dp = zeros(size(mc));
dph = zeros(size(mc));
figure(2);
title("Hot Pump");
grid on
for i = 1:n
    dp(i) = dp_pump_hot(mc(i));
    [dph(i) re] = dp_hx_hot(mc(i),L,NoT);
    dpd(i) = dp_diff_hot(mc(i));
end
hold on
% plot(mc,dp);
% plot(mc,dph);
plot(mc,dpd,'--',"DisplayName",num2str(NoB));
legend
%%
mcs = [mcs; fzero(@dp_diff_cold,0.6)];
mhs = [mhs; fzero(@dp_diff_hot,0.3)];

end
figure(3);
hold on
plot(NoBl,mcs);
plot(NoBl,mhs);

