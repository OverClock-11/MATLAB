%牛顿法求方程根*
clear, clc
x = -5:0.1:5;
f = @(x)(x.^3 + 3*x + 5);
hold on
box on
grid on
plot(x,f(x))
set(gca,'XAxisLocation','origin');  %x轴移到y=0处
xx = -5:5;
set(gca,'xtick',xx);                %设置x轴刻度（和数据有关）
set(gca,'xtickLabel',xx);           %设置x轴显示的刻度（和数据无关）
g = @(x)((2*x.^3 - 5)./(3*x.^2 + 3));
eps = 1e-5;
err = 10;
n = -2;

while err > eps
    y = g(n);
    err = abs(y - n);
    n = y;
end

fprintf('该方程的解为 %.4f\n',n)