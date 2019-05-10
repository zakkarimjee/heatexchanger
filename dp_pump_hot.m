function dp = dp_pump_hot(mdot)
    global pump_hot_data;
    p = pump_hot_data;
    dp = interp1(p(:,1),p(:,2),mdot);


end

