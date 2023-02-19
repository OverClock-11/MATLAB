x = -8:0.1:8;
f1 = exp(-1*abs(1-x))+exp(-1*abs(1+x));
f2 = -exp(-1*abs(1-x))+exp(-1*abs(1+x));
hold on
plot(x,f1,x,f2)
set(gca,'xtick',[-8:8])
%ylim([-0.1 1.2])
set(gca,'XAxisLocation','origin')
set(gca,'YAxisLocation','origin')
set(gca,'ytickLabel',[])
legend('even','odd')
title('双\delta势垒波函数图形')
grid on