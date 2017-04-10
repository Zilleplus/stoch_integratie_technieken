function [ alphas ] = ex2_2_calc_prop( A )
    % paremeters model:
    k1=0.18;
    k2=2.5*10^-4;
    k3=2200;
    k4=37.5;

    alphas=zeros(1,4);
    alphas(1)=A*(A-1)*k1;
    alphas(3)=k3;
    alphas(2)=A*(A-1)*(A-2)*k2;
    alphas(4)=A*k4;
    
    % avoid negative alphas...    
    if(A==1)
        alphas(2)=0;  
    elseif(A==0)
        alphas(1)=0; 
        alphas(2)=0;  
    end
end

