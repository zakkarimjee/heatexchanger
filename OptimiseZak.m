clear 
close all 

Lrange = linspace(0.15, 0.20, 5);
NoTrange = 10:1:14;
NoBrange = 18:1:20;
Yrange = [0.012 0.013 0.014];
a = 0.34
n_shell_range = [1 2];
n_tube_range = [1 2];

Eff_L = [];
i = 0;
total = length(Lrange)*length(NoTrange)*length(NoBrange)*length(Yrange)*length(a)*3;
n_shell = 1;
for n_tube = n_tube_range
    for L = Lrange
        for NoT = NoTrange
            for NoB = NoBrange
                for Y = Yrange
            design = [L,NoT,NoB,Y,a,n_shell,n_tube];
            [eff, val, mass] = solveDesign(design);
                if val
                    Eff_L = [Eff_L; design, eff];
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
n_shell = 2;
n_tube = 2;
    for L = Lrange
        for NoT = NoTrange
            for NoB = NoBrange
                for Y = Yrange
            design = [L,NoT,NoB,Y,a,n_shell,n_tube];
            [eff, val, mass] = solveDesign(design);
                if val
                    Eff_L = [Eff_L; design, eff];
                end
                if mod(i,10) == 0
                    disp([i total]);
                end
                i = i + 1;
                end
            end
        end
    end



Eff_L_max = max(Eff_L);
[Max_Eff, ind] = max(Eff_L);

optimum = Eff_L(ind(end),:);
