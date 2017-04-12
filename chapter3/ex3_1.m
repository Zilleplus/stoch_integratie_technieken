% numerical simulation of geometric Brownian motion
delta_t=1/2^8;
num_of_points=ceil(1/delta_t);
init_position=1;
lambda=2;
mu=1;

figure(1);clf;
%% simple simulation
subplot(2,2,1);
[ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,delta_t, ...
    num_of_points,lambda,mu );
plot([0:num_of_points-1]*delta_t,numerical_sol);hold all;
plot([0:num_of_points-1]*delta_t,exact_sol);hold all;
legend('numerical','exact with same B-path');


%% simple simulation
buffer=zeros(num_of_points,1);
subplot(2,2,2);
num_of_sim=7;
for i=1:num_of_sim
    [ numerical_sol2,exact_sol2 ] = ex3_1_simulate( init_position,delta_t, ...
        num_of_points,lambda,mu );
    buffer = buffer + numerical_sol2;
    plot([0:num_of_points-1]*delta_t,numerical_sol2);hold all;
end
buffer=buffer./num_of_sim;
plot([0:num_of_points-1]*delta_t,buffer,'*');

%% weak order tests
[ errors_weak,errors_strong,delta_ts ] = ex3_1_orderTest(  );
% disp(errors_weak-errors_strong);
figure(1);
subplot(2,2,3);
semilogy(delta_ts,errors_weak);
title('weak order');
subplot(2,2,4);
semilogy(delta_ts,errors_strong);
title('strong order');