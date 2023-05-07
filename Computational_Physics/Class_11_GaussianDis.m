%中心极限定理生成高斯分布的随机数
clear, clc;
n = 8;
N = 100000;
A = zeros(1,N);

for i = 1:N
    for j = 1:n
        A(i) = A(i) + sqrt(12/n)*(rand() - 0.5);
    end
end
histogram(A)


