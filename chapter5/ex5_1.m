clc;clear all;close all;
betas=[1 10 20];
%% Euler
method='euler';
for i=1:length(betas)
    [X,num_of_accepted] = ex5_1_simulate(betas(i),method,i);
end
%% Brownian
method='brown';
for i=1:length(betas)
    [X,num_of_accepted] = ex5_1_simulate(betas(i),method,i);
end

