%有限元（FEM）方法解微分方程边值问题
clear, clc;
a = 1;
b = 2;
N = 10;
h = 0.01;

x = a:h:b;
n = size(x, 2);
Sep = linspace(a, b, N);
H = (b - a)/(N - 1);
yy = zeros(n, 1);
A = zeros(N, 1);
B = zeros(N, 1);
C = zeros(N, 1);
D = zeros(N, 1);
B(1) = 1;
B(end) = 1;

%设置初值
D(1) = 1; 
D(end) = 3;

%三对角矩阵直接求三个对角向量，节省时间
for i = 2:N - 1
    STA = i - 1;
    END = i + 1;
    for j = STA:END
        I = h/2*(alpha(a, Sep(i), Sep(j), H) + alpha(b, Sep(i), Sep(j), H));
        for k = 2:n - 1
            I = I + 2*alpha(x(k), Sep(i), Sep(j), H)*h/2;
        end
        if j < i
            A(i) = I;
        elseif j == i
            B(i) = I;
        else
            C(i) = I;
        end
    end
    I = h/2*(beta(a, Sep(i), H)+beta(b, Sep(i), H));
    for k=2:n-1
        I = I + 2*beta(x(k), Sep(i), H)*h/2;
    end
    D(i) = I;
end

%追赶法解系数向量
Coe = chase(A, B, C, D, N);

for i = 1:N
    for k = 1:n
        yy(k) = yy(k) + Coe(i)*phi(x(k), Sep(i), H);
    end
end

syms y(t)
cond = ['y(1) = ' num2str(D(1)) ', y(2) = ' num2str(D(end))];
s = dsolve(diff(y,t,2) == y - t,cond);          %用dsolve函数求解析解
func = matlabFunction(s);                       %符号函数转匿名函数

hold on
scatter(x, yy)
plot(x, func(x))
grid on
ylim([0 max(yy)/0.8])
legend("Numerical Solution", "Analytical Solution")
txt = ['Finite Element Method N = ' num2str(N)];
title(txt)
hold off

function z = phi(xin, center, step)
left = center - step;
right = center + step;

if (xin > left) && (xin <= center)
    z = (xin - left)/step;
elseif (xin < right) && (xin > center)
    z = (right - xin)/step;
else
    z = 0;
end
end

function z = dphi(xin, center, step)
left = center - step;
right = center + step;

if (xin > left) && (xin <= center)
    z = 1/step;
elseif (xin < right) && (xin > center)
    z = -1/step;
else
    z = 0;
end
end

function z = alpha(xin, center1, center2, step)
z = p(xin)*dphi(xin, center1, step)*dphi(xin, center2, step) + q(xin)*phi(xin, center1, step)*phi(xin, center2, step);
end

function z = beta(xin, center, step)
z = f(xin)*phi(xin, center, step);
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
