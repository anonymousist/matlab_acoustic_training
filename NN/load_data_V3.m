function [input,output] = load_data_V3()
%input & output data
load 'ZZH36_CF.mat';
input = meas(2001:7200,:);
outputdata = species(2001:7200,:);

output=zeros(5200,26);
% set every input-out signal 
for i = 1:5200
    switch outputdata(i)
       
        case 'A'
            output(i,1) = 1;
        case 'B'
            output(i,2) = 1;
        case 'C'
            output(i,3) = 1;
        case 'D'
            output(i,4) = 1;
        case 'E'
            output(i,5) = 1;
        case 'F'
            output(i,6) = 1;
        case 'G'
            output(i,7) = 1;
        case 'H'
            output(i,8) = 1;
        case 'I'
            output(i,9) = 1;
        case 'J'
            output(i,10) = 1;
        case 'K'
            output(i,11) = 1;
        case 'L'
            output(i,12) = 1;
        case 'M'
            output(i,13) = 1;
        case 'N'
            output(i,14) = 1;
        case 'O'
            output(i,15) = 1;
        case 'P'
            output(i,16) = 1;
        case 'Q'
            output(i,17) = 1;
        case 'R'
            output(i,18) = 1;
        case 'S'
            output(i,19) = 1;
        case 'T'
            output(i,20) = 1;
        case 'U'
            output(i,21) = 1;
        case 'V'
            output(i,22) = 1;
        case 'W'
            output(i,23) = 1;
        case 'X'
            output(i,24) = 1;
        case 'Y'
            output(i,25) = 1;
        case 'Z'
            output(i,26) = 1;
    end
end

%random select training samples
% idx = randperm(2000);
% input_train = input(idx(1:1800),:)';
% output_train = output(idx(1:1800),:)';
% input_test = input(idx(1801:2000),:)';
% output_test = output(idx(1801:2000),:)';
