
nmax = 15

for n=3:nmax-1
    
    M = seqM(n) 
    r = eig(M);

    % Plot the roots in the complex plane
plot(real(r),imag(r),'*');
axis([-3 3 -3 3]);
title(['Eigenvalues of sequential matrics. of deg. n=' num2str(n)],'fontsize',14);
xlabel('Real axis','fontsize',14);
ylabel('Imaginary axis','fontsize',14);
pause;


end





%Define a function to calculate the sequence matrix. 

function SM = seqM(V) 
n =2;
M = [-1] 

while n < V
    dn = (2^(n-1))-1 
    cn = [1;zeros(dn-1,1)]
    rn = [zeros(1,dn-1),1]
    M = [M , zeros(dn,1), -cn*rn;
    -rn, zeros(1,1),zeros(1,dn);
    zeros(dn,dn),-cn,M]
    n = n + 1
   
end
 SM = M
end