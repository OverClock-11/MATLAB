function rocaucmain()
% 主函数，调用calculate_roc绘制roc曲线并计算auc值
clc;
clear;
sample_num = 100;
       
% 生成预测概率值
predict(1:sample_num/4) = rand(1,sample_num/4)*0.05 + 0.95;
predict(sample_num/4+1:sample_num/2) = rand(1,sample_num/4)*0.1 + 0.9; 
predict(sample_num/2+1:sample_num) = 0.98; 
 
ground_truth = randi(2,1,sample_num)-1;  % 生成0,1标签真值
 
% 将均匀分布转换成有非均匀分布
randnum = randi(sample_num);
part_index = randi(sample_num,1,randnum);
ground_truth(part_index) = 1;
 
[PX, PY, Auc] = calculate_roc(predict, ground_truth);
disp(Auc);
 
figure(1);
plot(PX,PY);
xlabel('False positive rate');
ylabel('True positive rate'); 
figure
[Xpr,Ypr,Tpr,AUCpr] = perfcurve(ground_truth,predict,'1'); 
plot(Xpr,Ypr);
disp(AUCpr)
end
 
function [PX,PY,Auc] = calculate_roc(predict, ground_truth)
% 计算AUC值，同时绘制ROC曲线
% 二值分类，predict为预测为真的概率值，ground_truth为真值标签，均为一维向量
% 返回值：PX, PY为ROC曲线上的点，Auc为ROC曲线下面面积值
% Create Date: 2020/10/16 
pos_num = sum(ground_truth == 1);
neg_num = sum(ground_truth == 0);
 
m = length(ground_truth);
[~, index] = sort(predict);
ground_truth = ground_truth(index);
PX = zeros(m+1,1);
PY = zeros(m+1,1);
Auc = 0;
PX(1) = 1; PY(1) = 1;
 
for i = 2:m
    TP = sum(ground_truth(i:m)==1);
    FP = sum(ground_truth(i:m)==0);
    PX(i) = FP/neg_num;
    PY(i) = TP/pos_num;
    Auc = Auc + (PY(i)+PY(i-1))*(PX(i-1)-PX(i))/2;     % 梯形面积：（上底+下底）*高/2
end
PX(m+1) = 0;
PY(m+1) = 0;
Auc = Auc + PY(m)*PX(m)/2;
end