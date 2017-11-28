

%Compute the exact value for the integral 

d = 8 ;

Vol_ohm = (pi^(d/2)) /  ( (2^d) * gamma(d/2 + 1) );

nrange = 2.^(10);

TRAErr = zeros(nrange,1);

MONErr = zeros(nrange,1);

x = 1:nrange;

Index=1;

for N = 1  :  nrange ;
    
 %Trapezoidal rule
A = GeneratePoints(N,d,0);

X_sum = zeros(N,1);

F_Sum_Trap = 0;
for i = 1 : N ;

    X = zeros(d,1);
    for j = 1 : d
        X(j) = (A(j,i) - 1/2)^2 ; 
    end
    
    X_sum(i) = round(sum(X),2) ;
    
    if X_sum(i) <= 1/4
        F_Sum_Trap = F_Sum_Trap + 1;
    end  
end 

TRAErr(N) = abs( F_Sum_Trap/N - Vol_ohm);



%Monote Carlo rule
B = GeneratePoints(N,d,1);

X_sum = zeros(N,1);

F_Sum_Monte = 0;
for i = 1 : N 

    X = zeros(d,1);
    for j = 1 : d
        X(j) = (B(j,i) - 1/2)^2 ; 
    end
    
    X_sum(i) = round(sum(X),2) ;
    
    if X_sum(i) <= 1/4
        F_Sum_Monte = F_Sum_Monte + 1;
    end  
end 

F_Sum_Monte/N;

MONErr(N) = abs( F_Sum_Monte/N - Vol_ohm);

 
 
end

hold on 
loglog(TRAErr,'r.')
loglog(MONErr,'b.')
title('Errors for Trapezoidal and Monte Carlo when d = 8','fontsize',16);
xlabel('N','fontsize',16);
ylabel('Error','fontsize',16);
legend({'Trapezoidal','Monte Carlo','n^{-2}','n^{-4}'},'fontsize',14);


 