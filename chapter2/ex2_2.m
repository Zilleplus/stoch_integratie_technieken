clc;clear all;close all;
%% simple single simulation
% initial values:
A0=0; 
% simulation parameters:
size_of_simulations=50000;

[ A_history,t_history ] = ex2_2_simulate( A0,size_of_simulations);

figure(1);clf;
plot(t_history,A_history);

%% do several simulations and calculate the mean

% initial values:
A0=0; 
% simulation parameters:
size_of_simulations=1000;
num_of_experiments=1000;

for i_experiment=1:num_of_experiments
    [ A_history,t_history ] = ex2_2_simulate( A0,size_of_simulations);
end

% how should we take the average of this?? the time base is very different
% Should we interpolate?
