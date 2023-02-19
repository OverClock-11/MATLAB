x = -5:0.1:5;
f = exp(-1*abs(x));
hold on
set(gca,'XAxisLocation','origin');  %x轴移到y=0处
set(gca,'YAxisLocation','origin');  %y轴移到x=0处
set(gca,'ytickLabel',[])  %取消y轴刻度数字
%plot([-5 5],[0 0], 'k-', 'LineWidth',1)
plot(x,f)
ylim([-0.1 1.1])
text(0.2,1,'$\phi(0)=\frac{m \pi \gamma}{\hbar ^2}$','Interpreter','latex','FontSize',14)
set(gca, 'xtick', -5:1:5)
grid on
