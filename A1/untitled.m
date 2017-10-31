

clear all;

%the true value of e 

exp(1)


xvalues = [1 : 10000000: 10^9];
err = []; % Initialize an error array

k = 0; 

%the approximation 

for n = xvalues
    k=k+1;
    
    e_approximation = (1 + 1 / n ) ^ n;
    
    
    approximation_err =  abs( exp(1) -  e_approximation); 
    
     err(k) = approximation_err; % Update the error array
end



%plot the error versus increase value of n 


semilogy(xvalues,err)
xlabel('X','fontsize',16)
ylabel('Ralative Error','fontsize',16)
set(gca,'FontSize',14)
title('Relative Error with Equal Increment of X');