%迭代函数
function g = Iter(n, yy, h, x)
    g = (h*x*n^2 - yy)/(2*h*x*n + 2*h - 1);
end