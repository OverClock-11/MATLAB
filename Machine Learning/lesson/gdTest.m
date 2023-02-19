% % %%%y = x^2
% % f = @(x)(x.^2);
% % t = -3:0.5:12;
% % plot(t,f(t),'b-')
% % times = 20;
% % alpha = 0.2;
% % x = 10;
% % for i = 1:times
% %     x1 = x;
% %     y1 = f(x1);
% %     fprintf('第%d次迭代，x=%f,y=%f\n',i,x1,y1)
% %     hold on
% %     scatter(x1,y1,'ro')
% %     
% %     x = x-alpha*2*x; 
% % end

%%%y = （x1-10）^2+(x2-10).^2
f = @(x1,x2)((x1-10).^2+(x2-10).^2);
times = 100;
alpha = 0.1;
x1 = 20;
x2 = 20;
for i = 1:times
    y = f(x1,x2);
    fprintf('第%d次迭代，x1=%f,x2=%f,y=%f\n',i,x1,x2,y)      
    x1 = x1-alpha*2*(x1-10); 
    x2 = x2-alpha*2*(x2-10);
end

