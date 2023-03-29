%追赶法解二阶常微分方程边值问题
clear, clc
h = 0.1;
x = 2:h:3;
N = size(x,2);

a = -1*ones(1,N);
b = 2*h^2./x.^2 + 2;
c = -1*ones(1,N);
d = h^2./x.^2;

b(1) = 1;
c(1) = 0;
d(1) = 0;
a(N) = 0;
b(N) = 1;
d(N) = 0;

y = f(a,b,c,d,N);
scatter(x,y)


function x = f(a,b,c,d,n)
    x = zeros(1,n);
    w = zeros(1,n);
    g = zeros(1,n);
    w(1) = c(1)/b(1);
    g(1) = d(1)/b(1);
    for i = 2:n
        w(i) = c(i)/(b(i) - a(i)*w(i - 1));
        g(i) = (d(i) - a(i)*g(i - 1))/(b(i) - a(i)*w(i - 1));
    end
    for i = n - 1:-1:1
        x(i) = g(i) - w(i)*x(i + 1);
    end
    x(n) = g(n);
end
