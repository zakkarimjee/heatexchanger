global Dsh d0 di dnozzle rho mu visc cp ThIn TcIn Pr K Ktube c

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
visc = 6.51e-04; %fixed
cp = 4179;
Pr = 4.31;
K = 0.632;
Ktube = 386;
c = 0.15; %for square and 0.2 for triangular 

ThIn = 60;
TcIn = 20;


