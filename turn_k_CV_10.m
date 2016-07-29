function [k,accuracy] = turn_k_CV_10
tic
 k = [];
 accuracy = [];
for i = 1:50
	[actual,detected,accuracy_ave,p] = cross_validation(10,i);
	k =[k,i];
	accuracy =[accuracy,accuracy_ave];
	disp('progress');
	disp(i/50*100);
end
toc