function [J,grad] = gdRegress(X,y,theta,lambda)
    m = length(y);
    J = 0;
    grad = zeros(size(theta));
    J = sum((X*theta-y).^2)/2/m+lambda*sum(theta(2:end).^2)/2/m;
    %theta0不需要正则化
    grad(1) = sum((X*theta-y).*X(:,1),1)'/m;
    for j =2:size(X,2)
        grad(j) = sum((X*theta-y).*X(:,j),1)'/m+theta(j)*lambda/m;
    end    
end