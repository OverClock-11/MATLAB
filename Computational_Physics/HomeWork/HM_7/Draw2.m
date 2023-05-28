clear, clc
m = readmatrix("potential_melt.xlsx");
m2 = readmatrix("pressure_melt.xlsx");
m3 = readmatrix("temperature_melt.xlsx");

if ~exist('PICS_melt','dir')
	mkdir('PICS_melt');      % 判断是否有PICS文件夹，如果没有就创建一个
end

p2 = plot(m(:, 1), m(:, 2));
grid on
saveas(p2, 'PICS_melt\potential_melt', 'jpeg')
saveas(p2, 'PICS_melt\potential_melt', 'svg')
p3 = plot(m2(:, 1), m2(:, 2));
grid on
saveas(p3, 'PICS_melt\pressure_melt', 'jpeg')
saveas(p3, 'PICS_melt\pressure_melt', 'svg')
p4 = plot(m3(:, 1), m3(:, 2));
grid on
saveas(p4, 'PICS_melt\temperature_melt', 'jpeg')
saveas(p4, 'PICS_melt\temperature_melt', 'svg')
