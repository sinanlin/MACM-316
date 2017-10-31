
% MACM 316 - GE and QR Factorization Robustness and Efficiency 
% Sinan lin

clear all;

%Maximum matrix size. 
Nmax = 300;  


%Initialize array for error;
err_GE = [];
err_QR = [];


%Initialize array for time;
time_GE = [];

time_QR = [];

mean_time_GE = [];
mean_time_QR = [];

%Trials 
trials = 50;
trial_err_GE = zeros(trials,1);
trial_err_QR = zeros(trials,1);


trial_time_GE = zeros(trials,1);
trial_time_QR = zeros(trials,1);



for i = 1: Nmax
    
    %Use trails to mitigate the randomly generated A
    for t = 1:trials 
    %Generate a n by n random matrix 
    A = randn(i);
    
    %Define the x matrix 
    
    x = ones(i , 1);
    
    %Compute the b matrix 
    
    b = A*x;
    
    %Backward substitution using GE and calculate the time 
    tic;
    xhatGE = A\b;
    trial_time_GE(t) = toc; 
    
    
    %QR Factorization 
    
    % Compute the QR factorization of A
    tic;
    [Q R] = qr(A);
     
    % Solve the linear system (note that Q' is the transpose of Q)
    % Calculate the time 
 
    xhatQR = R\(Q'*b);
    trial_time_QR(t) =  toc;
    
    %Store the error for each trail
    trial_err_GE(t) = max(abs(xhatGE-x));
    trial_err_QR(t) = max(abs(xhatQR-x));
    
    

    end 
    
    %Average out the absolute error of GE
    
    err_GE = [err_GE mean(trial_err_GE) ];
    
    %Average out absolute error of QA
    
    err_QR = [err_QR mean(trial_err_QR) ];   
        

    %Compute the mean time of GE 
    mean_time_GE = [mean_time_GE mean( trial_time_GE(t))];
    mean_time_QR = [mean_time_QR mean( trial_time_QR(t))];
    

end



% Plot the error of GE versus N
figure(1);
semilogy(err_GE,'*')
xlabel('N','fontsize',16)
ylabel('Error','fontsize',16)
set(gca,'FontSize',14)
title('Error by using GE and QR');


hold on
% Plot the error of QR versus N
semilogy(err_QR,'*')
hold off





% Plot the computational time of GE versus N
figure(2);
semilogy(mean_time_GE,'*')
xlabel('N','fontsize',16)
ylabel('Computational time','fontsize',16)
set(gca,'FontSize',14)
title('Computational time of GE and QR versus N');


hold on 
% Plot the computational time of QR versus N
semilogy(mean_time_QR,'*')
hold off












    
    