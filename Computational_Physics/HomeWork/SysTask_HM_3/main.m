clear, clc
%
%-------------------初始化-------------------
h = 0.43;
%步长

x = 0:h:5;
N = size(x,2);
y = zeros(1,N);
y(1) = -5;

y1 = ImplicitEuler(x,y,N,h);                        %隐式欧拉法
y2 = ExplicitEuler(x,y,N,h);                        %显式欧拉法
y3 = Runge_Kutta(x,y,N,h);                          %Runge-Kutta法

%-----------------计算解析解-----------------
syms y(t)
s = dsolve(diff(y,t) == t*y^2 + 2*y,'y(0) = -5');   %用dsolve函数求解
f = matlabFunction(s);                              %符号函数转匿名函数

%--------------------绘图-------------------

g1 = nexttile;
hold on
grid on

plot(x,f(x),'c-')                                   %解析解
scatter(x,y1,'red')                                 %隐式欧拉法
scatter(x,y2,'yellow')                              %显式欧拉法
scatter(x,y3,'blue')                                %Runge-Kutta法
legend("解析解", "隐式欧拉法", "显式欧拉法", "Runge-Kutta法")
hold off

%------------------误差分析------------------

Ave = linspace(0.01, 0.4, 40);
i = 1;
err = zeros(3,size(Ave,2));
for h = Ave
    x = 0:h:5;
    N = size(x,2);
    y = zeros(1,N);
    y(1) = -5;
    y1 = ImplicitEuler(x,y,N,h);
    y2 = ExplicitEuler(x,y,N,h);
    y3 = Runge_Kutta(x,y,N,h);
    err(1,i) = mean((f(x) - y1).^2);
    err(2,i) = mean((f(x) - y2).^2);
    err(3,i) = mean((f(x) - y3).^2);
    i = i + 1;
end

g2 = nexttile;
hold on
grid on
plot(Ave, err(1,:),'r-')
plot(Ave, err(2,:),'y-')
plot(Ave, err(3,:),'b-')
legend("隐式欧拉法", "显式欧拉法", "Runge-Kutta法")


