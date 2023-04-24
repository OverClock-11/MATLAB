%基函数
clear, clc;
a = 1;
b = 2;
N = 8;
h = 0.001;

x = a:h:b;
n = size(x, 2);
Sep = linspace(a, b, N);
H = (b - a)/(N - 1);

hold on
for i = 1:N
    for j = 1:n
        y(j) = phi(x(j), Sep(i), H);
    end
    plot(x, y)
end

ylim([0 1.5]);
grid on
title("Element Function")
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
