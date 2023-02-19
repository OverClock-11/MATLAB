x = 75:87;
y = [640,645,660,661,673,688,696,710,726,727,740,742,757];
sz = 50;
scatter(x,y,sz,'b','filled')
title('比萨斜塔','Fontsize',15,'Color','r')
set(gca,'xtick',75:1:87)
set(gca,'XTickLabel',{'75','76','77','78','79','80','81','82','83','84','85','86','87'})
mx = mean(x);
my = mean(y);
n = length(x);
sx = sqrt(sum((x-mx).^2)/(n-1));
sy = sqrt(sum((y-my).^2)/(n-1));
r = 1/(n-1)*sum(((x-mx)/sx).*((y-my)/sy));
a = r*sy/sx;
b = my-a*mx;
predict_y = a*x+b;
hold on
grid on
plot(x,predict_y,'r')
fprintf('预测88年倾斜值为：%.2f\n',a*88+b)

%最小二乘法最简单的实现方式
X = [ones(n,1),x'];
Y = y';
b2 = X\Y;
w = inv(X'*X)*X'*Y;