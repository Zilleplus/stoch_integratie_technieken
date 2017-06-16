f = @(x)  1./(1+x.^2);
g = @(x)  1- x./2;
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

figure(1);clf;
subplot(2,2,1);
plot(F+G);title('average');
subplot(2,2,2);
plot(var);title('variance');
subplot(2,1,2);
plot(F+G-(pi/4));title('error');

% What do you notice about the variance:
% - The variance is much lower with control variable then without control
% variable, which obviously will results in an fast more accurate solution
%%
figure(2);clf;
x=linspace(0,1,200);
fun=@(x) f(x) - g(x);
disp([' variance f(x)- g(x):' num2str(integral(fun,0,1))]);
disp([' variance f(x) :' num2str(integral(f,0,1))]);

plot(x,f(x)-g(x)); hold all;
plot(x,(integral(fun,0,1))*ones(1,size(x,2)));

legend(['f(x) - g(x)' 'variance f(x)-g(x)']);

% The variance is reduced from 0.79 to 0.035, this is a sginificant amount
% and the monte carlo will give much more accurate results
