function spectroanalysis(data)
% [b,a]=butter(3,[18700/44100*2,19300/44100*2],'bandpass');     % 18700hz~19300hz 19Khz 44.1Khz (f/fs)*2
% fdata = filter(b,a,data);

% Fir = fir1(5000,[18985/44100*2,19015/44100*2],'stop');
% outdata = filter(Fir,1,fdata);

% y = fft(outdata);
% len = length(y);
% x = 44100/len*(0:len/2);
% yy = abs(y);
% hold on
% plot(x,yy(1:len/2+1));
% figure
% recObj = audiorecorder(44100, 16, 1);


% disp('Start speaking.')
% recordblocking(recObj, 5);
% disp('End of Recording.');
% % Store data in double-precision array.
% myRecording = getaudiodata(recObj);

windowLength =8192;
step = 1024;
fs = 44100;
signal = data / max(abs(data));
curPos = 1;
L = length(signal);
numOfFrames = floor((L-windowLength)/step) + 1;
H = hamming(windowLength);
m = ((fs/(2*windowLength))*[1:windowLength])';
tic
for i=1:numOfFrames
    window = H.*(signal(curPos:curPos+windowLength-1));  
    ftr = fft(window,2*windowLength);
    FFT = (abs(ftr));
    FFT = FFT(1:windowLength);  
%     Angle = angle(ftr);
    % plot(windowLength,Angle(1:windowLength));
   % plot(m(floor(windowLength*239/280):floor(windowLength*244/280)),FFT(floor(windowLength*239/280):floor(windowLength*244/280)),'LineWidth',2)
   plot(m(3492*2:3567*2),FFT(3492*2:3567*2),'LineWidth',2)
   ylim([0 500]);
   % plot(m,FFT);
    pause(0.1);
    %
   curPos = curPos + step;
end
toc
disp(i)