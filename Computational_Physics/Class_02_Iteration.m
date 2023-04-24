%Jacobi迭代法解方程组*
clear, clc

eps = 1e-5;
err = 10;
x = [0.1 0.1 -0.1];

while err > eps
    y = g(x);
    err = norm(y - x);
    x = y;
end

fprintf('方程组的解为:\n x1= %.4f\n x2= %.4f\n x3= %.4f\n',x(1),x(2),x(3))
%%
function y = g(x)
    y(1) = 1/3*cos(x(2)*x(3)) + 1/6;
    y(2) = 1/9*(x(1)^2 + sin(x(3)) + 1.06)^0.5 - 0.1;
    y(3) = -1*exp(-x(1)*x(2))/20 - (10*pi - 3)/60;
end