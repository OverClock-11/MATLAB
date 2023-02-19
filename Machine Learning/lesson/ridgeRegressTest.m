clear
X1=[143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]';
X=[ones(16,1) X1];
Y=[88 85 88 91 92 93 93 95 96 98 97 96 98 99 100 102]';
[b,bint,r,rint,stats]=regress(Y,X,0.05);
lambda = 0.1;
I = eye(size(X'*X));
theta = inv(lambda*I+X'*X)*X'*Y;
scatter(X1,Y,'k')
hold on
y1 = b(1)+b(2)*X1;
y2 = theta(1)+theta(2)*X1;
% plot(X1,y1,'r-')
% plot(X1,y2,'b--')
