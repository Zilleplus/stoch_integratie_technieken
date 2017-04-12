function ex3_2_check_stabilities( lambda,mu,delta_t )    
    % SDE mean square stability for geometric brownian motion p70
    if(real(lambda)+0.5*abs(mu)^2<0)
        disp('SDE is mean square stable');
    else
        disp('SDE is NOT mean square stable');
    end
    % SDE asymptotic stability for geometric brownian motion p70
    if(real(lambda-0.5*mu^2)<0)
        disp('SDE is asymptotic stable');
    else
        disp('SDE is NOT asymptotic stable');
    end
    
    % euler-maru mean square stability p71
    if abs( 1+lambda*delta_t)^2 +abs(mu)^2*delta_t <1
        disp('euler maru is mean square stable');
    else
        disp('euler-mura is NOT mean square stable stable');
    end   
    % euler-maru asymptotic stability p71
    gauss = randn(100000,1);
    if mean(log(1+lambda*delta_t+mu*sqrt(delta_t).*gauss))<0
        disp('euler maru is asymptotic stable');
    else
        disp('euler-mura is NOT asymptotic stable stable');
    end
end

