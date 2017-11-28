

clear all ;

Nrange = 128
x = 1:Nrange

y = zeros(1,Nrange)

for N = 1:Nrange
    d = 2;

    %mode 1 is Monte_carlo integration. 
    %mode 0 is composite trapezoidal rule. 
    mode = 1;

    A = GeneratePoints(N,d,mode)

    X_sum = zeros(N,1)



    %The integration of f(x) is the sum of of f(x^(n)) / N where f(x) = 1 when
    % x belongs to ohm, or 0 otherwise. 

    F_Sum = 0;



    for i = 1 : N 

        X = zeros(d,1);
        for j = 1 : d
            X(j) = (A(j,i) - 1/2)^2  
        end
        %Use 2 digit significant rounding here to avoid floating point issue

        X_sum(i) = round(sum(X),2) 

        if X_sum(i) <= 1/4
            F_Sum = F_Sum + 1
        end

    end

    F_Sum/N 
    Vol_ohm = (pi^(d/2)) /  ( (2^d) * gamma(d/2 + 1) )

    Err = Vol_ohm - F_Sum/N 

    %Plot the actual error in a loglog scale. Remember to average out in the
    %Monote case. 


    y(N) =  abs(Err)
end

loglog(x,y,'*')

