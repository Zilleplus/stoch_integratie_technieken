f = @(x)  1/(1+x.^2);
N_start=1;
max_iter=100;

N=N_start;

F_hat=0;
var_hat=0;
F=[];
var=[];
while N<max_iter
    X=rand();
    delta_N = f(X) - F_hat;
    
    F_hat=F_hat+delta_N/N;
    var_hat = var_hat +delta_N*(f(X) - F_hat);
    
    N=N+1;
    
    % save intermediate results to create figure
    F=[F F_hat];
    var=[var var_hat/(N-1)];
end

figure(1);clf;
subplot(2,2,1);
plot(F);title('average');
subplot(2,2,2);
plot(var);title('variance');
subplot(2,1,2);
plot(F-(pi/4));title('error');

% how to get an estimate of the variance of IN from one approximation?????
% figure1 shows the on the fly estimation of the variance, if N is a bit
% higher then 10 then the estimation is allrdy ok.

% I dont see how you could estimate the variance if you do not use this on
% the fly algorithm
