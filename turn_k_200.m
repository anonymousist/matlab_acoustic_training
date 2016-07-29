function [k,accuracy] = turn_k_200(n)
tic
formatdat = formatdata
Label = [];
cc = [];
%c = [0,1,2,3,4,5,6,7,8,9];
testNum = 20;
for i = 0:9
	for j = 1:testNum
    cc = [cc,i];
	end
end
c1 = [];
for i=1:n
	for j = 1:199
		[label,pencent] = CrossValind(formatdat,j);
		k(i,j) = j;
		accuracy(i,j) = pencent;
	end
	% Label = [Label;label];
	% c1 = [c1,cc];
	% p = [p,pencent];	
end
% Mean = mean(p)
% p = [p,mean(p)];
% detected = Label;
% actual = c1';
% confusion_matrix(actual,detected);
toc