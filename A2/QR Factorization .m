
% MACM 316 - GE and QR Factorization Robustness and Efficiency 
% Sinan lin


clear all;

Nmax = 50 ;  %Maximum matrix size. 


%Initialize array;


error = [];







for i = 1: Nmax
    %Generate a n by n random matrix 
    A = randn(i)
    
    %Define the x matrix 
    
    x = ones(i , 1)
    
    %Compute the b matrix 
    
    b = A*x;
    
    
    %Backward substitution using GE to 
    
    xhat1 = A\b;
    
   
    
    
    
    
    %Compute the relative error 
    
    err = [err max(abs(xhat1-x))/max(abs(x))];
    
    
end






    
    
    