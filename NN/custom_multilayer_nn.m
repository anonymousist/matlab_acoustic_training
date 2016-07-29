

%web('http://cn.mathworks.com/help/nnet/ug/create-and-train-custom-neural-network-architectures.html');

net = network;

net.numInputs = 2;
net.numLayers = 3;

net.biasConnect(1) = 1;
net.biasConnect(3) = 1;
%net.biasConnect = [1; 0; 1];


% net.inputConnect(1,1) = 1;
% net.inputConnect(2,1) = 1;
% net.inputConnect(2,2) = 1;
net.inputConnect = [1 0; 1 1; 0 0];

net.layerConnect = [0 0 0; 0 0 0; 1 1 1];

net.outputConnect = [0 1 1];

net.layers{1}.size = 4;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';

net.layers{2}.size = 3;
net.layers{2}.transferFcn = 'logsig';
net.layers{2}.initFcn = 'initnw';

net.layers{3}.initFcn = 'initnw';

net.inputWeights{2,1}.delays = [0 1];
net.inputWeights{2,2}.delays = 1;
net.layerWeights{3,3}.delays = 1;

net.initFcn = 'initlay';

net.performFcn = 'mse';
net.trainFcn = 'trainlm';
net.divideFcn = 'dividerand';

net.plotFcns = {'plotperform','plottrainstate'};

net = init(net);

X = {[0; 0] [2; 0.5]; [2; -2; 1; 0; 1] [-1; -1; 1; 0; 1]};
T = {[1; 1; 1] [0; 0; 0]; 1 -1};
net = train(net,X,T);
Y = sim(net,X);

view(net);
