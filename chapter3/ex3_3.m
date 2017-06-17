mu=1;lambda=-1;
delta_t=10^-3;
num_of_points=2000;
num_of_sim=10000;

% simulate to get an idea of what we are working with
[ numerical_sol ] = ex3_3_simulate( init_position,...
                                            delta_t, num_of_points, ...
                                            lambda,mu ...
                                       );
figure(1);clf;plot(numerical_sol);

% simulate a whole bunch of times
numerical_sol_all=zeros(num_of_sim,num_of_points);
for i=1:num_of_sim
    init_position=rand(1)*2+1;
    [ numerical_sol_all(i,:) ] = ex3_3_simulate( init_position,...
                                            delta_t, num_of_points, ...
                                            lambda,mu ...
                                    );
end

average=zeros(num_of_points,1);
variance=zeros(num_of_points,1);
for i=1:num_of_points
    average(i,1)=mean(numerical_sol_all(:,i));
    variance(i,1)=var(numerical_sol_all(:,i));
end
figure(2);clf;
subplot(2,1,1);
semilogy(average); 
title('average');
xlabel('time');

subplot(2,1,2);
semilogy(variance);
title([' variance, the theoretical variance=' num2str(mu^2/(2*abs(lambda) - lambda^2*delta_t))]);
xlabel('time');

figure(3);clf;
subplot(2,2,1);hist(numerical_sol_all(:,250));title('samples at 250');
subplot(2,2,2);hist(numerical_sol_all(:,500));title('samples at 500');
subplot(2,2,3);hist(numerical_sol_all(:,750));title('samples at 750');
subplot(2,2,4);hist(numerical_sol_all(:,1000));title('samples at 1000');

%% get the variance and mean for different delta t