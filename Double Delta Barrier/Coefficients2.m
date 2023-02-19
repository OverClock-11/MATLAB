a = 1;
h = 1.054e-34;
m = 9.109e-31;
E = 0:0.1:1000;
k = sqrt(2*m.*E)/h;
kk = 2i*a.*k;
A1 = -1.*exp(-1.*kk).*m.*(1i*h^2.*k+1i*exp(2.*kk)*h^2.*k-m+exp(2.*kk)*m);
A2 = h^4.*k.^2 + 2i*h^2*m.*k-m^2+m^2.*exp(2.*kk);
A = A1./A2;
plot(E,A)