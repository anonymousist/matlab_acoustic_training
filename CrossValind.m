
function [label,pencent] = CrossValind(formatdat)
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
[label,vote_num,neighbors_Log,neighbors_Log_Sort] = KNN_DTW_Modify(trainData,testData,11);
count = 0;
for i = 0:length(label)-1
	 if label(i+1) == floor(i/selectNum);
	 count = count+1;
     end
 end
% for i = 0:length(label)-1
	% if label(i+1) == floor(i/selectNum)+1;  % 字符1-8
	% count = count+1;
    % end
% end
pencent = count/length(label)
%toc
label = label;









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
