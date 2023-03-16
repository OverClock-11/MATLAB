% 差商表计算
clear, clc
x = [0.4 0.55 0.65 0.8 0.9 1.05];
f = [0.41075 0.57815 0.69675 0.88811 1.02652 1.25382];
[~,n] = size(f);
ff = zeros(n);
ff(:,1) = f';
for i = 2:n
    f = (f(2:end) - f(1:end - 1))./(x(i:end) - x(1:end - i + 1));
    ff(i:end,i) = f';
end
disp(ff)