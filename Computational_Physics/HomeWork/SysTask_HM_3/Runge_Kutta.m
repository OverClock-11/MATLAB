%Runge-Kutta法


function z = Runge_Kutta(x,y,N,h)
    f = @(x,y)(x*y^2 + 2*y);
    for i = 1:N - 1     %Runge-Kutta
        k1 = f(x(i), y(i));
        k2 = f(x(i) + h/2, y(i) + h*k1/2);
        k3 = f(x(i) + h/2, y(i) + h*k2/2);
        k4 = f(x(i) + h, y(i) + h*k3);
        y(i + 1) = y(i) + h/6*(k1 + 2*k2 + 2*k3 + k4);
    end
    z = y;
end