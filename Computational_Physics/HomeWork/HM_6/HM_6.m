clear, clc
%蒙特卡洛模拟 N*N Ising 模型

temperature = [1 1e5 1e10 1e15 1e20];
ARITH = 8;
savelog = zeros(ARITH*9, 1);
LOG = 1e22;
for i = 1:9:ARITH*9
    for j = 1:9
        savelog(i + j - 1) = j*LOG;
    end
    LOG = LOG*10;
end
savelog = [savelog; LOG]';
temperature = [temperature savelog];    % 对数温度
S = zeros(1, size(temperature, 2));
Svar = zeros(1, size(temperature, 2));

tic
for k = 1:size(temperature, 2)
    N = 100;
    spins = ones(N, N);
%     spins = 2*randi([0, 1], N, N)-1;  % random initial matrix
    num_steps = 1000000;
    J = 1.0;
    k_B = 1.38e-23;
    T = temperature(k);
    svar = zeros(1, num_steps);
    svar(1) = sum(spins, "all")/N^2;
    
    energy = zeros(num_steps, 1);
    
    for step = 2:num_steps
        i = randi([1, N]);
        j = randi([1, N]);
    
        delta_E = ...
        2*J*spins(i, j)*(spins(mod(i-2, N)+1, j) + spins(mod(i, N)+1, j) + spins(i, mod(j-2, N)+1) + spins(i, mod(j, N)+1));
    
        if (delta_E <= 0) || (exp(-delta_E/(k_B*T)) > rand())   % Accept
            spins(i,j) = -spins(i,j);
        end
        svar(step) = sum(spins, "all")/N^2;
    end
    
    S(k) = sum(spins, "all")/N^2;
    Svar(k) = var(svar);
end
toc

save('logarithm.mat');