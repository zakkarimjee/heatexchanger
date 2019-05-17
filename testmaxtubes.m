for Y = [0.012 0.013 0.014]
    for NoT = 10:30
        [vtri mtri] = constraint(0.1,NoT,10,Y,0.2,1,1);
        if vtri == 0
            disp(["tri" vtri Y NoT])
            break
        end
    end
    for NoT = 10:30
        [vsq msq] = constraint(0.1,NoT,10,Y,0.34,1,1);
        if vsq == 0
            disp(["square" vsq Y NoT])
            break
        end
    end
end