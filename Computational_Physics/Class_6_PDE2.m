clear, clc
%有限差分法FTCS格式解偏微分方程u(x,y)

dx = 0.05;
dy = 0.05;

x = 0:dx:pi;
y = 0:dy:pi;
m = size(x,2);
n = size(y,2);

u = zeros(m,n);
u(m,:) = sin(pi*y);
u(:,n) = sin(pi*x)';

eps = 1e-5;
err = 10;
while (err > eps)
    u1 = u;
    for i = 2:m - 1
        for j = 2:n - 1
            u(i,j) = (dx^2*(u(i+1,j) + u(i-1,j)) + dy^2*(u(i,j+1) + u(i,j-1)) + (dx*dy)^2*(x(i)^2 + y(j)^2)*sin(x(i)*y(j)))/(2*(dx^2 + dy^2));
        end
    end
    err = norm(u - u1,1);
end

g1 = nexttile;
a = heatmap(u,'GridVisible','off');

g2 = nexttile;
mesh(x,y,u)
view([65.12 35.29])