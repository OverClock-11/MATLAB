% Runge-Kutta法和Euler法解微分方程
clear, clc
h = 0.1;
x = 0:h:3;
N = size(x,2);
y_eu = zeros(1, N);
y_eu(1) = 0;
y_rk = y_eu;
y_rk(1) = y_eu(1);

for i = 2:N         %euler
    y_eu(i) = y_eu(i - 1) + h*f(x(i - 1), y_eu(i - 1));
end

for i = 1:N - 1     %Runge-Kutta
    k1 = f(x(i), y_rk(i));
    k2 = f(x(i) + h/2, y_rk(i) + h*k1/2);
    k3 = f(x(i) + h/2, y_rk(i) + h*k2/2);
    k4 = f(x(i) + h, y_rk(i) + h*k3);
    y_rk(i + 1) = y_rk(i) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

hold on
scatter(x,y_rk,'o')
scatter(x,y_eu,'o')
xx = 0:0.02:3;
plot(xx,xx./(1 + xx.^2))
legend('Runge-Kutta', 'Euler', 'Analytical')
grid on

function z = f(x,y)
    if abs(x) < 1e-5
        z = 1;
    else
        z = y/x - 2*y^2;
    end
end
