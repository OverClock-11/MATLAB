%获取数据
h = 1.054e-34;  %约化普朗克常数
% m = input('请输入粒子质量:');
% if m >= 1
%     m = m*1.783e-30;
% end
m = 9.109e-31;  %电子质量
a = 1;  %delta函数位置
E = 0:0.01:500;
k = sqrt(2*m.*E)/h;
kk = 1i*h^2.*k;
ep = exp(2*1i.*k*a);
em = exp(-2*1i.*k*a);

%泛定方程的系数
A = 2*m./(kk-2*m).*em+m./kk.*(ep-em);
% B = kk/(kk-2*m)-m/kk;
% C = m/kk*ep;
D = kk./(2*m-kk);
plot(E,A)
%plot(E,D)
