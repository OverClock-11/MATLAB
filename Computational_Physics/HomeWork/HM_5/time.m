%比较有限元和Galerkin方法在不同N下耗时对比

%有限元（FEM）方法解微分方程边值问题
clear, clc;
K = 30;
tim = 5:K;
FEM = zeros(size(tim,2),1);
GAL = zeros(size(tim,2),1);
for N = tim
a = 1;
b = 2;
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
D(1) = 0; 
D(end) = 0;

tic
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
FEM(N - 4) = toc;
%Galerkin方法求解常微分方程边值问题
a = 1;
b = 2;
n = N;
A = zeros(n,n);
d = zeros(n,1);

h = 0.01;
x = a:h:b;
nn = size(x,2);

for i = 1:n
    for j = i:n
        I = h/2*(alpha2(a,i,j,a,b)+alpha2(b,i,j,a,b));
        for k=2:nn-1
            I = I + 2*alpha2(x(k),i,j,a,b)*h/2;
        end
        A(i,j) = I;
        A(j,i) = I;
    end
end

for i = 1:n
    I = h/2*(beta2(a,i,a,b)+beta2(b,i,a,b));
    for k=2:nn-1
        I = I + 2*beta2(x(k),i,a,b)*h/2;
    end
    d(i,1) = I;
end

c = A\d;

y = zeros(1,nn);
for i =1:nn
    for k = 1:n
        y(i) = y(i) + c(k,1)*phi2(x(i),k,a,b);
    end
end
GAL(N - 4) = toc - FEM(N - 4);
end
hold on
plot(tim, FEM)
plot(tim, GAL)
legend("FEM", "GAL")
legend("Position",[0.17735,0.7322,0.22837,0.13021])
grid on
box on
xlabel("N")
ylabel("time")






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

%---------------------------
function z = alpha2(x, i, j, a, b)
    z = p(x)*dphi2(x,i,a,b)*dphi2(x,j,a,b) + q(x)*phi2(x,i,a,b)*phi2(x,j,a,b);
end

function z = beta2(x, k, a, b)
    z = f(x)*phi2(x,k,a,b);
end

function z = phi2(x, k, a, b)
    z = (b-x)*(x-a)^k;
end

function z = dphi2(x, k, a, b)
    z = k*(b-x)*(x-a)^(k-1) - (x-a)^k;
end
