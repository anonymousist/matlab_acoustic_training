%KNN classifiers,
%training is training set, testing is test set,
% K is the number of selected neighbors
function [label,vote_num,neighbors_Log,neighbors_Log_Sort] = KNN_DTW_Modify_multiVote(training,testing,K)
[row,column] = size(training);
[row1,column1] = size(testing);
tcolumn = column1-1;
	for i=1:row1
		distance = [];
		for v = 1:tcolumn
			for j = 1:row
				Dist = dtw_yp(training{j,v},testing{i,v});
				distance(v,j) = Dist;
			end
		end
	label=[];
	vote_num = [];
	neighbors_Log = {};
	neighbors_D = {};
	D = {};
	fvote = [];
	for f = 1:tcolumn
		[a,b]=sort(distance(f,:)); % a is the element and b is the index of element after sort 
		neighbors=b(1:K)';
		D{i} = a(1:K);
		neighbors_D=training(neighbors,column); % neighbors_D is the TOP K label collect
		neighbors_Log{i,f} = neighbors_D;
		[x,y]=sort(neighbors_D);
		neighbors_Log_Sort{i,f} = x;
		xx = [];
		for  m = 1:K
			xx = [xx;x{m}];
		end
	fvote = [fvote,xx];
	end
     b = unique(fvote);
	 [m,n] = max(histc(fvote,b));   %http://zhidao.baidu.com/question/143735710.html?qbl=relate_question_0&word=MATLAB%D2%BB%B8%F6%C9%FD%D0%F2%CA%FD%D7%E9%CD%B3%BC%C6%B3%F6%CF%D6%B4%CE%CA%FD%D7%EE%B6%E0%B5%C4%D4%AA%CB%D8%A1%BF
									%%%%%计算样本的类别号%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    label(i)=b(n);
	vote_num(i) = m;
end
label=label';
label=label-48;
