clear all 
load('dataset.mat')


X = training_set(: , [1 2]);

y = training_set(: , 3);

A = [ ones(2000,1) X]

beta_hat = A\y;

A*beta_hat;
% Residual sum of squares
RSS = abs(y-A*beta_hat);
RSS_SUM = 0;
for i = 1:2000
    RSS_SUM = RSS_SUM + RSS(i)^2 ;
end
RSS_SUM

% required equation

x1 = -6:10;
 x2 = (1/2 - (beta_hat(1) + beta_hat(2)* x1)) /  beta_hat(3);


% Scatter polt of the dataset. 


for i = 1:2000 
    if y(i) == 0
       hold on 
       scatter(getcolumn(training_set(i,1:2),1),getcolumn(training_set(i,1:2),2),'.r')
       grid on
    else
        hold on
        scatter(getcolumn(training_set(i,1:2),1),getcolumn(training_set(i,1:2),2),'.b')
        grid on
    end
end


%Plot the require equation. 
plot(x1,x2)

axis([-6 10 -8 6]);
title(['Training Data Set' ],'fontsize',14);


%Testing phase

z = test_set(:,3);
B = [ ones(400,1) test_set(:, [1 2]) ];

v = B * beta_hat;


%Iniciate value z to set up the legrendra polynomial 
z = zeros(400,1);

z_hat = zeros(400,1);

for j = 1:400
    if v(j) >= 1/2;
        z_hat(j) = 1;
    else
        z_hat(j) = 0;
    end
end

%Compute the error 

Err_sum = 0;

for j = 1:400
    Err_sum = Err_sum +  1/400 * abs(z(j) - z_hat(j));
end



% implement the test_dataset with the scaatter plot then calculate the
% beta_hat. The discriminiant line then can be created.

