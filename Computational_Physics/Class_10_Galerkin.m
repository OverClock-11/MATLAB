%Galerkin方法求解常微分方程边值问题
clear,clc;
a = 1;
b = 2;
n = 5;
A = zeros(n,n);
d = zeros(n,1);

h = 0.01;
x = a:h:b;
N = size(x,2);

for i = 1:n
    for j = i:n
        I = h/2*(alpha(a,i,j,a,b)+alpha(b,i,j,a,b));
        for k=2:N-1
            I = I + 2*alpha(x(k),i,j,a,b)*h/2;
        end
        A(i,j) = I;
        A(j,i) = I;
    end
end

for i = 1:n
    I = h/2*(beta(a,i,a,b)+beta(b,i,a,b));
    for k=2:N-1
        I = I + 2*beta(x(k),i,a,b)*h/2;
    end
    d(i,1) = I;
end

c = A\d;

y = zeros(1,N);
for i =1:N
    for k = 1:n
        y(i) = y(i) + c(k,1)*phi(x(i),k,a,b);
    end
end
plot(x, y, 'o');
hold on

e = exp(1);
yy = -(1-2*e)/(e-e^3).*exp(x)-e^2*(e-2)/(e^2-1).*exp(-x)+x;
plot(x,yy);
hold off
 
function z = alpha(x, i, j, a, b)
    z = p(x)*dphi(x,i,a,b)*dphi(x,j,a,b) + q(x)*phi(x,i,a,b)*phi(x,j,a,b);
end

function z = beta(x, k, a, b)
    z = f(x)*phi(x,k,a,b);
end

function z = phi(x, k, a, b)
    z = (b-x)*(x-a)^k;
end

function z = dphi(x, k, a, b)
    z = k*(b-x)*(x-a)^(k-1) - (x-a)^k;
end

function z = p(x)
    z = 1;
end

function z = q(x)
    z = 1;
end

function z = f(x)
    z = x;
end