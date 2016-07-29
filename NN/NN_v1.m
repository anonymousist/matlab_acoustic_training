
%input & output data
load 'ZZH2000.mat';
input = ZZH2000(:,2:10);
outputdata = ZZH2000(:,1);

output=zeros(2000,10);
% set every input-out signal 
for i = 1:2000
    switch outputdata(i)
        case 0
            output(i,:) = [1 0 0 0 0 0 0 0 0 0];
        case 1
            output(i,:) = [0 1 0 0 0 0 0 0 0 0];
        case 2
            output(i,:) = [0 0 1 0 0 0 0 0 0 0];
        case 3
            output(i,:) = [0 0 0 1 0 0 0 0 0 0];
        case 4
            output(i,:) = [0 0 0 0 1 0 0 0 0 0];
        case 5
            output(i,:) = [0 0 0 0 0 1 0 0 0 0];
        case 6
            output(i,:) = [0 0 0 0 0 0 1 0 0 0];
        case 7
            output(i,:) = [0 0 0 0 0 0 0 1 0 0];
        case 8
            output(i,:) = [0 0 0 0 0 0 0 0 1 0];
        case 9
            output(i,:) = [0 0 0 0 0 0 0 0 0 1];
    end
end


%random select training samples
idx = randperm(2000);
input_train = input(idx(1:1800),:)';
output_train = output(idx(1:1800),:)';
input_test = input(idx(1801:2000),:)';
output_test = output(idx(1801:2000),:)';

[inputn,inputps] = mapminmax(input_train);
%inputn = input_train;

% NN structure initing
innum = 9;
midnum = 20;
outnum = 10;

% weight & threshold initing
w1 = rands(midnum,innum);
b1 = rands(midnum,1);
w2 = rands(midnum,outnum);
b2 = rands(outnum,1);
w2_1=w2;w2_2=w2_1;
w1_1=w1;w1_2=w1_1;
b1_1=b1;b1_2=b1_1;
b2_1=b2;b2_2=b2_1;


%学习率
xite=0.1;
alfa=0.01;
loopNumber=10;
I=zeros(1,midnum);
Iout=zeros(1,midnum);
FI=zeros(1,midnum);
dw1=zeros(innum,midnum);
db1=zeros(1,midnum);

E=zeros(1,loopNumber);
for ii = 1:loopNumber
    E(ii) = 0; % training error
    for i = 1:1:1800
    
    % select training data
    x = inputn(:,i);
    
    %hidden  layer output
    for j = 1:1:midnum
        I(j) = inputn(:,i)'*w1(j,:)'+b1(j);
        Iout(j) = 1/(1+exp(-I(j)));
    end
    
    %output layer output
    yn = w2'*Iout'+b2;
    
    %predict error
    e = output_train(:,i) - yn;
    E(ii) = E(ii)+sum(abs(e));
    
    %calculate w2,b2 adjustment
    dw2 = e*Iout;
    db2 = e';
    
    for j = 1:1:midnum
        S = 1/(1+exp(-I(j)));
        FI(j) = S*(1-S);
    end
    for k =1:1:innum
        for j = 1:1:midnum
            dw1(k,j) = FI(j)*x(k)*(e(1)*w2(j,1)+e(2)*w2(j,2)+e(3)*w2(j,3));
            db1(j) = FI(j)*(e(1)*w2(j,1)+e(2)*w2(j,2)+e(3)*w2(j,3));
        end
    end
    
   %update weight threshold 
   w1 = w1_1 + xite*dw1';
   b1 = b1_1 + xite*db1';
   w2 = w2_1 + xite*dw2';
   b2 = b2_1 + xite*db2';
   
   % save the result
   w1_2=w1_1;w1_1=w1;
   w2_2=w2_1;w2_1=w2;
   b1_2=b1_1;b1_1=b1;
   b2_2=b2_1;b2_1=b2;
    end
end



%% 分类
inputn_test=mapminmax('apply',input_test,inputps);
%inputn = input_test;
fore=zeros(10,200);
for ii=1:1
    for i=1:200%150
        %隐含层输出
        for j=1:1:midnum
            I(j)=inputn_test(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));
        end
        
        fore(:,i)=w2'*Iout'+b2;
    end
end

%% 结果分析
%根据网络输出找出数据属于哪类
output_fore=zeros(1,200);
for i=1:200
    output_fore(i)=find(fore(:,i)==max(fore(:,i)));
end
output_fore = output_fore - 1;
%BP网络预测误差
error=output_fore-outputdata(idx(1801:2000))';
disp(error);
%画出预测种类和实际种类的分类图
figure(1)
plot(output_fore,'r')
hold on
plot(outputdata(idx(1801:2000))','b')
legend('预测类别','实际类别')

%画出误差图
figure(2)
plot(error)
title('BP网络分类误差','fontsize',12)
xlabel('样本','fontsize',12)
ylabel('分类误差','fontsize',12)

%print -dtiff -r600 1-4

k=zeros(1,10);  
%找出判断错误的分类属于哪一类
for i=1:200
    if error(i)~=0
        [b,c]=max(output_test(:,i));
        switch c
           case 0
            k(1)=k(1)+1;
        case 1
            k(2)=k(2)+1;
        case 2
            k(3)=k(3)+1;
        case 3
            k(4)=k(4)+1;
        case 4
            k(5)=k(5)+1;
        case 5
            k(6)=k(6)+1;
        case 6
            k(7)=k(7)+1;
        case 7
            k(8)=k(8)+1;
        case 8
            k(9)=k(9)+1;
        case 9
            k(10)=k(10)+1;
        end
    end
end

%找出每类的个体和
kk=zeros(1,10);
for i=1:200
    [b,c]=max(output_test(:,i));
    switch c
        case 0
            kk(1)=kk(1)+1;
        case 1
            kk(2)=kk(2)+1;
        case 2
            kk(3)=kk(3)+1;
        case 3
            kk(4)=kk(4)+1;
        case 4
            kk(5)=kk(5)+1;
        case 5
            kk(6)=kk(6)+1;
        case 6
            kk(7)=kk(7)+1;
        case 7
            kk(8)=kk(8)+1;
        case 8
            kk(9)=kk(9)+1;
        case 9
            kk(10)=kk(10)+1;
    end
end

%正确率
rightridio=(kk-k)./kk;
disp('正确率')
disp(rightridio);
