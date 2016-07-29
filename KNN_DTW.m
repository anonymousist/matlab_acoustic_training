%KNN classifiers,
%training is training set, testing is test set,
% K is the number of selected neighbors
function label = KNN_DTW(training,testing,K)

[row,column] = size(training);
[row1,column1] = size(testing);
tcolumn = column1-1;
distance = [];
for i=1:row1
    for j = 1:row
        temp = 0;
        for v = 1:tcolumn
             Dist = dtw_lwf(training{j,v},testing{i,v})
             % s: signal 1, size is ns*k, row for time, colume for channel 
             % t: signal 2, size is nt*k, row for time, colume for channel 
             % w: window parameter
             %      if s(i) is matched with t(j) then |i-j|<=w
             % d: resulting distance
             temp = temp+Dist;
        end
        aveDist = temp/tcolumn;
        distance(i,j) = aveDist;
    end
end
label=[];
for i=1:row1
    [a,b]=sort(distance(i,:)); % a is the element and b is the index of element after sort 
    neighbors=b(1:K)';
    neighbors_D=training(neighbors,column); % neighbors_D is the TOP K label collect
    [x,y]=sort(neighbors_D);
    xx = [];
     for  m = 1:K
         xx = [xx;x{m}];
     end
    temp=find(diff(xx)~=0);       
    nei_d=[xx(1);xx(temp+1)];
    Num_D=[];
    neighbors_DD = [];
    for  n = 1:K
          neighbors_DD = [neighbors_DD;neighbors_D{n}];
     end
  
    for j=1:length(nei_d)
        num=length(find(neighbors_DD==nei_d(j)));
        Num_D=[Num_D,num];
    end
%%%%%计算样本的类别号%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [a,b]=max(Num_D);
    label(i)=nei_d(b);
end
label=label';
label=label-48;