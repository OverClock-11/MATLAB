clear, clc
% 隐式交替方向法(ADI)求解二维偏微分方程u(x,y,t)

dt = 0.01;                  %步长
dx = 0.05;
dy = dx;
t = 0:dt:1;
x = 0:dx:25;
y = 0:dy:25;
K = size(t, 2);
I = size(x, 2);
J = size(y, 2);

%Initialize
ux = zeros(I, J);           %ux矩阵用来计算x列
ux(:, 1) = 75;
ux(1, :) = 100;
ux(:, J) = 50;
uy = ux;                    %uy矩阵用来计算y列
kappa = 0.835;

m = 1/dt + 2*kappa/dx^2;
n = kappa/dx^2;
q = 1/dt - 2*kappa/dx^2;

a = -n*ones(1, I - 2);      %追赶法初始化
a(1) = 0;
b = m*ones(1, I - 2);
c = -n*ones(1, I - 2);
c(I - 2) = 0;
d = zeros(1, I - 2);

eps = 1e-5;
err = 10;
timer = 0;

%计算稳态
% while err > eps
%     timer = timer + 1;
%     u0 = ux;
%     for k = 1:K - 1
%         for j = 2:J - 1     %前半个时间步计算uy
%             for i = 2:I - 1
%                 d(i - 1) = q*ux(i, j) + n*ux(i, j + 1) + n*ux(i, j - 1);
%             end
%             d(1) = d(1) + n*uy(1, j);
%             d(I - 2) = d(I - 2) + n*uy(I, j);
%             ch = chase(a, b, c, d, I - 2);
%             uy(2:I - 1, j) = ch';
%         end
%         for i = 2:I - 1     %后半个时间步计算ux
%             for j = 2:J - 1
%                 d(j - 1) = q*uy(i, j) + n*uy(i + 1, j) + n*uy(i - 1, j);
%             end
%             d(1) = d(1) + n*ux(i, 1);
%             d(J - 2) = d(J - 2) + n*ux(i, J);
%             ch = chase(a, b, c, d, J - 2);
%             ux(i, 2:J - 1) = ch;
%         end
%     end
%     err = norm(ux - u0, 1); %只用最后一个ux结果判断
% end

for k = 1:K - 1       
    for j = 2:J - 1     %前半个时间步计算uy            
        for i = 2:I - 1                
            d(i - 1) = q*ux(i, j) + n*ux(i, j + 1) + n*ux(i, j - 1);            
        end            
        d(1) = d(1) + n*uy(1, j);            
        d(I - 2) = d(I - 2) + n*uy(I, j);            
        ch = chase(a, b, c, d, I - 2);            
        uy(2:I - 1, j) = ch';        
    end        
    for i = 2:I - 1     %后半个时间步计算ux
        for j = 2:J - 1                
            d(j - 1) = q*uy(i, j) + n*uy(i + 1, j) + n*uy(i - 1, j);            
        end            
        d(1) = d(1) + n*ux(i, 1);           
        d(J - 2) = d(J - 2) + n*ux(i, J);            
        ch = chase(a, b, c, d, J - 2);            
        ux(i, 2:J - 1) = ch;        
    end    
end


heatmap(ux,'GridVisible','off');
xlabel("Xaxis")
ylabel("Yaxis")

function x = chase(a,b,c,d,n)
w = zeros(1, n);
g = zeros(1, n);

w(1) = c(1)/b(1);
g(1) = d(1)/b(1);

for i=2:n
    w(i) = c(i)/(b(i)-a(i)*w(i-1));
    g(i) = (d(i)-a(i)*g(i-1))/(b(i)-a(i)*w(i-1));
end

x = zeros(1,n);
x(n) = g(n);
for i = n-1:-1:1
    x(i) = g(i)-w(i)*x(i+1);
end
end
