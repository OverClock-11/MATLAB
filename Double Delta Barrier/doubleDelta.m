function Y = delta(m,E,a,x1,x2,x3)
    %获取数据
    h = 1.054e-34;
    k = sqrt(2*m*E)/h;
    kk = 1i*h^2*k;
    ep = exp(2*1i*k*a);
    em = exp(-2*1i*k*a);

    %泛定方程的系数
    A = 2*m/(kk-2*m)*em+m/kk*(ep-em);
    B = kk/(kk-2*m)-m/kk;
    C = m/kk*ep;
    D = kk/(2*m-kk);

    %波函数
    [~,s1] = size(x1);
    [~,s2] = size(x2);
    [~,s3] = size(x3);
    SIZE = max([s1,s2,s3]);
    y1 = exp(1i*k.*x1)+A*exp(-1i*k.*x1);  %x < -a
    y2 = B*exp(1i*k.*x2)+C*exp(-1i*k.*x2);  %-a < x < a
    y3 = D*exp(1i*k.*x3);  %a < x
    Y = zeros([3 SIZE]);
    Y(1,1:s1) = y1;
    Y(2,1:s2) = y2;
    Y(3,1:s3) = y3;
end