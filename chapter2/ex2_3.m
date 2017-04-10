num_of_steps=200;
num_of_experiments=5;

figure(1);clf;
for i=1:num_of_experiments
    [ W,t ] = ex2_3_simulate( num_of_steps );
    plot(t,W);hold all;
end