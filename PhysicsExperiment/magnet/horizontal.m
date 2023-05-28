clear, clc
% 横向长度
if ~exist('Pics', 'dir')
    mkdir("Pics");
end
dl = 4.914e-2;
x_velo = readmatrix("horizontal_1.xlsx");
X_tick = readmatrix("horizontal_2.xlsx");
x_velo = dl./(x_velo/1000);
X_tick = X_tick/1000;

l = 6;
pp = zeros(1, l);
x_velo = log(x_velo);
for i = 1:l
    f = fit(x_velo(i, :)', X_tick(i, :)', 'poly1');
    pp(i) = f.p1;
end
% pp(1) = -32.6875;
% pp(2) = -23;
% f2 = fit((3:8)', pp(3:8)', 'poly1');
f2 = fit((1:l)', pp(1:l)', 'poly1');
hold on
grid on
box on
t1 = ['$\Delta k = ' num2str(f2.p1) '$'];
t2 = ['$w_0 = ' num2str(f2.p2) '$'];
scatter(1:l, pp)
plot(1:l, f2(1:l))
text(3, -55, t1, 'Interpreter','latex', 'FontSize',15)
text(3, -57, t2, 'Interpreter','latex', 'FontSize',15)
xlabel('$w_i$', 'Interpreter','latex')
ylabel('k')
title("horizontal")
legend('data', 'fit')
saveas(gca, 'Pics\horizontal', 'jpeg')
