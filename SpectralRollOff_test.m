function mC = SpectralRollOff_test(signal,windowLength, step, c, fs)
% c = 0.95
signal = signal / max(abs(signal));
curPos = 1;
L = length(signal);
numOfFrames = (L-windowLength)/step + 1;
H = hamming(windowLength);
m = [0:windowLength-1]';
for (i=1:numOfFrames)
    window = H.*(signal(curPos:curPos+windowLength-1));    
    FFT = (abs(fft(window,2*windowLength)));
    FFT = FFT(1:windowLength);
    totalEnergy = sum(FFT.^2);
    curEnergy = 0.0;
    countFFT = 1;
    while ((curEnergy<=c*totalEnergy) && (countFFT<=windowLength))
        curEnergy = curEnergy + FFT(countFFT).^2;
        countFFT = countFFT + 1;
    end
   % mC(i) = ((countFFT-1))/(fs/2);
   mC(i) = countFFT-1;
    curPos = curPos + step;
end
% [M,N]=size(mC);
% if M>N
    % mC=inputSignal';
    % [M,N]=size(mC);
% end
% ma = max(mC);
% mi = min(mC);
% for i=1:N
% mC(i) = (mC(i)-mi)/(ma-mi);
% end
% varStr = name;
 % pathStr=path;
 % newStr=[pathStr,varStr];
 % dlmwrite(newStr,mC);