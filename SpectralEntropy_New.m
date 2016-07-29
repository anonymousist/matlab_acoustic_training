function En = SpectralEntropy_New(signal,windowLength,windowStep, fftLength, numOfBins,name,path)
signal = signal / max(abs(signal));
curPos = 1;
L = length(signal);
numOfFrames = floor((L-windowLength)/windowStep) + 1;
H = hamming(windowLength);
En = zeros(numOfFrames,1);
for i=1:numOfFrames
    window = (H.*signal(curPos:curPos+windowLength-1));
    fftTemp = abs(fft(window,2*fftLength));
    fftTemp = fftTemp(1:fftLength);
    Pow = fftTemp.^2/fftLength;    
    p = Pow/sum(Pow);
    En(i) = -sum(p.*log(p));
    curPos = curPos + windowStep;
end
 % [M,N]=size(En);
% if M>N
    % En=En';
    % [M,N]=size(En);
% end
 % ma = max(En);
 % mi = min(En);
 % for i=1:N
 % En(i) = (En(i)-mi)/(ma-mi);
 % end
 %En = En / max(abs(En));
varStr = name;
 pathStr=path;
 newStr=[pathStr,varStr];
 dlmwrite(newStr,En);