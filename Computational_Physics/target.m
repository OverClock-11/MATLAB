% 打靶法
clear,clc;

h = 0.05;
x = 0:h:5;
N = size(x,2);

eps = 1e-5;
err = 10;
a = 10;
b = 1000;

while (err > eps)
    y = zeros(N,2);
    y(1,:) = [0,(a+b)/2];

    for i = 1:N-1
        % R-K
        k1 = f(x(i), y(i,:));
        k2 = f(x(i)+h/2,y(i,:)+h*k1/2);
        k3 = f(x(i)+h/2,y(i,:)+h*k2/2);
        k4 = f(x(i)+h,y(i,:)+h*k3);
        y(i+1,:) = y(i,:)+h/6*(k1+2*k2+2*k3+k4);

    end
    err = y(N,1) - 40;
    if err > 0
        b = (a+b)/2;
    else
        a = (a+b)/2;
    end
    err = abs(err);
end

plot(x,y(:,1));
hold on
hold off

function z = f(x,y)
        z = zeros(1,2);
        z(1) = y(2);
        z(2) = -9.8-0.01*y(2);
end