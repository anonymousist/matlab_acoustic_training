%KNN classifiers,
%training is training set, testing is test set,
% K is the number of selected neighbors
function [label] = KNN_DTW_Modify_W_multiVote(training,testing,K)
[row,column] = size(training);
[row1,column1] = size(testing);
tcolumn = column1-1;
label=[];
	for i=1:row1
		distance = [];
		for v = 1:tcolumn
			for j = 1:row
				Dist = dtw_yp(training{j,v},testing{i,v});
				distance(v,j) = Dist;
			end
		end
		
		neighbors_D = {};
		D = {};
		all_b = [];
        sum_aw =[];
		for f = 1:tcolumn
			[a,b]=sort(distance(f,:)); % a is the element and b is the index of element after sort 
			neighbors=b(1:K)';
			D{i} = a(1:K);
			neighbors_D=training(neighbors,column); % neighbors_D is the TOP K label collect
			for t = 1:K
				w(t) = 1-a(t)/a(K);  % calculate the weight of the top k sample separately
			end
			% neighbors_Log{i,f} = neighbors_D;
			[x,y]=sort(neighbors_D);
			% neighbors_Log_Sort{i,f} = x;
			xx = [];
			for  m = 1:K
				xx = [xx;x{m}];
			end
			c = unique(xx);
			all_c = [all_c;c];           %all_b是所有feature候选者的集合
			for n =1:length(c)
				d_in = find(c(n)==xx');
				% disp(d_in);
				sum_w(n) = sum(w(d_in));      %计算不同feature的 候选者的weight值         
				% disp(sum_w(n));
				% disp('AAAAAAAAAAA');
			end
			sum_aw  = [sum_aw,sum_w];     %sum_aw是所有feature 候选者权值的集合
			sum_w = [];
			clear c;
		end
		unique_c = unique(all_c);
		for j = 1:length(unique_c)
			sum_w_in = find(unique_c(j) == all_c);
			sum_f_w(j) = sum(sum_aw(sum_w_in));
		end
		clear sum_w_in;
		[m,n] = max(sum_f_w);   %http://zhidao.baidu.com/question/143735710.html?qbl=relate_question_0&word=MATLAB%D2%BB%B8%F6%C9%FD%D0%F2%CA%FD%D7%E9%CD%B3%BC%C6%B3%F6%CF%D6%B4%CE%CA%FD%D7%EE%B6%E0%B5%C4%D4%AA%CB%D8%A1%BF
		clear sum_f_w;							%%%%%计算样本的类别号%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		label(i)=unique_c(n);
end
label=label';
label=label-48;
