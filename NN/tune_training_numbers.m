function [tr_accuracy,te_accuracy,trainRatio,log] = tune_training_numbers()
trainRatio = [];
tr_accuracy = [];
te_accuracy = [];
log = [];
for i = 10:2:90
    temtracc = [];
    temteacc = [];
    for j = 1:10
        [tracc,teacc] = tune_NN_tr(i);
        temtracc = [temtracc,tracc];
        temteacc = [temteacc,teacc];
    end
    log = [log;temteacc];
    tr_accuracy = [tr_accuracy,mean(temtracc)];
    te_accuracy = [te_accuracy,mean(temteacc)];
    trainRatio = [trainRatio,i];
    
end
save tune_trainlm_default_trRatio_26_10_2_90.mat;