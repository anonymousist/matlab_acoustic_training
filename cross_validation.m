
function [actual,detected,accuracy_ave,accuracy] = cross_validation(n,K)


% input n is the n cross validation

%tic
formatdat = formatdata;
Size = size(formatdat);
selectNum = Size(1,1)/(10*n);
remainData = formatdat;
data1 = {};
for i = 1:n
		reSize = size(remainData);
		m = reSize(1,1)/10;       % m is the sample number of the remain sample
	    [selectData,remainData] = randomSelectsample(remainData,m,selectNum)           %random split the sample into n sub collect  v1,v2,....vn
	    data1{i} = selectData;
end

 label_N_CV = [];
 accuracy = [];
 for i= 1:n
  trainData = {};
  testData = {};
	testData = data1{i};
	 for j = 1:n                            % n fold cross validation     v1/v2..vn  v2/v1,v3,...vn  .... vn/v1,v2,...vn-1
		if i~=j
			trainData = [trainData;data1{j}];
		end
	 end
	[label,vote_num,neighbors_Log,neighbors_Log_Sort] = KNN_DTW_Modify(trainData,testData,K);
	 count = 0;
     for i = 0:length(label)-1
		if label(i+1) == floor(i/selectNum);     % calculate the number of correct classified label 
			count = count+1;
		end
     end
	pencent = count/length(label);
	label_N_CV = [label_N_CV;label];
	accuracy = [accuracy,pencent];
end
accuracy_ave = mean(accuracy)

cc = [];
%c = [0,1,2,3,4,5,6,7,8,9];
for i = 0:9
	for j = 1:selectNum
    cc = [cc,i];
	end
end
cc_n = [];
for i =1:n
	cc_n = [cc_n,cc];
end

actual = cc_n';
detected = label_N_CV;
% count = 0;
% for i = 0:length(label)-1
	 % if label(i+1) == floor(i/selectNum);
	 % count = count+1;
     % end
 % end
% % for i = 0:length(label)-1
	% % if label(i+1) == floor(i/selectNum)+1;  % ×Ö·û1-8
	% % count = count+1;
    % % end
% % end
% pencent = count/length(label)
% %toc
% label = label;
