clc;clear all;close all;
%%
number_of_accepted_samples=0;
lambda=1;

% X=exprnd(1,1,N);
% U=rand(N,1);

% Q=100;
Q=1;
p = @(x) 1/sqrt(2*pi).*exp(-(x).^2./2).*Q;
q_hat = @(x) lambda.*exp(-lambda.*x);
q= @(x) q_hat(x)*Q;


number_of_rejected=0;

% accept reject method:
X_transformed=[];
while number_of_accepted_samples<5000
	U=rand();X=exprnd(1);
    sign=rand();

    if(U<= p(X)/q(X))
        if(sign<0.5)
            X_transformed=[X_transformed X];
        else
            X_transformed=[X_transformed -X];
        end
%         disp('accept');
        number_of_accepted_samples = number_of_accepted_samples +1;
    else
%         disp('reject');
        number_of_rejected=number_of_rejected+1;
    end
end

disp(['number of rejected:' num2str(number_of_rejected)]);

figure(2);clf;
histogram(X_transformed);hold all;
plot(linspace(-2,2,100),p(linspace(-2,2,100)*2.5))