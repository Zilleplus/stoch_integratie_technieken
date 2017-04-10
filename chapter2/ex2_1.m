clear all;clc;

%%
alpha=0.5;beta=0.5;

% do 1 test-tun to get an idea
number_of_simulations=1000;
[ invariant_dist_eig,invariant_dist_stoch_sim ] = ...
    ex2_1_simulate( alpha,beta,number_of_simulations );

disp('invariant distribution using eigenval:');
disp(invariant_dist_eig);
disp('invariant distribution using stoch sim:');
disp(invariant_dist_stoch_sim);
%%
alphas=[0.5 0.5 0.001];
betas=[0.5 0.7 0.5];
num_sims=[ 10 50 100 150 200 500 10^3 5*10^3 10^4 ];

% compare the accuracy
results=zeros(min(size(alphas,2),size(betas,2)),size(num_sims,2));

for parameters_index=1:min(size(alphas,2),size(betas,2))
    for num_sim_index=1:size(num_sims,2)
        [ invariant_dist_eig,invariant_dist_stoch_sim ] = ...
            ex2_1_simulate( alphas(parameters_index)...
                ,betas(parameters_index),...
                num_sims(num_sim_index) );
        results(parameters_index,num_sim_index)=...
            norm(invariant_dist_eig-invariant_dist_stoch_sim);
    end
end

figure(1);clf;
semilogy(num_sims,results(1,:),num_sims,results(2,:),num_sims,results(3,:));
legend('case1: alpha=0.5 beta=0.5','case2: alpha=0.5 beta=0.7','case 3: alpha=0.001 beta=0.5');

%% print out the matrices
disp('matrix case1:');
disp(ex2_1_get_matrix_M(alphas(1),betas(1)));
disp('matrix case2:');
disp(ex2_1_get_matrix_M(alphas(2),betas(2)));
disp('matrix case3:');
disp(ex2_1_get_matrix_M(alphas(3),betas(3)));