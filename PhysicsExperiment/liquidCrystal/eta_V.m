clear, clc
sum([2.5 2.5 2.4])/3;
V = [0 0.5 0.8 1 1.2 1.4 1.6 1.8 2 2.2 2.4 3 4 5 6];
eta = [100 99.8 99.5 93.5 64.43 32 11.9 4.3 2.73 2.9 3.23 3.5 2.97 2.46 2.13];
plot(V, eta)
grid on
box on
xlabel("V", "Interpreter","latex");
ylabel("$\eta$", "Interpreter","latex");
title("$\eta-V$", "Interpreter","latex")
