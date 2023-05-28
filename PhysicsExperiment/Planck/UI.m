clear, clc
U1 = 0:5:30;
U2 = 32:2:50;
U = [U1 U2];
I1 = [0.2 9.8 17.1 21.1 23.8 26.5 28.3 28.8 29.7 29.8 30.6 31.4 31.3 31.9 32.7 33.4 34.0];
I2 = [0 9.8 17.2 21.5 24.1 26.8 28.5 28.7 29.0 29.5 30.7 31.1 32 32.5 33 33.4 34.4];
hold on
plot(U, I1)
plot(U, I2, '--')
legend("530nm", "560nm")
legend("Position",[0.21952,0.80294,0.15714,0.082143])
grid on
box on
xlabel('$U(V)$', 'Interpreter','latex')
ylabel('$I(10^{-12}A)$', 'Interpreter','latex')
