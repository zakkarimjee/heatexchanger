function dp = dp_pump_hot(mdot)
    global pump_hot_data rho;
%     q = mdot/rho;
%     if(q>0.5380)
%         q = 0.5380; 
%     elseif(q<0.0696)
%         q = 0.0696;
%     else
%         pass
%     end
%     p = pump_hot_data;
%     dp = 1e5*interp1(p(:,1),p(:,2),q);

p = polyfit(pump_hot_data(:,1),pump_hot_data(:,2),2);
dp = 1e5*polyval(p, mdot*1000/rho);
end

