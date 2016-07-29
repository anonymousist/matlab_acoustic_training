
function [L_abel,b,pencent] = bagging(formatdat)
%tic
%formatdat = formatdata;
step = 200; %one label number
trainData = {};
testData = {};
selectNum = 1;%random select n samples as the test data
for i = 0:9
       dataIndex = (step*i+1):(step*i+step);
       tempdata = formatdat(dataIndex,:);
       [TedataTem,TeindxTem] = datasample(tempdata,selectNum,'Replace',false); %random select sample as the test data
       Size = size(tempdata);% size 为1*2的cell 第一列为行数 第二列为列数
       tempIndx = 1:Size(1,1);
       index = logical(zeros(size(tempIndx)));
       for j = 1:length(TeindxTem)
       res = (tempIndx == TeindxTem(j));
       index = (index | res);
       end
TrindxTem = tempIndx(~index);
TrdataTem = tempdata(TrindxTem,:);
trainData = [trainData;TrdataTem];
testData = [testData;TedataTem];
end

%随机从训练样本中选出Num个样本，用作一个KNN分类器的训练样本，生成KNN_Num个KNN分类器，并将每个KNN分类器的分类结果 存入数组a中
TrNum = step-selectNum;
Num = 10;
a = [];
b = [];
KNN_Num =100;
for  m = 1:KNN_Num
	TrainData = {};
	for i = 0:9
		datInd = (TrNum*i+1):(TrNum*i+TrNum);
		temdata = trainData(datInd,:);
		[Tem,indxTem] = datasample(temdata,Num); %
		TrainData = [TrainData;Tem];
	end
	[label,vote_num,neighbors_Log,neighbors_Log_Sort] = KNN_DTW_Modify(TrainData,testData,11);
	a = [a,label'];
    b = [b,label];
end
%统计多个KNNlabel中各字符的数量，然后进行投票
L_abel = [];
for i = 0:9
	temLabel = [];
    %f = length(a);
    for j = 1:length(a)
		if mod(j-1,10) == i;
            temLabel = [temLabel,a(j)];
		end
	end
	c = unique(temLabel);
	[r,s] = max(histc(temLabel,c));
	L_abel =[L_abel,c(s)];
end

count = 0;
for i = 0:length(L_abel)-1
	 if L_abel(i+1) == floor(i/selectNum);           %计算字符预测准确率
	 count = count+1;
     end
 end
% for i = 0:length(label)-1
	% if label(i+1) == floor(i/selectNum)+1;  % 字符1-8
	% count = count+1;
    % end
% end
pencent = count/length(L_abel)
%toc










% [test,Teindx] = datasample(formatdata,10);
% formatIndx =1:length(formatdata);
% 
% index = logical(zeros(size(formatIndx)));
% for i = 1:length(Teindx)
%     res = (formatIndx == Teindx(i));
%     index = (index | res);
% end
% Trindx = formatIndx(~index);
% traindata = formatdata(Trindx,:);
% %******************************
% % test program 
% % A = [1,2,3,4,6,8];
% % B = [1,3,5,6];
% % index = logical(zeros(size(A)));
% % for i = 1:length(B)
% %     res = (A == B(i));
% %     index = (index | res);
% % end
% % C = A(~index)
% %*******************************
