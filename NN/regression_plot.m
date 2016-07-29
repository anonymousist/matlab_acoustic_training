
Outputs = net(inputs);
trOut = Outputs(:,tr.trainInd);
vOut = Outputs(:,tr.valInd);
tsOut = Outputs(:,tr.testInd);
trTarg = targets(:,tr.trainInd);
vTarg = targets(:,tr.valInd);
tsTarg = targets(:,tr.testInd);
plotregression(trTarg,trOut,'Train',tsTarg,tsOut,'Testing')