load('HM_6\logarithm.mat')
% 绘图&保存图片

if exist('PICS','dir')==0
	mkdir('PICS');      % 判断是否有PICS文件夹，如果没有就创建一个
end

p1 = semilogx(temperature, S);
xlabel('Temperature (K)');
ylabel('S');
grid on
saveas(p1, 'PICS\magnetization', 'jpeg')
saveas(p1, 'PICS\magnetization', 'svg')

p2 = semilogx(temperature, Svar);
xlabel('Temperature (K)');
ylabel('Variance');
grid on
saveas(p2, 'PICS\Variance', 'jpeg')
saveas(p2, 'PICS\Variance', 'svg')

p3 = semilogx(temperature(end - ARITH*9:end), Svar(end - ARITH*9:end));
grid on
saveas(p3, 'PICS\Variance2', 'jpeg')
saveas(p3, 'PICS\Variance2', 'svg')
