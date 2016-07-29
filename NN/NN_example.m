%Network Definition
%The first step is to create a new network. Type the following code to create a network and view its many properties:
net = network;

%Change that by setting these properties to the number of inputs and number of layers in the custom network diagram.
net.numInputs = 1;
net.numLayers = 3;

net.biasConnect = [1; 1; 1];

net.inputConnect = [1;0;0];
net.layerConnect = [0 0 0; 1 0 0; 0 1 0];
net.outputConnect = [0 0 1];

net.layers{1}.size = 20;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';

net.layers{2}.size = 20;
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.initFcn = 'initnw';

net.layers{3}.size = 10;
%net.layers{3}.transferFcn = 'softmax';
net.layers{3}.initFcn = 'initnw';

net.initFcn = 'initlay';
net.trainFcn = 'trainbr';
net.divideFcn = 'dividerand';

%net.plotFcns = {'plotperform','plottrainstate'};
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotconfusion', 'plotroc'};
net = init(net);


% [inputall,outputall] = load_data();
% inputs = inputall';
% targets = outputall';
% 
% net.divideParam.trainRatio = 70/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
% 
% [net,tr] = train(net,inputs,targets);
% 
% 
% outputs = net(inputs);
% errors = gsubtract(targets,outputs);
% performance = perform(net,targets,outputs)
% 
% % trInput = inputs(:,tr.trainInd);
% % trOut = net(trInput);
% % trTarget = targets(:,tr.trainInd);
% % figure, plotconfusion(trgTarget,trOut);
% % 
% % tsInput = inputs(:,tr.testInd);
% % tsOut = net(tsInput);
% % tsTarget = targets(:,tr.testInd);
% % 
% % figure, plotconfusion(tsTarget,tsOut);
% trOut = outputs(:,tr.trainInd);
% vOut = outputs(:,tr.valInd);
% tsOut = outputs(:,tr.testInd);
% trTarg = targets(:,tr.trainInd);
% vTarg = targets(:,tr.valInd);
% tsTarg = targets(:,tr.testInd);
% figure, plotconfusion(trTarg,trOut);
% figure, plotconfusion(tsTarg,tsOut);
% 
% % View the Network
% view(net)
% 
% % Plots
% % Uncomment these lines to enable various plots.
% % figure, plotperform(tr)
% % figure, plottrainstate(tr)
%  figure,title('all'),  plotconfusion(targets,outputs);
%  
%  t = vec2ind(targets);
%  o = vec2ind(outputs);
%  figure;
%  confusion_matrix(t,o);
% % figure, ploterrhist(errors)
% 
% 
