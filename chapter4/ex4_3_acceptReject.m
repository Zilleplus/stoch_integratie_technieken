function [ randomSamples ] = ex4_3_acceptReject( numberOfSamplesNeeded )
q = @(x) 1;
p = @(x)  1- x/2;
% q is allrdy smllr then q :-)

randomSamples=[];
while(numberOfSamplesNeeded>0)
    X=rand();
    U=rand();
    if(U<=p(X)/q(X))
        % accept
        numberOfSamplesNeeded = numberOfSamplesNeeded -1;
        randomSamples=[randomSamples X];
    else
        %reject
    end
end

end