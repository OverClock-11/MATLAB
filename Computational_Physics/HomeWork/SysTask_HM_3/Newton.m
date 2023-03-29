%Newton法求解隐式欧拉法
function z = Newton(yy, h, x)
    err = 10;
    eps = 1e-5;
    n = yy;
    while err > eps
        y = Iter(n, yy, h, x);
        err = abs(y - n);
        n = y;
    end
    z = n;
end