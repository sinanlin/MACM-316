

clear all;

%the true value of e 

exp(1)


kvalues = [1 : 29];
err = []; % Initialize an error array



%the approximation 

for i = kvalues
    
    n = 2^i 
    n
    e_approximation = (1 + 1 / n ) ^ n;
    
    
    approximation_err =  abs( exp(1) -  e_approximation); 
    
     err(i) = approximation_err; % Update the error array
end



%plot the error versus increase value of n 


semilogy(kvalues,err)
xlabel('K','fontsize',16)
ylabel('Relative Error','fontsize',16)
set(gca,'FontSize',14)
title('Relative Error with Increment of n=2^k');