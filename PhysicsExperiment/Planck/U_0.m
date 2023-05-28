clear, clc
U0 = [1.66 1.56 1.5 1.46 1.36 1.3 1.24 1.16 1.1 1.02 0.96];
Ud = [1.9 1.93 1.88 1.79 1.57 1.48 1.41 1.3 1.21 1.13 1.05];
la = [410 425 440 455 470 485 500 515 530 545 560]*1e-9;
c = 3e8;
nv = c./la*1e-14;

f = fit(nv', U0', 'poly1');
hold on
scatter(nv, U0)
plot(nv,f(nv))
grid on
box on
legend('data', 'fit')

legend("Position",[0.18302,0.79246,0.13393,0.082143])
xlabel("$\nu$", "Interpreter","latex");
ylabel("$U_0$", "Interpreter","latex");
text(5.2, 1.5, "$k_1 = 0.3515$", "Interpreter", "latex", "FontSize", 15)
text(5.2, 1.42, "$d_1 = -0.8935$", "Interpreter", "latex", "FontSize", 15)
title("$U_0-\nu$", "Interpreter","latex")
