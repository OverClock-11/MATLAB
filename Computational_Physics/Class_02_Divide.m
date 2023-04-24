%二分法求方程根
a = 2;
b = 1.5;
eps = 1e-5;
err = 10;

while (err > eps)
    x = (a + b)/2;
    if f(x)*f(a) < 0
        b = x;
    else
        a = x;
    end
    err = abs(f(x));
end
%%
function y = f(x)
    y = sin(x)-x^2/4;
end