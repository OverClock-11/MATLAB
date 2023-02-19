%%%svm¡Ω∑÷¿‡
clear
load fisheriris
X = meas(1:100,3:4);
y = zeros(100,1);
y(50:100)=1;
X_train = X([1:40,51:90],:);
y_train = y([1:40,51:90]);
X_test = X([41:50,91:100],:);
y_test = y([41:50,91:100]);
svmmodel = svmtrain(X_train,y_train,'showplot',true);
y_predict = svmclassify(svmmodel,X_test,'showplot',true);
hold on
plot(X_test(:,1),X_test(:,2),'bs','Markersize',12);
acc = sum(y_predict==y_test)/length(y_test)*100
