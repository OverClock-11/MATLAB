% Logistic 分布函数
clear, clc
H = 1;
k = 1;
x0 = 0;
sigf = @(x)(k*exp(-k*(x-x0))./(1+exp(-k*(x-x0))).^2);
sigF = @(x)(H./(1+exp(-k*(x-x0))));
x = -6:0.1:6;

hold on
plot(x, sigF(x))
plot(x, sigf(x))
set(gca,'YAxisLocation','origin');  %y轴移到x=0处
grid on
box on
title("Logistic Distribution")
text(1.7,0.65,"$F(x)=\frac{H}{1+e^{-k(x-x_0)}}$","Interpreter","latex","FontSize",12)
text(1.7,0.5,"$f(x)=\frac{ke^{-k(x-x_0)}}{(1+e^{-k(x-x_0)})^2}$","Interpreter","latex","FontSize",12)
%text(1.7,0.35,['$H=' num2str(H) ',k=' num2str(k) ',x_0=' num2str(x0) '$'],"Interpreter","latex","FontSize",12)
legend("$F(x)$","$f(x)$","Interpreter","latex")
legend("Position",[0.63734,0.71937,0.25357,0.045238])