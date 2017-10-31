%Assigment 3. Computing the exponential of a matrix

clear all;

expAk = zeros(500,500); %This loads the matrix as a 500  500 array A.
load('CA3matrix.mat');
I = eye(500,500);
expAk = expAk + I ;



%{
Question 2 .
time = zeros(30,1);
k = 5:5:150

j= 1
for i = k
   tic

   expAk = expAk + (A^i) / factorial(i);
   time(j) = toc 
   j=j+1
end





Correction of time by adding the previous entry 
for i = 2: 30 
    i
    time(i) = time(i) + time(i-1)
end


%Problem: you should add in all the computation time. Seperate them if
neceessary.




plot(k,time)
xlabel('k');
ylabel('Computational Time');
title('Computational Time VS k');
grid on;
%} 


%Question 3
k = 5:5:150

err = [] %Initialize array 

expA = expm(A); %Calculate the exp using Matlab built-in funciton. 

for i = k
 
   expAk = expAk + (A^i) / factorial(i);
   err(i/5) = norm(expA - expAk)
end

semilogy(k,err)
xlabel('k','fontsize',16)
ylabel('Ralative Error','fontsize',16)
set(gca,'FontSize',14)
title('Relative Error with Increment of k');

