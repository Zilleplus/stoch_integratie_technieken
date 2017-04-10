clc;clear all;close all;
%%
N=5000;
X=randn(N,1);
U=rand(N,1);
lambda=1;
Q=100;

q = @(x) 1/sqrt(2*pi).*exp(-(x).^2./2).*Q;
p = @(x) lambda.*exp(-lambda.*x);

figure(1);clf;
x_plot=linspace(-4,4,100);
plot(x_plot,p(x_plot));hold all;
plot(x_plot,q(x_plot));

% accept reject method:
X_transformed=[];
for i=1:N
    if(U(i)<= p(X(i))/q(X(i)))
        X_transformed=[X_transformed X(i)];
%         disp('accept');
    else
%         disp('reject');
    end
end

disp(['number of accepted:' num2str(size(X_transformed,2))]);

figure(2);clf;
histogram(X_transformed);hold all;
plot(linspace(-2,2,100),p(linspace(-2,2,100)*2.5))