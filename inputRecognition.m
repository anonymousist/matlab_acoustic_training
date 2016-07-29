% data = dlmread('F:\input\channel0.txt');
% nf = 700;
% span =20;
% peakdistance = 40000;
% peakindex = [];
% [lined_data,peaks,locs] = findpeak(data,nf,span);
% j=2;
% peakindex(1)=locs(1);
% for i=2:length(locs)
%     if (locs(i)-locs(i-1))>peakdistance
%     peakindex(j)=locs(i);
%     j=j+1;
%     end
% end
% path = 'F:\inputFeature\';
% NumData = {};
% for i=1:length(peakindex)-1
%     dataIndex = peakindex(i):peakindex(i+1);
%     datarange= data(dataIndex);
% %     %varStr=inputname(1);
% %     varStr = name;
% %     newStr=[pathStr,varStr,'_',int2str(i),'.txt'];
% %     dlmwrite(newStr,datarange);
%       [b,a]=butter(3,[0.517,0.586]);
%        filterData=filter(b,a,datarange);
%        downS = downsample(filterData,40);
% rmsEnv = rmsEnvelope(downS,'rms.txt',path);
% p=1.18;
% k=2;
% windowLength = 1500;
% step = 750;
% fs = 58000;
% fftLength = 1500;
% numOfBins = 1500;
% c=0.8;
% amrEnv = AMR(p,downS,'amr.txt',path);
% atrEnv = ATR(k,downS,'atr.txt',path);
% zcrEnv = zcr(downS,'zcr.txt',path);
% SC = SpectralCentroid(downS,windowLength,step,fs,'SC.txt',path);
% SE = SpectralEntropy(downS,windowLength,step, fftLength, numOfBins,'SE.txt',path);
% SF = SpectralFlux(downS,windowLength,step,fs,'SF.txt',path);
% SR = SpectralRollOff(downS,windowLength, step, c, fs, 'SR.txt', path);
% NumData ={rmsEnv,atrEnv,amrEnv,zcrEnv,SC,SF,SE,SR,label};
%var = {z0;z1;z2;z3;z4;z5;z6;z7;z8;z9};
%for i = 1:10  
 %pause(1);
clf
pause(1);
label = KNN_DTW(trainData,var{10},9);
% end
num = num2str(label);
clf
text(0.3,0.5,num,'FontSize',200)
axis off
%pause(1);
%end
% disp(label);