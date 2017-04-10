function [ A_history,t_history ] = ex2_2_simulate( A0,num_of_simulations)
    t_history=zeros(num_of_simulations,1);
    A_history=zeros(num_of_simulations,1);
    A=A0;
    for index_sim=1:num_of_simulations
        % step 1.
        alphas = ex2_2_calc_prop(A);
        alpha=sum(alphas);
        % step 2. find increment
        u=rand();
        tau = - 1/(alpha)*log(u);
        % save the time axis:
        if(index_sim>1)
            t_history(index_sim)=t_history(index_sim-1)+tau;
        else
            t_history(1)=tau;
        end
        % step 3. find reaction and step 4. apply reaction
        y=rand();
        alpha_normalized = alphas./alpha;
        if(y<alpha_normalized(1))
            % reaction 1
            A=A+1;
        elseif(y<sum(alpha_normalized(1:2)))
            % reaction 2
            A=A-1;
        elseif(y<sum(alpha_normalized(1:3)))
            % reaction 3
            A=A+1;
        else
            % reaction 4
            A=A-1;
        end
        A_history(index_sim)=A;
    end
end

