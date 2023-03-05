%牛顿迭代法求解非线性方程组*
clear, clc

eps = 1e-5;
err = 10;
x = [0.1 0.1 -0.1]';


while err > eps
    y = g(x);
    err = norm(y - x);
    x = y;
end
fprintf('方程组的解为:\n x1= %.4f\n x2= %.4f\n x3= %.4f\n',x(1),x(2),x(3))

function y = g(x)           %迭代函数
    y = x - J(x)\F(x);
end

function m = J(x)           %Jacobi矩阵
    m = [3 -x(3)*sin(x(2)*x(3))/3 -x(2)*sin(x(2)*x(3))/3; 
    2*x(1) -162*(x(2) + 0.1) cos(x(3));
    -x(2)*exp(-x(1)*x(2)) -x(1)*exp(-x(1)*x(2)) 20];
end

function n = F(x)           %原函数
    n = [3*x(1) - cos(x(2)*x(3)) - 1/2;
    x(1)^2 - 81*(x(2) + 0.1)^2 + sin(x(3)) + 1.06;
    exp(-x(1)*x(2)) + 20*x(3) + (10*pi - 3)/3];
end
