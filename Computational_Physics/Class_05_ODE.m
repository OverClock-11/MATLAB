%Runge-Kutta法解微分方程组（野兔和狐狸数量问题）
clear, clc
h = 0.1;
x = 0:h:15;
N = size(x,2);
y = zeros(N,2);
y(1,:) = [20 20];


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


function z = f(x,y)
    z = zeros(1,2);
    z(1) = y(1) - 0.01*y(1)*y(2);
    z(2) = -y(2) + 0.02*y(1)*y(2);
end
