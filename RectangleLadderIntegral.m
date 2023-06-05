% 画矩形和梯形积分
clc,clear
x = 0:0.1:9;
f = @(x)(x.^3+3*x+12.3);
step = 0.5;
hold on
plot(x,f(x))
for i = 2:0.5:7.5
    rectangle('Position',[i 0 0.5 f(i+0.5)],'EdgeColor','r','LineWidth',1)
end
% box on
title("rectangle")
hold off
figure
hold on
plot(x,f(x))
step = 0.5;
for i = 2:step:8
    line([i i], [0 f(i)],'LineWidth',1,'Color','red');
end
for i = 2:step:7.5
    line([i i+step], [f(i) f(i+step)],'LineWidth',1,'Color','red');
end
title("ladder")
