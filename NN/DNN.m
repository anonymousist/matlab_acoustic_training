[inputall,outputall] = load_data_V2();

inputs = inputall';
targets = outputall';


hiddenSize = 30;
autoenc1 = trainAutoencoder(inputs,hiddenSize,...
    'L2WeightRegularization',0.001,...
    'SparsityRegularization',4,...
    'SparsityProportion',0.05,...
    'DecoderTransferFunction','purelin');

features1 = encode(autoenc1,inputs);
hiddenSize = 30;
autoenc2 = trainAutoencoder(features1,hiddenSize,...
    'L2WeightRegularization',0.001,...
    'SparsityRegularization',4,...
    'SparsityProportion',0.05,...
    'DecoderTransferFunction','purelin',...
    'ScaleData',false);

features2 = encode(autoenc2,features1);

softnet = trainSoftmaxLayer(features2,targets,'LossFunction','crossentropy');

deepnet = stack(autoenc1,autoenc2,softnet);
deepnet = train(deepnet,inputs,targets);
detected = deepnet(inputs);
T = vec2ind(targets);
O = vec2ind(detected);
mat = confusionmat(T,O);