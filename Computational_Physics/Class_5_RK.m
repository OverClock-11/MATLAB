%Runge-Kutta法例子
clear, clc
h = 0.1;
x = 0:h:20;
N = size(x,2);
y1 = zeros(N,2);
y1(1,:) = [50/180*pi 0];
y2 = y1;


for i = 1:N - 1     %Runge-Kutta
    k1 = f1(x(i), y1(i,:));
    k2 = f1(x(i) + h/2, y1(i,:) + h*k1/2);
    k3 = f1(x(i) + h/2, y1(i,:) + h*k2/2);
    k4 = f1(x(i) + h, y1(i,:) + h*k3);
    y1(i + 1,:) =y1(i,:) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

for i = 1:N - 1     %Runge-Kutta
    k1 = f2(x(i), y2(i,:));
    k2 = f2(x(i) + h/2, y2(i,:) + h*k1/2);
    k3 = f2(x(i) + h/2, y2(i,:) + h*k2/2);
    k4 = f2(x(i) + h, y2(i,:) + h*k3);
    y2(i + 1,:) =y2(i,:) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

hold on
plot(x,y1(:,1))
plot(x,y2(:,1))
legend("$\theta''+\mathrm{sin}(\theta)=0$","$\theta''+\theta=0$","Interpreter","latex")
grid on

function z = f1(x,y)
    z = zeros(1,2);
    z(1) = y(2);
    z(2) = -sin(y(1));
end

function z = f2(x,y)
    z = zeros(1,2);
    z(1) = y(2);
    z(2) = -y(1);
end


