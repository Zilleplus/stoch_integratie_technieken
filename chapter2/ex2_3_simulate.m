function [ W,t ] = ex2_3_simulate( num_of_steps )
    delta_t=5*10^-2;
        
    W=zeros(num_of_steps,1);
    t=zeros(num_of_steps,1);
    for i_step=2:num_of_steps
        t(i_step)=delta_t+t(i_step-1);
        W(i_step)=W(i_step-1)+sqrt(delta_t)*randn();
    end
end

