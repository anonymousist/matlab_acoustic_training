function [tr_accuracy,te_accuracy,nodesnumber,log] = tune_hidden_nodes_number()
nodesnumber = [];
tr_accuracy = [];
te_accuracy = [];
log = [];
for i = 2:2:40
    temtracc = [];
    temteacc = [];
    for j = 1:10
        [tracc,teacc] = tune_NN_v2(i);
        temtracc = [temtracc,tracc];
        temteacc = [temteacc,teacc];
    end
    log = [log;temteacc];
    tr_accuracy = [tr_accuracy,mean(temtracc)];
    te_accuracy = [te_accuracy,mean(temteacc)];
    nodesnumber = [nodesnumber,i];
    
end
save tune_XZM_trainlm_default_2_2_40.mat;