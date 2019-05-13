
L = 0.3; %m length
NoT = 13; %tubes
NoB = 10; %baffles
Y = 0.014; %m pitch
a = 0.2; %square pitch, 0.2 for triangular

%guesses
mh = 0.5;
mc = 0.5;

n = 20
mc = linspace(0.1,1,n);
dp = zeros(size(mc));
dph = zeros(size(mc));
figure(1);
for i = 1:n
    dp(i) = dp_pump_cold(mc(i))
    [dph(i) re] = dp_hx_cold(mc(i),L,NoT,NoB,Y,a);
end
hold on
plot(mc,dp);
plot(mc,dph);

mc = linspace(0.1,1,n);
dp = zeros(size(mc));
dph = zeros(size(mc));
figure(2);
for i = 1:n
    dp(i) = dp_pump_hot(mc(i))
    [dph(i) re] = dp_hx_hot(mc(i),L,NoT);
end
hold on
plot(mc,dp);
plot(mc,dph);