%隐式欧拉法

function z = ImplicitEuler(x,y,N,h)
    for i = 2:N         %euler
        y(i) = Newton(y(i - 1), h, x(i));
    end
    z = y;
end