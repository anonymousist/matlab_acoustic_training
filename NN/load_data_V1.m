function [input,output] = load_data()
%input & output data
load 'ZZH2000.mat';
input = ZZH2000(:,2:10);
outputdata = ZZH2000(:,1);

output=zeros(2000,10);
% set every input-out signal 
for i = 1:2000
    switch outputdata(i)
        case 0
            output(i,:) = [1 0 0 0 0 0 0 0 0 0];
        case 1
            output(i,:) = [0 1 0 0 0 0 0 0 0 0];
        case 2
            output(i,:) = [0 0 1 0 0 0 0 0 0 0];
        case 3
            output(i,:) = [0 0 0 1 0 0 0 0 0 0];
        case 4
            output(i,:) = [0 0 0 0 1 0 0 0 0 0];
        case 5
            output(i,:) = [0 0 0 0 0 1 0 0 0 0];
        case 6
            output(i,:) = [0 0 0 0 0 0 1 0 0 0];
        case 7
            output(i,:) = [0 0 0 0 0 0 0 1 0 0];
        case 8
            output(i,:) = [0 0 0 0 0 0 0 0 1 0];
        case 9
            output(i,:) = [0 0 0 0 0 0 0 0 0 1];
    end
end

%random select training samples
% idx = randperm(2000);
% input_train = input(idx(1:1800),:)';
% output_train = output(idx(1:1800),:)';
% input_test = input(idx(1801:2000),:)';
% output_test = output(idx(1801:2000),:)';
