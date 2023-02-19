X1 = zeros(200,5);
for ii = 1:5
    X1(:,ii) = exprnd(ii,200,1);
end
r = [0;2;0;-3;0];
Y = X1*r + randn(200,1)*0.1;
X=[ones(200,1) X1];
[b,bint,r,rint,stats]=regress(Y,X,0.05);  %最小二乘法

lambda = 0.001;
I = eye(size(X'*X));
theta1 = inv(lambda*I+X'*X)*X'*Y;  %正规方程法

init_theta = zeros(size(X,2),1);
cost = @(t)gdRegress(X,Y,t,lambda);
options = optimset('MaxIter',100,'Gradobj','on');
theta = fminunc(cost,init_theta,options);  %梯度下降法

