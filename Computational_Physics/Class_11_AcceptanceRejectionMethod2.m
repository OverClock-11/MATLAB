%舍选法示意图
clear, clc
n = 1000;
h = 0.01;
x = 0:h:1;
f = @(x)(20*x.*(1 - x).^3); % 概率密度函数（PDF）
y = f(x);
ymax = max(y);
ymin = min(y);

vec = [];
vec2 = [];
vec3 = [];
vec4 = [];
for i = 1:n
    yrand = ymin + (ymax - ymin)*rand; % 逆变换法求均匀分布
    R = rand; 
    if yrand <= f(R)
        vec = [vec R];
        vec2 = [vec2 yrand]; 
    else
        vec3 = [vec3 R]; 
        vec4 = [vec4 yrand]; 
    end
end

hold on
scatter(vec, vec2,'green','o')
scatter(vec3, vec4,'red','x')
plot(x,y,'b-')
ylim([ymin ymax])
legend("Accepted", "Rejected", "PDF")
box on
title("舍选法示意图")

