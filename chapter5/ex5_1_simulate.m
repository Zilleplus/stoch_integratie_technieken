function [ X,num_of_accepted ] = ex5_1_simulate(beta,method,figureSet)
    V = @(x) x.^4 - x.^2; % energy function
    alphas=[0.01 0.1 1]; % different values for alpha

    sim_lenght=100000;
    X=zeros(sim_lenght,1);
    
    num_of_accepted=0;
    for i_alpha=1:length(alphas)
        for i=1:sim_lenght
            % generate trial move
            if(method=='euler')
                X_trial = X(i) - alphas(i_alpha)*V( X(i))+ ...
                    sqrt((2*alphas(i_alpha))/beta)*rand;
            elseif(method=='brown')
                X_trial = X(i) + sqrt((2*alphas(i_alpha))/beta)*rand;
            else
                disp('ERROR: wrong method selected, pick "euler" or "brown"')
            end
            %
            delta_V =V(X_trial)-V(X(i));

            U=rand; % second random number
            if(U<=exp(-delta_V))
                % accept
                X(i+1)=X_trial;
                num_of_accepted = num_of_accepted +1;
            else
                % reject
                X(i+1)=X(i);
            end    
        end
        
        figure(figureSet*2-1);
        subplot(2,2,i_alpha);
        plot(X);
        title(['alpha=' num2str(alphas(i_alpha)) ' beta=' num2str(beta)]);

        figure(figureSet*2);
        subplot(2,2,i_alpha);
        hist(X,100);
        title(['alpha=' num2str(alphas(i_alpha)) ' beta=' num2str(beta)]);
        xlim([-2 2]);
        
        disp(['alpha=' num2str(alphas(i_alpha)) ' beta=' num2str(beta) ...
            ' number of accepts= ' num2str(num_of_accepted)]);
    end
end

