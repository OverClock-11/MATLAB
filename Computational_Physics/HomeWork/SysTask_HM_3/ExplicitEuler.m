%显式欧拉法

function z = ExplicitEuler(x,y,N,h)
    f = @(x,y)(x*y^2 + 2*y);
    for i = 1:N - 1         %euler
        y(i + 1) = y(i) + h*f(x(i), y(i));
    end
    z = y;
end