f = @(x)  1/(1+x.^2);
g = @(x)  1- x/2;
G=0.75; % int(1-x/2,0,1)=0.75 wolfram alpha

N_start=1;
max_iter=70;

N=N_start;

F_hat=0;
var_hat=0;
F=[];
var=[];
while N<max_iter
    X=rand();
    delta_N = (f(X)-g(X)) - F_hat;
    
    F_hat=F_hat+delta_N/N;
    var_hat = var_hat +delta_N*((f(X)-g(X)) - F_hat);
    
    N=N+1;
    
    % save intermediate results to create figure
    F=[F F_hat];
    var=[var var_hat/(N-1)];
end

figure;
subplot(2,2,1);
plot(F+G);title('average');
subplot(2,2,2);
plot(var);title('variance');
subplot(2,1,2);
plot(F-(pi/4));title('error');