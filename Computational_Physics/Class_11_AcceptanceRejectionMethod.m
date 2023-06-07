%舍选法求任意函数的分布(x)
clear, clc
n = 100000;
h = 0.01;
x = 0:h:1;
f = @(x)(20*x.*(1 - x).^3); % 概率密度函数（PDF）
y = f(x);
ymax = max(y);
ymin = min(y);

vec = [];
for i = 1:n
    yrand = ymin + (ymax - ymin)*rand; % 逆变换法求均匀分布
    R = rand; 
    if yrand <= f(R)
        vec = [vec R]; % 小于f(x)就保存
    end
end

hold on
yyaxis left
histogram(vec,'FaceAlpha',0.2,'FaceColor','cyan')
yyaxis right
plot(x,y,'r-','LineWidth',1.5)
box on
title("Acceptance-Rejection Method")
text(0.6,0.8*ymax,"$f(x)=20x(1-x)^3$","Interpreter","latex",'FontSize',14)
legend("Distribution", "PDF")
