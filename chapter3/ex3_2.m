% stability of geometric Brownian motion (3.41)
num_of_points=500; 
figure(1);clf;
init_position=1;

%% SDE and discretization are mean square stable
lambda=-10^4;
mu=1;

delta_t=10^-5;

ex3_2_check_stabilities(lambda,mu,delta_t);


[ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                        delta_t, num_of_points, ...
                                        lambda,mu ...
                                    );
subplot(2,2,1);
plot([0:num_of_points-1]*delta_t,numerical_sol);hold all;
plot([0:num_of_points-1]*delta_t,exact_sol);
title('SDE:mean square  Discretization:mean square');
disp('----------');

%% SDE is mean square stable and discretization is only asymptotic stable

lambda=-10^4;
mu=1;

% change the delta_t as this will not change the stabilty for the SDE
delta_t=2*10^-4;

ex3_2_check_stabilities(lambda,mu,delta_t);


[ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                        delta_t, num_of_points, ...
                                        lambda,mu ...
                                    );
subplot(2,2,2);
plot([0:num_of_points-1]*delta_t,numerical_sol);hold all;
plot([0:num_of_points-1]*delta_t,exact_sol);
title(' SDE:mean square Discretization:asymptotic');
disp('----------');

%% SDE and discretization are only asymptotic stable

% determine the lambda and mu so that the SDE is only asymptotic
lambda=1;
mu=-2;

% change the delta_t as this will not change the stabilty for the SDE
delta_t=10^-4;

ex3_2_check_stabilities(lambda,mu,delta_t);


[ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                        delta_t, num_of_points, ...
                                        lambda,mu ...
                                    );
subplot(2,2,3);
plot([0:num_of_points-1]*delta_t,numerical_sol);hold all;
plot([0:num_of_points-1]*delta_t,exact_sol);
title(' SDE:asymptotic  Discretization:asymptotic ');
disp('----------');

%% SDE is  mean square stable and discretization is unstable

lambda=-10^4;
mu=1;

% change the delta_t as this will not change the stabilty for the SDE
delta_t=3*10^-4;

ex3_2_check_stabilities(lambda,mu,delta_t);


[ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                        delta_t, num_of_points, ...
                                        lambda,mu ...
                                    );
subplot(2,2,4);
plot([0:num_of_points-1]*delta_t,numerical_sol); hold all;
plot([0:num_of_points-1]*delta_t,exact_sol);
title('SDE:stable Discretization:unstable');
disp('----------');
