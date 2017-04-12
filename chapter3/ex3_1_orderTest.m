function [ errors_weak,errors_strong,delta_ts ] = ex3_1_orderTest(  )
    lambda=2;
	mu=1;

    delta_ts= 2.^(-20:-5);
    init_position=1;
    num_of_tests=size(delta_ts,2);
    num_of_sim_per_test=10;
    
    errors_weak=zeros(num_of_tests,1);
    errors_strong=zeros(num_of_tests,1);
    
    for i_test=1:num_of_tests
%         num_of_points=ceil(1/delta_ts(i_test));
        num_of_points=100;
        [ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                    delta_ts(i_test), num_of_points, ...
                                    lambda,mu );
        errors_strong(i_test,1)=mean(abs(numerical_sol-exact_sol));
        errors_weak(i_test,1)=abs(mean(numerical_sol)-mean(exact_sol));
    end
end

