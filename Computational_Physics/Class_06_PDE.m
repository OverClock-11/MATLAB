clear, clc
%有限差分法FTCS格式解偏微分方程u(t,x)

dt = 0.0001;
dx = 0.02;

t = 0:dt:0.1;
x = 0:dx:1;
K = size(t,2);
I = size(x,2);

u = zeros(I,K);
u(I,:) = 100;

eps = 1e-5;
err = 10;
r = 0.835*dt/dx^2;
while (err > eps)
    u1 = u;
    for i = 2:I - 1
        for k = 1:K - 1
            u(i,k + 1) = u(i,k) + r*(u(i + 1,k) - 2*u(i,k) + u(i - 1,k));
        end
    end
    err = norm(u - u1,1);
end

heatmap(u,'GridVisible','off');

