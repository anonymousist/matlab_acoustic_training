function rmsEnv=rmsEnvelope(inputSignal,name,path)
inputSignal = inputSignal / max(abs(inputSignal));
[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end

winSize=8192;
winStep=1024;
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
[M,N]=size(rms);
if M>N
    rms=rms';
    [M,N]=size(rms);
end
rms = rms/max(abs(rms));
% rmsEnv=smooth(rms,10,'moving');
rmsEnv = rms;
rmsEnv = rmsEnv';
 varStr = name;
 pathStr=path;
 newStr=[pathStr,varStr];
 dlmwrite(newStr,rmsEnv);

