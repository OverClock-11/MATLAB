k = -pi/2:0.01:pi/2;
t1 = 1;
t2 = 1;
E1 = sqrt(t1^2 + t2^2 + 2*t1*t2*cos(2*k));
t1 = 1.2;
t2 = 0.8;
E2 = sqrt(t1^2 + t2^2 + 2*t1*t2*cos(2*k));
hold on;
plot(k,E1,'r-')
plot(k,-1*E1,'r-')
plot(k,E2,'b-')
plot(k,-1*E2,'b-')
plot([-pi/2 pi/2],[0 0],'k-')
plot([0 0],[2 -2],'k-')
xlim([-pi/2 pi/2])
ylim([-2 2])
ylabel('E(k)')
xlabel('k')
grid on