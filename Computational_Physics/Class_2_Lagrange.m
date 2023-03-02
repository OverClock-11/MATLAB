%拉格朗日插值法
clear, clc

X = [0 100 300 1000 1500 2000];
y = [0.9689 0.9322 0.8969 0.8515 0.7984 0.7485];
N = 10000;
xx = linspace(0,2000,N);
yy = zeros(1,N);

for i = 1:N
    for j = 1:6
        yy(i) = yy(i) + y(j)*l(xx(i),j,6,X);
    end
end

hold on
plot(xx,yy)
scatter(X,y,'o','filled')
%%
function y = l(x,i,k,xdat)
    y = 1;
    for c = 1:k
        if c ~= i
            y = y*(x - xdat(c))/(xdat(i) - xdat(c));
        end
    end
end