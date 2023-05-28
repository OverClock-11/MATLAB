clear, clc
data = readmatrix("data.xlsx");
Vg2k = data(:, 1);
IA = data(:, 2)*1e-7;
s = size(Vg2k, 1);
bottom = zeros(7, 1);
t = 1;
for i = 5:s - 1
    if IA(i - 1) >= IA(i) && IA(i + 1) >= IA(i)
        bottom(t) = i;
        t = t + 1;
    end
end
delta = sum(Vg2k(bottom(2:5)) - Vg2k(bottom(1:4)))/4;
txt = ['delta = '  num2str(delta)];
disp(txt);
hold on
plot(Vg2k, IA)
scatter(Vg2k(bottom(1:5)), IA(bottom(1:5)), 'filled')
grid on
box on
ylabel("$I_A$", "Interpreter","latex")
xlabel("$V_{G2K}$", "Interpreter","latex")
xlim([Vg2k(1) Vg2k(end)])

