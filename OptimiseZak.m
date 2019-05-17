clear 
close all 

Lrange = linspace(0.15, 0.20, 5);
NoTrange = 15:1:20;
NoBrange = 17:1:25;
Yrange = [0.01];
arng = [0.2]
n_shell_range = [1 2];
n_tube_range = [2 4];

% Lrange = linspace(0.15, 0.20, 5);
% NoTrange = 12:2:16;
% NoBrange = 15:2:20;
% Yrange = [0.012 0.013 0.014];
% arng = [0.2 0.34]
% n_shell_range = [1 2];
% n_tube_range = [1 2];

Eff_L = [];
i = 0;
total = length(Lrange)*length(NoTrange)*length(NoBrange)*length(Yrange)*length(arng)*3;
for a = arng
for n_shell = n_shell_range;
for n_tube = n_tube_range
    for L = Lrange
        for NoT = NoTrange
            for NoB = NoBrange
                for Y = Yrange
            design = [L,NoT,NoB,Y,a,n_shell,n_tube];
            [q, eff, val, mass] = solveDesign(design);
                if val
                    Eff_L = [Eff_L; design, q/1000, eff];
                end
                if mod(i,10) == 0
                    disp([i total]);
                end
                i = i + 1;
                end
            end
        end
    end
end
end
end

Eff_L_max = max(Eff_L);
[Max_Eff, ind] = max(Eff_L);

OptimumEff = Eff_L(ind(end),:);
OptimumQ = Eff_L(ind(end-1),:);


