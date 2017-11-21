  

fun = @(x) (cos((x.^(-1).*log(x)))) ./ x;

integral(fun,0,1)


function y = Q(n)
    %Define the function to be integrated
    fun = @(x) (cos((x.^(-1).*log(x)))) ./ x;

    %Subdivision scheme of a(i) 
    for i = 1:n
    b = fzero(@(x) x*exp(x) - (i - 1/2)*pi,0);
    a(i) = exp(-b);
    end
    
    
    %Calculate I(i) 
    I_i = zeros(n,1);
    
    Q(n) = integral(fun,a(1),1);
    
    for i = 1:n-1
    Q(n) = Q(n) + integral(fun,a(i+1),a(i));
    end
    
end


function y = Q(n)
    %Q_N = SUM OF I(i). 
    y = sum(I(n));
end


function k = I(n)
    %Define the function to be integrated
    fun = @(x) (cos((x.^(-1).*log(x)))) ./ x;
    
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
     k =  I_i
    end
end