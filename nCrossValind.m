function [detected,actual,p] = nCrossValind(n)
tic
formatdat = formatdata
Label = [];
cc = [];
%c = [0,1,2,3,4,5,6,7,8,9];
testNum = 1;
for i = 0:9
	for j = 1:testNum
    cc = [cc,i];
	end
end
c1 = [];
p = [];
for i=1:n
	[label,pencent] = CrossValind(formatdat);
	Label = [Label;label];
	c1 = [c1,cc];
	p = [p,pencent];
	progress = floor((i/n*100)/1)
end
Mean = mean(p)
p = [p,mean(p)];
detected = Label;
actual = c1';
confusion_matrix(actual,detected);
toc