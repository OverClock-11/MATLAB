clear, clc
Tmax_p = [100 100 99.8 99.7 100 100 100 98.8 96.8 94 90.1 84.7 76.9 67.8 55.4 39.8];
Tmin_p = [2.5 2.5 2.6 2.7 3.1 3.7 4.8 6.4 8.8 11.5 13.9 15.1 17.1 17.8 16.5 13.0];
Tmax_n = [100 100 100 98.9 96.6 95.2 92.9 90.7 87.7 83.9 78.7 73.7 65.3 55.8 43.1 33.0];
Tmin_n = [1.9 1.9 2.0 2.1 2.5 3.1 3.9 5.3 7 8.3 10.7 12.8 14.1 14.2 12.7 9.4];
ratio_p = Tmax_p./Tmin_p;
ratio_n = Tmax_n./Tmin_n;
theta = 0:5:75;
hold on
plot(theta, ratio_p);
plot(theta, ratio_n, '--');
grid on
box on
legend("positive", "negative")
xlabel("$\theta$", 'Interpreter','latex');
ylabel("$T_{max}/T_{min}$", 'Interpreter','latex')
xlim([0 75])
