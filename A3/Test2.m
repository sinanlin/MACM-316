% MACM316 - Computing Assignment 3 part a)
% Let k = 50 and k = 150. Run your algorithm to get the output
% which you should call expAk
% Plot the result

load('CA3matrix.mat');
%{
k = 50;
matrix = eye(size(A));% creates the identity matrix
expAk = zeros(500,500);% initialize expAk the result matrix with zeros
for i=1:k
    i
    expAk = expAk + matrix;
    matrix = (A*matrix)/i;
end
imagesc(real(expAk));
colormap gray
title('matrix A with summation of first 50 terms of the series')
%}

k = 150;
matrix = eye(size(A));% creates the identity matrix
expAk = zeros(500,500);% initialize expAk the result matrix with zeros

for i=1:k
    i
    expAk = expAk + matrix;
    matrix = (A*matrix)/i;
end

imagesc(real(expAk));
colormap gray
title('matrix A with summation of first 150 terms of the series')