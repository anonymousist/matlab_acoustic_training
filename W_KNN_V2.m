%KNN classifiers,
%training is training set, testing is test set,
% K is the number of selected neighbors
function [label,vote_num,neighbors_Log,neighbors_Log_Sort] = KNN_DTW(training,testing,K)
[row,column] = size(training);
[row1,column1] = size(testing);
tcolumn = column1-1;
distance = [];
for i=1:row1
    for j = 1:row
        temp = 0;
        for v = 1:tcolumn
             Dist = wDTW(training{j,v},testing{i,v}) ;            %use dynamic time wraper to calculate the distance between every single test sample and all training sample
             temp = temp+Dist;
        end
        aveDist = temp/tcolumn;                                       % add all feature's distance and calculate the average value
        distance(i,j) = aveDist;
    end
end
label=[];
vote_num = [];
neighbors_Log = {};
neighbors_D = {};
% D = {};
for i=1:row1
%	disp('***********');
%	disp(i);
%	disp('***********');
    [a,b]=sort(distance(i,:)); % a is the element and b is the index of element after sort 
    neighbors=b(1:K)';
	%D{i} = a(1:K);
	for j = 1:K
		w(j) = 1-a(j)/a(K);  % calculate the weight of the top k sample separately
	end
    neighbors_D=training(neighbors,column); % neighbors_D is the TOP K label collect
    neighbors_Log{i} = neighbors_D;
	[x,y]=sort(neighbors_D);
	neighbors_Log_Sort{i} = x;
	 xx = [];
     for  m = 1:K
         xx = [xx;neighbors_D{m}];
     end
     b = unique(xx);
	 % disp(length(b));
	 % disp('**********');
	 for n =1:length(b)
		 d_in = find(b(n)==xx');
		 % disp(d_in);
		 sum_w(n) = sum(w(d_in));               
		 % disp(sum_w(n));
		 % disp('AAAAAAAAAAA');
	end
	[max_w,max_in] = max(sum_w);
    
   % disp('DDDDDDDDDDDDDDD');
    % disp(a(1:K));
    % disp(w);
    % disp(xx);
	% disp('---------------');
    % disp(b);
    % disp(sum_w);
    % disp(max_in);
    % disp(max_w);
	% disp('BBBBBBBBBBBBBBBBB');
	 label(i)= b(max_in);
	 clear sum_w;
end
label=label';
label=label-48;