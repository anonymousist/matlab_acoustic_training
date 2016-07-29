function atrEnv=ATR(k,inputSignal)

[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end

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
%rmsEnv=rms; 
atr =[];
winSize = 50;
winNum=floor(frameNum/winSize);
for j =1:winNum
    frameIndx=(winSize*j+1-winSize):(winSize*j);
    frameRange=rmsEnv(frameIndx);
    sortframe = sort(frameRange,'descend');
    %top_k_frameIndx=(winSize*j+1-winSize):(winSize*j+k);
   % top_k_frames_range=sortframe(top_k_frameIndx);
    atr(j)=sum(sortframe(1:k))/k;
    if j==winNum&&((winSize*j+winSize+1)<frameNum)
        frameIndx=(winSize*j+winSize+1):frameNum;
        frameRange=rmsEnv(frameIndx);
        sortframe = sort(frameRange,'descend');
   % top_k_frameIndx=(winSize*j+1-winSize):(winSize*j+k);
    %top_k_frames_range=sortframe(top_k_frameIndx);
        atr(j+1)=sum(sortframe(1:k))/k;
    end
end
atrEnv = atr;
% [M,N]=size(atr);
% if M>N
    % atr=atr';
    % [M,N]=size(atr);
% end
% ma = max(atr);
% mi = min(atr);
% for i=1:N
% atrEnv(i) = (atrEnv(i)-mi)/(ma-mi);
% end
 % varStr = name;
 % pathStr=path;
 % newStr=[pathStr,varStr];
 %dlmwrite(newStr,atrEnv);


    