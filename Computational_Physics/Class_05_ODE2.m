%Runge-Kutta法解高阶微分方程
clear, clc
h = 0.05;
x = 0:h:0.8;
N = size(x,2);
y = zeros(N,2);
y(1,:) = [-0.4 -0.6];
y2 = y;


for i = 1:N - 1     %Runge-Kutta
    k1 = f(x(i), y(i,:));
    k2 = f(x(i) + h/2, y(i,:) + h*k1/2);
    k3 = f(x(i) + h/2, y(i,:) + h*k2/2);
    k4 = f(x(i) + h, y(i,:) + h*k3);
    y(i + 1,:) =y(i,:) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

hold on
plot(x,y(:,1))
plot(x,y(:,2))
grid on
hold off

function z = f(x,y)
    z = zeros(1,2);
    z(1) = y(2);
    z(2) = exp(2*x)*sin(x) + 2*y(2) - 2*y(1);
end


