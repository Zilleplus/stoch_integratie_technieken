clc;clear all;close all;
N=5000;
X=rand(N,1);
lambda=1;

% This is with gaussian:
% X=sqrt(2).*erfinv(X.*2 -1);
% p_x_samples=linspace(-4,4,100);
% p_x=1/sqrt(2*pi).*exp(-(p_x_samples).^2./2);

% This is with exponential
X=-lambda^-1*log(X);
p_x_samples=linspace(0,4,100);
p_x=lambda*exp(-lambda*p_x_samples);

figure;
histogram(X);hold all;
plot(p_x_samples,p_x.*1000)