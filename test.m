
L = 0.3; %m length
NoT = 13; %tubes
NoB = 9; %baffles
Y = 0.014; %m pitch
a = 0.34; %square pitch, 0.2 for triangular

%guesses
mh = 0.5;
mc = 0.5;

hold on
n = 10
mc = linspace(0.1,0.5,n);
dp = zeros(size(mc));
for i = 1:n
    dp(i) = dp_pump_hot(mc(i))
end

plot(mc,dp);