clear 
close all 

L = linspace(0.2, 0.3, 10);
NoT = 10;
NoB = 20;
Y = 0.014;
a = 0.34;
n_shell = 1;
n_tube = 1;

Eff_L = zeros(1,length(L));
    
for i= 1:length(L)    

    design = [L(i),NoT,NoB,Y,a,n_shell,n_tube];
    Eff_L(1,i) = solveDesign(design);
    
end

[Eff_L_max, Ind] = max(Eff_L);
Eff_L_max
Corress_L = L(Ind)


Para = linspace(0.005,0.025,10);
Eff_Para= zeros(1,length(Para));

for i= 1:length(Para)    

    design = [0.3,NoT,NoB,Para(i),a,n_shell,n_tube];
    Eff_Para(1,i) = solveDesign(design);
    
end

[Eff_Para_max, Ind] = max(Eff_Para);
Eff_Para_max
Corress_Para = Para(Ind)

figure 
hold on 
plot(Eff_L)
plot(Eff_Para)
hold off 

% Eff_NoT_L = zeros(length(L),length(NoT));
% 
% for i= 1:length(L)    
%     for j = 1:length(NoT)
% 
%         design = [L(i),NoT(j),NoB,Y,a,n_shell,n_tube];
%         Eff_L_NoT(i,j) = solveDesign(design);
%         
%     end
% end
% 
% figure 
% contour(NoT,L,Eff_L_NoT)



