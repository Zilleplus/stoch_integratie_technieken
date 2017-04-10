clear all;clc;
%%
lambda=100; % parameter, the rate of changing option
num_of_steps=100;
num_of_agents=5;
initial_amount_of_product=100;
delta_t=0.1;

% parameters used in random moment to buy
average_opinion_change=0;
variance_opinion_change=0.4;

% numerical simulation
states=zeros(num_of_agents,num_of_steps);
states(:,1)=rand(num_of_agents,1)*2-1; % set the intial state

t=zeros(num_of_steps,1);
product_history=zeros(num_of_steps,1);
product_history(1)=initial_amount_of_product;

i_step=2;
t_last_stop=0;
while i_step<=num_of_steps
    % assumed nothing will happen and copy over the states and product
    product_history(i_step)=product_history(i_step-1);
    states(:,i_step)=states(:,i_step-1);
    
    % find the next time a random opinion change will accur?
    alpha=lambda*num_of_agents;
    tau = - 1/(alpha)*log(rand());
    
    % check if the opinion change is before the next checkpoint
    while (t(i_step-1)+tau>t_last_stop+delta_t)
        for i_agent=1:num_of_agents
            % pick M random agents and take the average
            buffer=0;M=0;
            for i_agent_picked=1:num_of_agents
                if(rand()>0.5)
                    buffer=states(i_agent_picked,i_step-1);
                    M=M+1;
                end
            end
            average_op=buffer/M;
            % adjust own opinion
            states(i_agent,i_step)=0.5*(average_op+states(i_agent,i_step));
        end
        
        % reset all the parameters
        t(i_step)=t_last_stop+delta_t;
        i_step=i_step+1;
        product_history(i_step)=product_history(i_step-1);
        states(:,i_step)=states(:,i_step-1);
        t_last_stop=t_last_stop+delta_t;
        
    end   
    
    % execute the random opinion change
    t(i_step) = t(i_step-1)+tau;
    id_agent_changing_opinion=ceil(rand()*num_of_agents); % who will change?
    
    % execute the opinion change
    state_change=randn()*variance_opinion_change+average_opinion_change;
    % disp(['changing agent:' num2str(id_agent_changing_opinion) ' with ' num2str(state_change)])
    
    states(id_agent_changing_opinion,i_step) = ...
        states(id_agent_changing_opinion,i_step) + state_change;
    
    % did the opinion change result in a buy or sell?
    if(states(id_agent_changing_opinion,i_step)>1)
        % buy
        % disp('buying');
        product_history(i_step) = product_history(i_step)-1;
        states(id_agent_changing_opinion,i_step)= 0;
    end
    if(states(id_agent_changing_opinion,i_step)<-1)
        % sell
        % disp('selling');
        states(id_agent_changing_opinion,i_step)= 0;
        product_history(i_step) = product_history(i_step)+1;
    end
    i_step=i_step+1;
end

figure(1);clf;
subplot(2,1,1);
plot(t,product_history);
subplot(2,1,2);
plot(t,states(1,:));
