%追赶法解方程组
clear

a = [0 -1 -1 -1 -1 -1];
b = [2 2 2 2 2 2];
c = [-1 -1 -1 -1 -1 0];

d = [1 0 1 0 0 1];

n = 6;
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

