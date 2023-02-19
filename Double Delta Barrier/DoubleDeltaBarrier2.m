%获取数据
%E = 10000;
%E = 1000;
E = 10000
a = 1;
x1 = -5:0.01:-1*a;
x2 = -1*a:0.01:a;
x3 = a:0.01:5;

[~,s1] = size(x1);
[~,s2] = size(x2);
[~,s3] = size(x3);

%画图
tiledlayout(3,2,'TileSpacing','compact');

g1 = nexttile;
m = 9.109e-31;  %电子质量
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x1,Y(1,1:s1),x2,Y(2,1:s2),x3,Y(3,1:s3),'y-')
te = ['电子' 'm = ' num2str(m) '   ' 'E = ' num2str(E) '   ' 'a = ' num2str(a)];  %标题
title(g1,te)

nexttile
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x3,Y(3,1:s3),'y-')

g2 = nexttile;
m = 1.883e-028;  %mu子质量
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x1,Y(1,1:s1),x2,Y(2,1:s2),x3,Y(3,1:s3),'y-')
te = ['\mu子' 'm = ' num2str(m) '   ' 'E = ' num2str(E) '   ' 'a = ' num2str(a)];  %标题
title(g2,te)

nexttile
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x3,Y(3,1:s3),'y-')

g3 = nexttile;
m = 1.672e-27;  %质子质量
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x1,Y(1,1:s1),x2,Y(2,1:s2),x3,Y(3,1:s3),'y-')
te = ['质子' 'm = ' num2str(m) '   ' 'E = ' num2str(E) '   ' 'a = ' num2str(a)];  %标题
title(g3,te)

nexttile
Y = doubleDelta(m,E,a,x1,x2,x3);
plot(x3,Y(3,1:s3),'y-')
