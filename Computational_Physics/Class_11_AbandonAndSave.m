%舍去法求任意函数的分布(x)
clear,clc;
N = 100000;
h = 0.01;
x = 0:h:1;
f = @(x)(20*x.*(1 - x).^3);
y = f(x);
ymax = max(y);
ymin = min(y);

yrand = zeros(1,N);
for i = 1:N
    yrand(i) = (ymax -  ymin)*rand() + ymin;
end

vec = zeros(1,size(x,2));

for i = 1:size(x, 2)
    j = 1;
    while yrand(j) < y(i)
        vec(i) = yrand(j);
        j = j + 1;
    end
end
