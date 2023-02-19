%获取数据
h = 1.054e-34;  %约化普朗克常数
% m = input('请输入粒子质量:');
% if m >= 1
%     m = m*1.783e-30;
% end
m = 9.109e-31;  %电子质量
%m = 1.672e-27;  %质子质量
%m = 1.883e-028;  %mu子质量
%m = 2.489e-028;  %pi+子质量
a = 1;  %delta函数位置
%E = 0.441;  %共振态能量
E = 0.441;
k = sqrt(2*m*E)/h;
kk = 1i*h^2*k;
ep = exp(2*1i*k*a);
em = exp(-2*1i*k*a);

%泛定方程的系数
A = 2*m/(kk-2*m)*em+m/kk*(ep-em);
B = kk/(kk-2*m)-m/kk;
C = m/kk*ep;
D = kk/(2*m-kk);

%波函数
x1 = -5:0.01:-1*a;
x2 = -1*a:0.01:a;
x3 = a:0.01:5;
x = [x1 x2 x3];
y1 = exp(1i*k.*x1)+A*exp(-1i*k.*x1);  %x < -a
y2 = B*exp(1i*k.*x2)+C*exp(-1i*k.*x2);  %-a < x < a
y3 = D*exp(1i*k.*x3);  %a < x
y11 = exp(1i*k.*x1);
y12 = A*exp(-1i*k.*x1);
y21 = B*exp(1i*k.*x2);

%画图
hold on
grid on
te = ['m = ' num2str(m) '   ' 'E = ' num2str(E) '   ' 'a = ' num2str(a)];  %标题
title(te)
%ylim([-2.5e19 2.5e19])
set(gca,'XAxisLocation','origin');  %x轴移到y=0处
set(gca,'YAxisLocation','origin');  %y轴移到x=0处
% plot(x1,y1)
% plot(x2,y2)
% plot(x3,y3)
plot(x1,y12)
%plot(x1,y11,x2,y21,x3,y3)

