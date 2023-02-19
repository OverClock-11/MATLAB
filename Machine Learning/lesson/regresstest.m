clear
X=[143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]';
X=[ones(16,1) X];
Y=[88 85 88 91 92 93 93 95 96 98 97 96 98 99 100 102]';
[b,bint,r,rint,stats]=regress(Y,X,0.05);
scatter(X(:,2),Y)
hold on
yy = b(1)+b(2)*X(:,2);
plot(X(:,2),yy,'r')
figure
rcoplot(r,rint) 
