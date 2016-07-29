function [k,accuracy] = turn_k()
k = [];
accuracy = [];
for i = 1:40
[detected,actual,p] = nCrossValind(5,i);
k(i) = i;
accuracy(i)= p;
end

