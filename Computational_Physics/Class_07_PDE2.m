%有限差分法Crank–Nicolson格式解偏微分方程u(t,x)
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
A = 1/dt + kappa/dx^2;
B = kappa/(2*dx^2);
C = 1/dt - kappa/dx^2;

a = -B*ones(1, I - 2);
a(1) = 0;
b = A*ones(1, I - 2);
c = -B*ones(1, I - 2);
c(I - 2) = 0;
eps = 1e-5;
err = 10;
while (err > eps)
    u1 = u;
    for k = 1:K - 1
        d = zeros(1, I - 2);
        for i = 2:I- 1
            d(i - 1) = B*u(i + 1, k) + C*u(i, k) + B*u(i - 1, k);
        end
        d(1) = d(1) + B*u(1, k + 1);
        d(I - 2) = d(I - 2) + B*u(I, k + 1);
        T = chase(a, b, c, d, I - 2);
        u(2:I - 1, k + 1) = T';
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
