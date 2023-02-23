%画出z = x^2+y^3的三维图像

[X,Y] = meshgrid(-3:0.1:3);
R = X.^2 + Y.^3;
mesh(X,Y,R)
title('Surface Plot of $z = x^2+y^3$','Interpreter','latex')
xlabel('X')
ylabel('Y')
zlabel('Z')