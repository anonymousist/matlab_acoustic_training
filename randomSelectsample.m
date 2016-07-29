function [selectData,remainData] = randomSelectsample(data,m,n)
step = m; %one label number
remainData = {};
selectData = {};
selectNum = n;%random select n samples as the test data
for i = 0:9
       dataIndex = (step*i+1):(step*i+step);
       tempdata = data(dataIndex,:);
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
remainData = [remainData;TrdataTem];
selectData = [selectData;TedataTem];
end