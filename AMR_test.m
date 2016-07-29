function amrEnv=AMR(p,inputSignal)
[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end

%frameSize=30;
%frameNum=floor(N/frameSize);
%rms=[];
%for i=1:frameNum
    
%    dataIndx=(frameSize*i+1-frameSize):(frameSize*i);
%    dataRange=inputSignal(dataIndx);
%    rms(i)=sqrt(1/frameSize*sum(dataRange.^2));
    
%    if i==frameNum
%        dataIndx=(frameSize*i+1):N;
%        dataRange=inputSignal(dataIndx);
%        rms(i+1)=sqrt(1/frameSize*sum(dataRange.^2));
frameSize=30;
frameStep=15;
frameNum=floor((N+frameStep-frameSize)/frameStep);
rms=[];
for i=1:frameNum
    
    dataIndx=(frameStep*i+1-frameStep):(frameStep*i+frameSize-frameStep);
    dataRange=inputSignal(dataIndx);
    rms(i)=sqrt(1/frameSize*sum(dataRange.^2));
    
    if i==frameNum
        dataIndx=(frameStep*i+frameSize-frameStep+1):N;
        dataRange=inputSignal(dataIndx);
        rms(i+1)=sqrt(1/frameSize*sum(dataRange.^2));
    end
end
rmsEnv=smooth(rms,40,'moving');
amr =[];
winSize = 50;
winNum=floor(frameNum/winSize);
for j =1:winNum
    frameIndx=(winSize*j+1-winSize):(winSize*j);
    frameRange=rmsEnv(frameIndx);
    amr(j)= length(find(rms(frameIndx)>(p*mean(frameRange))))/winSize;
    if j==winNum
        frameIndx=(winSize*j+winSize):frameNum;
        frameRange=rmsEnv(frameIndx);
        amr(j+1)= length(find(rms(frameIndx)>p*mean(frameRange)))/winSize;
    end
end
%amrEnv = amr;
amrEnv=smooth(amr,3,'moving');
% [M,N]=size(amrEnv);
% if M>N
    % amrEnv=amrEnv';
    % [M,N]=size(amrEnv);
% end
% ma = max(amrEnv);
% mi = min(amrEnv);
% for i=1:N
% amrEnv(i) = (amrEnv(i)-mi)/(ma-mi);
% end
 % varStr = name;
 % pathStr=path;
 % newStr=[pathStr,varStr];
 % dlmwrite(newStr,amrEnv);

%p=1.18


    