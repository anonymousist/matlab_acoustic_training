function zcrEnv=zcr(inputSignal)

[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end

winSize=1500;
winStep=750;
winNum=floor((N+winStep-winSize)/winStep);
zcr=[];

for i=1:winNum
    
    dataIndx=(winStep*i+1-winStep):(winStep*i+winSize-winStep);
    dataIndx2=(winStep*i+1-winStep+1):(winStep*i+winSize-winStep);
    dataRange=inputSignal(dataIndx);
    dataRange2=[inputSignal(dataIndx2),1];
    temp=dataRange.*dataRange2;
    zcr(i)=length(find(temp(1:end-1)<0))/(length(dataRange)-1);
    
%      if i==winNum&&((winStep*i+winSize-winStep+1)<N)
%          dataIndx=(winStep*i+winSize-winStep+1):N;
%          dataIndx2=(winStep*i+winSize-winStep+2):N;
%          dataRange=inputSignal(dataIndx);
%          dataRange2=[inputSignal(dataIndx2),1];
%          temp=dataRange.*dataRange2;
%          zcr(i+1)=length(find(temp(1:end-1)<0))/(length(dataRange)-1);
%     end
end
zcrEnv = zcr;
% [M,N]=size(zcr);
% if M>N
    % zcr=zcr';
    % [M,N]=size(zcr);
% end
% ma = max(zcr);
% mi = min(zcr);
% for i=1:N
% zcrEnv(i) = (zcr(i)-mi)/(ma-mi);
% end

 % varStr = name;
 % pathStr=path;
 % newStr=[pathStr,varStr];
 % dlmwrite(newStr,zcrEnv);



