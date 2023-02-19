clear
t = 1/30:1/30:14/30;
h = [11.86 15.67 20.60 26.69 33.71 41.93 51.13 61.49 72.90 85.44 99.08 113.77 129.54 146.48];
[p,S]=polyfit(t,h,2);
scatter(t,-h)
hold on
y = p(1)*t.^2+p(2)*t+p(3);
plot(t,-y,'r')

%%%多元非线性回归
T=[ones(14,1) t' (t.^2)'];
[b,bint,r,rint,stats]=regress(h',T);
y2 = b(1)+b(2)*t+b(3)*t.^2;
plot(t,-y2,'b')

