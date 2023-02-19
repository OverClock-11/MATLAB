%%%
clear
clc
M0 = [0,1,1,1;1,0,0,1;1,0,0,1;0,1,0,0];
[~,n] = size(M0);
% M = zeros(n);
% for i = 1:n
%     M(:,i)=M0(:,i)/sum(M0(:,i));
% end
% M(isnan(M))=0;
% alpha = 0.8;
% v0 = ones(n,1)/n;
% v1 = M*v0;
% while max(abs(v1-v0))>1e-6
%     v0 = v1
%     v1 = M*v0;
% end

%%%改进的Pagerank
% v1 = v0
% v2 = alpha*M*v1+(1-alpha)*v0;
% while max(abs(v1-v2))>1e-6
%     v1 = v2
%     v2 = alpha*M*v1+(1-alpha)*v0;
% end


%%%%RWR
% M1 = zeros(n);
% for i =1:n
%     M1(i,:) = M0(i,:)/sum(M0(i,:));
% end
% v0 = [1 0 0 0]';
% v1 = v0;
% v2 = alpha*M1*v1+(1-alpha)*v0;
% while max(abs(v1-v2))>1e-6
%     v1 = v2
%     v2 = alpha*M1*v1+(1-alpha)*v0;
% end


%%%KATZ算法
% A = zeros(n);
% for i =1:n
%     A(:,i) = M0(:,i)/sum(M0(:,i));
% end
% beta = 0.1;
% katz1 = beta*A;
% katz2 = beta^2*A^2;
% katz3 = beta^3*A^3;
% katz4 = beta^6*A^4;
% skatz = katz1+katz2+katz3+katz4;



