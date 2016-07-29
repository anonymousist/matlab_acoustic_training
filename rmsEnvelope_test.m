function rmsEnv=rmsEnv(inputSignal)

[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end
winSize=30;
winStep=15;
winNum=floor((N+winStep-winSize)/winStep);
rms=[];
for i=1:winNum
    
    dataIndx=(winStep*i+1-winStep):(winStep*i+winSize-winStep);
    dataRange=inputSignal(dataIndx);
    rms(i)=sqrt(1/winSize*sum(dataRange.^2));
    
    if i==winNum
        dataIndx=(winStep*i+winSize-winStep+1):N;
        dataRange=inputSignal(dataIndx);
        rms(i+1)=sqrt(1/winSize*sum(dataRange.^2));
    end
end
% [M,N]=size(rms);
% if M>N
%     rms=rms';
%     [M,N]=size(rms);
% end
% ma = max(rms);
% mi = min(rms);
% for i=1:N
% rms(i) = (rms(i)-mi)/(ma-mi);
% end
rmsEnv=smooth(rms,40,'moving');


