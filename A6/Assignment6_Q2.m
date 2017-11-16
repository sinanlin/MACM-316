clear all 
load('dataset.mat')

beta_hat = [0.588195649985498;0.0898137677128903;-0.158400417147461]

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




X = test_set(: , [1 2])

y = test_set(: , 3);


A = [ ones(400,1) X];

beta_hat = A\y;

RSS = abs(y-A*beta_hat);
RSS_SUM = 0;
for i = 1:400
    RSS_SUM = RSS_SUM + RSS(i)^2 ;
end

RSS_SUM


x1 = -6:10;
 x2 = (1/2 - (beta_hat(1) + beta_hat(2)* x1)) /  beta_hat(3);
 
 
 
for i = 1:400 
    if y(i) == 0
       hold on 
       scatter(getcolumn(test_set(i,1:2),1),getcolumn(test_set(i,1:2),2),'.r')
       grid on
    else
        hold on
        scatter(getcolumn(test_set(i,1:2),1),getcolumn(test_set(i,1:2),2),'.b')
        grid on
    end
end


%Plot the require equation. 
plot(x1,x2,'*')

axis([-6 10 -8 6]);
title(['Testing Data Set' ],'fontsize',14);
