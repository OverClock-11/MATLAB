clear, clc
m = readmatrix("rdf_liquid.xlsx");
m2 = readmatrix("rdf_solid.xlsx");

if ~exist('PICS_rdf','dir')
	mkdir('PICS_rdf');      % 判断是否有PICS文件夹，如果没有就创建一个
end

p = plot(m(:, 1), m(:, 2));
grid on
ax = gca;
chart = ax.Children(1);
datatip(chart,0.378,58.95);
chart2 = ax.Children(1);
datatip(chart2,0.704,16.08);
saveas(p, 'PICS_rdf\rdf_liquid', 'jpeg')
saveas(p, 'PICS_rdf\rdf_liquid', 'svg')

p2 = plot(m2(:, 1), m2(:, 2));
grid on
ax = gca;
chart = ax.Children(1);
datatip(chart,0.368,6.182);
chart2 = ax.Children(1);
datatip(chart2,0.526,0.766);
saveas(p2, 'PICS_rdf\rdf_solid', 'jpeg')
saveas(p2, 'PICS_rdf\rdf_solid', 'svg')