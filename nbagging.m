function [detected,actual,b,p] = nbagging(n)
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
	[L_abel,b,pencent] = bagging(formatdat);
	Label = [Label,L_abel];
	c1 = [c1,cc];
	p = [p,pencent];
	progress = floor((i/n*100)/1)
end
detected = Label';
actual = c1';
confusion_matrix(actual,detected);
Mean = mean(p)
p = [p,mean(p)];
toc