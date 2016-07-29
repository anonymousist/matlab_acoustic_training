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
             Dist = wDTW(training{j,v},testing{i,v});          %use dynamic time wraper to calculate the distance between every single test sample and all training sample
             temp = temp+Dist;
        end
        aveDist = temp/tcolumn;                                       % add all  feature's distance and calculate the average value
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
    neighbors_D=training(neighbors,column); % neighbors_D is the TOP K label collect
    neighbors_Log{i} = neighbors_D;
	[x,y]=sort(neighbors_D);
	neighbors_Log_Sort{i} = x;
	 xx = [];
     for  m = 1:K
         xx = [xx;x{m}];
     end
     b = unique(xx);
	 hi = histc(xx,b);
	[hiDat,hiInd] = sort(hi,'descend');
	if (length(hiDat) >1)
		if (hiDat(1)-hiDat(2)) <= 1               %  if the top 2 votes number and close,  use the  specific selected training collect  to revote
			top_1 = b(hiInd(1));
			top_2 = b(hiInd(2));
			%top_3 = b(hiInd(3));
			% disp(hiDat(1));
			% disp(i);
			% disp(hiDat(2));
			TempTr = {};
			TempTr = training(:,column);
			TempSZ = [];
			subTrdata = {};
			subTrdata1 = {};
			subTrdata2 = {};
			for o = 1:row
				TempSZ = [TempSZ,TempTr{o}];
			end
			subTrdata1_Indx = find(top_1==TempSZ);
			subTrdata2_Indx = find(top_2==TempSZ);
			subTrdata1 = training(subTrdata1_Indx,:);
			subTrdata2 = training(subTrdata2_Indx,:);
			subTrdata = [subTrdata1;subTrdata2];
			[row2,column2] = size(subTrdata);
			subTedata = testing(i,:);                %***************************************************%
			tcolumn1 = column2-1;
			distan = [];
				for j = 1:row2
							temp_1 = 0;
						for v = 1:tcolumn1
							Dist_1 = dtw_yp(subTrdata{j,v},subTedata{1,v});
							temp_1 = temp_1+Dist_1;
						end
						aveDist_1 = temp_1/tcolumn1;
				distan(1,j) = aveDist_1;
      	        end
				%neighbors_Log_1 = {};
				neighbors_D_1 = {};
				% D_1 = {};
			   [a1,b1]=sort(distan(1,:)); % a is the element and b is the index of element after sort 
				neighbors_1=b1(1:K)';
				%D_1 = a1(1:K);
			    neighbors_D_1=subTrdata(neighbors_1,column); % neighbors_D is the TOP K label collect
				%neighbors_Log_1 = neighbors_D_1;
				[x1,y1]=sort(neighbors_D_1);
				%neighbors_Log_Sort_1 = x1;
				xx1 = [];
				for  m = 1:K
					xx1 = [xx1;x1{m}];
				end
				b1 = unique(xx1);
				[m1,n1] = max(histc(xx1,b1));   %http://zhidao.baidu.com/question/143735710.html?qbl=relate_question_0&word=MATLAB%D2%BB%B8%F6%C9%FD%D0%F2%CA%FD%D7%E9%CD%B3%BC%C6%B3%F6%CF%D6%B4%CE%CA%FD%D7%EE%B6%E0%B5%C4%D4%AA%CB%D8%A1%BF
            %%%%%计算样本的类别号%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				label(i)=b1(n1);
			%	disp('inside if');
			%	disp(label(i)-48);
         	    vote_num(i) = m1;
		else
				%if(hiDat(1) - hiDat(2)) > 1
				%[m,n] = max(histc(xx,b));   %http://zhidao.baidu.com/question/143735710.html?qbl=relate_question_0&word=MATLAB%D2%BB%B8%F6%C9%FD%D0%F2%CA%FD%D7%E9%CD%B3%BC%C6%B3%F6%CF%D6%B4%CE%CA%FD%D7%EE%B6%E0%B5%C4%D4%AA%CB%D8%A1%BF
				%%%%%计算样本的类别号%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				label(i)= b(hiInd(1));
				%disp('inside for');
				%disp(label(i)-48);
				vote_num(i) = hiDat(1);
        end
    else
               label(i)= b(hiInd(1));
				%disp('inside 1 if');
				%disp(label(i)-48);
				vote_num(i) = hiDat(1);
    end
end
label=label';
label=label-48;