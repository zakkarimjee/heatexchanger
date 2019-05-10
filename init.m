%import cold pump data
filename = 'data/pump_cold.txt';
delimiterIn = ' ';
headerlinesIn = 3;
global pump_cold_data
pump_cold_data = importdata(filename, delimiterIn, headerlinesIn);
pump_cold_data = pump_cold_data.data;

%import hot pump data
filename = 'data/pump_hot.txt';
delimiterIn = ' ';
headerlinesIn = 3;
global pump_hot_data
pump_hot_data = importdata(filename, delimiterIn, headerlinesIn);
pump_hot_data = pump_hot_data.data;


Dsh = 0.064; %fixed
d0 = 0.008; %fixed
di = 0.006;
dnozzle = 0.02; 

% Properties 
rho = 990.1; %fixed
mu = 6.51e-04; %fixed
