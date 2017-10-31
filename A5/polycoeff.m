nmax =11
; % max polynomial index n

syms x
p = 0*x; % define p_0

for n=1:nmax-1
    
    p =x*p^2+1 % define p_{n+1}
    a = sym2poly(p) % calculate coefficients of p_{n+1}
    r = roots(a);

    % Plot the roots in the complex plane
plot(real(r),imag(r),'*');
axis([-70 70 -70 70]);
title(['Roots in the complex plane of a poly. of deg. n=' num2str(n)],'fontsize',14);
xlabel('Real axis','fontsize',14);
ylabel('Imaginary axis','fontsize',14);
pause;


end






