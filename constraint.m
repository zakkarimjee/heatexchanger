function [valid, m] = constraint(L,NoT,NoB,Y,a,n_shell,n_tube)
    %% our constrains are mass under 1.2kg and length under 0.3m
    %also no more than 6m of tube
    %no more than 500mm of pipe

    global Dsh d0
    valid = 0;
    m = 0;
    %% density definitions
    d_tube = 0.2; %kg/m
    d_pipe = 0.65; %kg/m
    m_nozzle = 0.025; %kg
    d_plate = 6.375; %kg/m2
    d_baff = 2.39; %kg/m2
    
    L_ends = 0.048;
    
    %size calcs
    A_plate = pi*(Dsh^2)*0.25; %also the inside area of the shell
    L_tube = NoT*L; %total length of copper tube

   
    %%calculate mass

    m = 0;
    %pipe mass
    m = m + (L+0.003)*d_pipe;
    %pipe end mass
    m = m + L_ends*2*d_pipe;
    %tube mass
    m = m + (L_tube+0.012)*d_tube;
    %baffle mass (Assume 0.8*pipe area, neglect tube hole area)
    A_baff = pi*(Dsh^2)*0.25 - NoT*0.25*pi*d0^2;
    m_baff = A_baff*d_baff;
    m = m + NoB*m_baff;
    %end plate mass (4 of them, neglecting tube hole area)
    m = m + 4*A_plate*d_plate - 2*NoT*0.25*pi*d0^2;
    %centre sheet mass
    m = m + n_shell*Dsh*L*d_baff/2;
    
    %nozzle masses
    m = m + 4*m_nozzle;
    

    %% Length constraints
    %overall length - don't need to check pipe length as this is extra to
    %overall length
    if L > 0.3-2*L_ends
        disp("Too long");
        return
    end
    %tube length 6m max
    if L_tube > 6
        disp("Too much tube length");
        return
    end
    
    %%check given number of tubes with given pitch will actually fit!
    % a rough calculation assuming each tube takes up an area of effective
    % radius pitch/2
    if a == 0.34
        %square pitch
        A_tube_p = Y^2;
        if NoT*A_tube_p > 0.9*A_plate
            disp("Tubes won't fit!");
            return
        end
    elseif a == 0.2
        %triangularpitch
        A_tube_p = 0.866*Y^2;
        if NoT*A_tube_p > 0.90*A_plate
            disp("Tubes won't fit!");
            return
        end
    end
    
    if Y<=d0
        disp("Tubes interfere");
        return
    end
    
    if n_shell>1
        if mod(n_tube,n_shell) ~= 0
            disp("invalid multipass configuration");
            return
        end
    end
    
    
    
    %add a safety factor of 5% for sealant and inaccuracy etc.
    m_max = 1.1;
    if m > m_max 
        disp("Mass too large");
        return
    end
    valid = 1;
end


