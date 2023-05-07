%蒙特卡洛方法解微分方程
clear, clc
a = -4;
b = 5;
h = 0.02;
x = a:h:b;
N = size(x, 2);
y = 4*ones(1, N);
K = 10000;

for i = 2:N
    sum = 0;
    for k = 1:K
        xk = x(i - 1) + (x(i) - x(i - 1))*rand();
        sum = sum + f(xk, y(i - 1));
    end
    sum = sum/K*(x(i) - x(i - 1));
    y(i) = y(i - 1) + sum;
end

plot(x,y)

function z = f(x, y)
    z = x*sqrt(abs(y)) + sin(x*pi/2)^3 - 3*Theta(x - 2);
end

function Z = Theta(x)
    if x > 0
        Z = 1;
    else
        Z = 0;
    end
end
