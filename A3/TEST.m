
% MACM316 - Computing Assignment 3 part b)
% Run your algorithm for k = 5,10,15,...,150
% use the tic and toc commands (recall the in-class demo TicToc.m) 
% to plot the computational time versus k.
load('CA3matrix.mat');
k = 5:5:150;
times = 1:length(k);
for j=1:length(k)
    j
    tic;
    matrix = eye(size(A));
    expAk = zeros(500,500);
    
    for i=1:k(j)
        i
        expAk = expAk + matrix;
        matrix = (A*matrix)/i;
    end
    times(j) = toc;
end

plot(k,times)
xlabel('k');
ylabel('Computational Time');
title('Computational Time VS k');
grid on;