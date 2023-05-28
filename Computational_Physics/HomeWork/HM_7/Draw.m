clear, clc
% 温度&势能
temp = readmatrix("temperature.xlsx");
pote = readmatrix("potential.xlsx");

if exist('PICS','dir')==0
	mkdir('PICS');      % 判断是否有PICS文件夹，如果没有就创建一个
end

p1 = plot(temp(:, 1), temp(:, 2));
xlabel('step');
ylabel('Temperature (K)');
grid on
saveas(p1, 'PICS\Temperature', 'jpeg')
saveas(p1, 'PICS\Temperature', 'svg')

p2 = plot(pote(:, 1), pote(:, 2));
xlabel('step');
ylabel('Potential');
grid on
saveas(p2, 'PICS\Potential', 'jpeg')
saveas(p2, 'PICS\Potential', 'svg')