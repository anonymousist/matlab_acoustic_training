function [input,output] = load_data_V2()
%input & output data
load 'XZM36.mat';
input = meas(1:2000,:);
outputdata = species(1:2000,:);

output=zeros(2000,10);
% set every input-out signal 
for i = 1:2000
    switch outputdata(i)
        case '0'
            output(i,1) = 1;
        case '1'
            output(i,2) = 1;
        case '2'
            output(i,3) = 1;
        case '3'
            output(i,4) = 1;
        case '4'
            output(i,5) = 1;
        case '5'
            output(i,6) = 1;
        case '6'
            output(i,7) = 1;
        case '7'
            output(i,8) = 1;
        case '8'
            output(i,9) = 1;
        case '9'
            output(i,10) = 1;
    end
end

%random select training samples
% idx = randperm(2000);
% input_train = input(idx(1:1800),:)';
% output_train = output(idx(1:1800),:)';
% input_test = input(idx(1801:2000),:)';
% output_test = output(idx(1801:2000),:)';
