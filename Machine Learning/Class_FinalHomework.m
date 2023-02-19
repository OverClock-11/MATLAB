%--Acquare Data
dis_name = readtable('data\disease_name.xlsx');
RNA_name = readtable('data\miRNA_name.xlsx');
dis_sim = readmatrix('data\diseasesim.txt');
RNA_sim = readmatrix('data\mirsim.txt');
association_line = readmatrix('data\Known miRNA-disease association number.txt');

%--Initialize
association = zeros(495, 383);  %行：RNA 列：疾病
[sz, ~] = size(association_line);
for i = 1:sz
    association(association_line(i, 1), association_line(i, 2)) = 1;
end

%--Run Katz
[~,n] = size(association);
Katz_A = [RNA_sim association; association' dis_sim];

beta = 0.1;
katz1 = beta*Katz_A;
katz2 = beta^2*Katz_A^2;
katz3 = beta^3*Katz_A^3;
katz4 = beta^4*Katz_A^4;
skatz = katz1 + katz2 + katz3 + katz4;
p_result = skatz(1:495, 496:end);

%--Calculate ROC&AUC
tic
predict = p_result(:);
ground_truth = association(:);
[PX, PY, Auc] = calculate_roc(predict, ground_truth);
toc

figure(1);
plot(PX,PY);
xlabel('False positive rate');
ylabel('True positive rate'); 
title('ROC Curve');
fprintf('AUC=%.2f \n', Auc)

function [PX,PY,Auc] = calculate_roc(predict, ground_truth)
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
    Auc = Auc + (PY(i)+PY(i-1))*(PX(i-1)-PX(i))/2;
end
PX(m+1) = 0;
PY(m+1) = 0;
Auc = Auc + PY(m)*PX(m)/2;
end

