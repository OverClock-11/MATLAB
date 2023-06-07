% 用[0,1]均匀分布获得指数函数
n = 10000;
lambda = 0.5;
X = zeros(1,n);
txt = ['$f(x)=' num2str(lambda) '^{-1}e^{-x/' num2str(lambda) '}$'];
for i = 1:n
    X(i) = -1*lambda*log(1-rand());
end
h = histogram(X);
xlim([0 max(X)])
text(0.6*max(X),0.8*max(h.Values),txt,'Interpreter','latex','FontSize',14);
title("Exponential Distribution")
