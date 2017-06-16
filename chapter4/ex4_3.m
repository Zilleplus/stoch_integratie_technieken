scale=1;

f = @(x)  1./(1+x.^2);
g = @(x)  scale.*(1- x./2);
G=integral(g,0,1);

N_start=1;
max_iter=70;

N=N_start;

F_hat=0;
var_hat=0;
F=[];
var=[];
path=[];
while N<max_iter
    X=rand(); path=[path X];
    delta_N = (f(X)-g(X)) - F_hat;
    
    F_hat=F_hat+delta_N/N;
    var_hat = var_hat +delta_N*((f(X)-g(X)) - F_hat);
    
    N=N+1;
    
    % save intermediate results to create figure
    F=[F F_hat];
    var=[var var_hat/(N-1)];
end

figure(1);clf;
subplot(2,2,1);
plot(F+G);title('average');
subplot(2,2,2);
plot(var);title('variance');
subplot(2,1,2);
plot(F+G-(pi/4));title('error');

figure(2);clf;
title('histogram');
histogram(path,10); % not sure why we need this, this is obviously uniform 
% or at least close it if the matlab function rand() works as it should

% conclussion: If g(x) is wrongly scaled then the variance will go up
% again, as the function g(x) should approximate as good as possible f(x)
