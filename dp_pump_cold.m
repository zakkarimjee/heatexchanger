function dp = dp_pump_cold(mdot)
    global pump_cold_data rho;
%     q = mdot/rho;
%     if(q>0.6918); q = 0.1475; end
%     if(q<0.1708); q = 0.1708; end
%     
%     p = pump_cold_data;
%     dp = 1e5*interp1(p(:,1),p(:,2),q);
p = polyfit(pump_cold_data(:,1),pump_cold_data(:,2),2);
dp = 1e5*polyval(p, mdot*1000/rho);

end

