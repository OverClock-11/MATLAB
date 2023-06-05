%有限差分法BTCS格式解偏微分方程u(t,x)
clear, clc
dt = 0.001;
dx = 0.02;
x = 0:dx:1;
t = 0:dt:0.1;
I = size(x, 2);
K = size(t, 2);

u = zeros(I, K);
u(I, :) = 100;
kappa = 0.835;
r = kappa*dt/dx^2;

a = -r*ones(1, I - 2);
a(1) = 0;
b = (1 + 2*r)*ones(1, I - 2);
c = -r*ones(1, I - 2);
c(I - 2) = 0;
eps = 1e-5;
err = 10;

while (err > eps)
    u1 = u;
    for k = 2:1:K
        d = zeros(1, I - 2);
        d(1) = u(2, k - 1) + r*u(1, k);
        d(I - 2) = u(I - 1, k - 1) + r*u(I, k);
        d(2:I - 3) = u(3:I - 2, k - 1)';
        T = chase(a, b, c, d, I - 2);
        u(2:I - 1, k) = T';
    end
    err = norm(u - u1, 1);
end
heatmap(u,'GridVisible','off');

function x = chase(a,b,c,d,n)
    w = zeros(1, n);
    g = zeros(1, n);
    
    w(1) = c(1)/b(1);
    g(1) = d(1)/b(1);
    
    for i=2:n
        w(i) = c(i)/(b(i)-a(i)*w(i-1));
        g(i) = (d(i)-a(i)*g(i-1))/(b(i)-a(i)*w(i-1));
    end
    
    x = zeros(1,n);
    x(n) = g(n);
    for i = n-1:-1:1
        x(i) = g(i)-w(i)*x(i+1);
    end
end
