v11 = -6:1:0;
v12 = 0.3:0.3:3;
v13 = [v11*0.3, v12];

I11 = [-0.6 -0.5 -0.3 -0.2 -0.1 -0.1 0];
I12 = [0 0.1 0.1 0.2 0.3 0.6 1.3 3.3 13.1 55.5];
I13 = [I11*20, I12];
I21 = [-0.7 -0.5 -0.4 -0.2 -0.1 -0.1 0];
I22 = [0 0.1 0.1 0.2 0.4 0.9 2.1 5.6 17.7 63.7];
I23 = [I21*20, I22];
I31 = [-0.8 -0.5 -0.3 -0.1 -0.1 0 0];
I32 = [0 0 0 0 0.1 0.1 0.2 0.4 0.8 1.5];
I33 = [I31*20, I32];

hold on
plot(v13,I13,"bs-")  %单晶硅
plot(v13,I23,"r*-")  %多晶硅
plot(v13,I33,"ko-")  %非晶硅

x=-1.8:0.3:3;
set(gca,'xtick',x);  %设置x轴刻度（和数据有关）
I4 = -15:5:65;
set(gca,'ytick',I4);  %设置y轴刻度（和数据有关）

xl=[-6:1:0, 0.3:0.3:3];
%xs=sprintfc('%g',xl);
set(gca,'xtickLabel',xl);  %设置x轴显示的刻度（和数据无关）

yl=[-0.75:0.25:0, 5:5:65];
%ys=sprintfc('%g',yl);
set(gca,'ytickLabel',yl);  %设置y轴显示的刻度（和数据无关）
set(gca,'XAxisLocation','origin');  %x轴移到y=0处
set(gca,'YAxisLocation','origin');  %y轴移到x=0处

grid on  %添加网格

title("PN结伏安特性")
ylabel("电流（mA）")
xlabel("电压（V）")
legend("单晶硅","多晶硅","非晶硅")
%str=[repmat('  X:',5,1) num2str(x') repmat(', Y:',5,1) num2str(y')];
%text(x,y,cellstr(str))
