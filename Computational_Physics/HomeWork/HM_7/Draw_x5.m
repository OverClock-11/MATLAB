clear, clc
% 5倍温度&势能
temp = readmatrix("5x_temperature.xlsx");
pote = readmatrix("5x_potential.xlsx");
pres = readmatrix("5x_pressure.xlsx");

if exist('PICS_condensation','dir')==0
	mkdir('PICS_condensation');      % 判断是否有PICS文件夹，如果没有就创建一个
end

p1 = plot(temp(:, 1), temp(:, 2));
xlabel('step');
ylabel('Temperature (K)');
grid on
saveas(p1, 'PICS2\Temperature', 'jpeg')
saveas(p1, 'PICS2\Temperature', 'svg')

p2 = plot(pote(:, 1), pote(:, 2));
xlabel('step');
ylabel('Potential');
grid on
saveas(p2, 'PICS2\Potential', 'jpeg')
saveas(p2, 'PICS2\Potential', 'svg')

p3 = plot(pres(:, 1), pres(:, 2));
xlabel('step');
ylabel('Pressure');
grid on
saveas(p3, 'PICS2\Pressure', 'jpeg')
saveas(p3, 'PICS2\Pressure', 'svg')