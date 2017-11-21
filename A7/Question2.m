clear all
format long


%Numerical integration of an unpleasant function. 
n= 20





Q_N = Q(n) 


%Aitken's method
Q_hat_N = Q_hat(n)



function k = I(n)
    %Define the function to be integrated
    fun = @(x) (cos((x.^(-n).*log(x)))) ./ x;
    
    %Subdivision scheme of a(i) 
    for i = 1:n
    b = fzero(@(x) x*exp(x) - (i - 1/2)*pi,0);
    a(i) = exp(-b);
    end

    %Calculate I(i) 
    I_i = zeros(n,1);
    I_i(1) = integral(fun,a(1),1);
    for i = 1:n-1
    I_i(i+1) = integral(fun,a(i+1),a(i));
     k =  I_i;
    end
end


function y = Q(n)
    %Q_N = SUM OF I(i). 
    y = sum(I(n));
end



%Aitken's method
function A = Q_hat(n) 
    A = Q(n) -   (((Q(n+1) - Q(n)).^2)/(Q(n+2)-2*Q(n+1) + Q(n)));
end





