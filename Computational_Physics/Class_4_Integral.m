% 复化梯形公式法求积分
f = @(x)(1./(1 + x.^2));
a = 0;
b = 10;
n = 100;
h = (b - a)/n;
xx = linspace(a, b, n + 1);
T = h*sum(f(xx)) - h/2*(f(b) + f(a));
fprintf('%.4f\n',T)