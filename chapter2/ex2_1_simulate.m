function [ invariant_dist_eig,invariant_dist_stoch_sim ] = ex2_1_simulate( alpha,beta,number_of_simulations )
    T=ex2_1_get_matrix_M(alpha,beta);

    % calc invariant distribution using eigenvalue decomposition of M1
    [U,V]=eig(T); % shouldnt the highest eigenvalue be 1?
    [~,index]=sort(diag(V));
    invariant_dist_eig=U(:,index(5));

    % calc invariant distribution using stoch simulation and ergodicity
    position=1;% just randomly pick startposition 1
    log_positions=zeros(5,1);

    for i=1:number_of_simulations
        u=rand();
        if(u<T(1,position))
            position=1;
        elseif(u<sum(T(1:2,position)))
            position=2;
        elseif(u<sum(T(1:3,position)))
            position=3;
        elseif(u<sum(T(1:4,position)))
            position=4;
        else
            position=5;
        end
        log_positions(position)=log_positions(position)+1;
    end
    invariant_dist_stoch_sim=log_positions/norm(log_positions);
end

