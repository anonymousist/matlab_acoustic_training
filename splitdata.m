function datarange = splitdata(inputsignal,name)
pathStr='C:\Users\Administrator\Desktop\spectrogram\spark_remove1\wrz\';
nf = 0.4;
span =20;
peakdistance = 29000;
peakindex = [];
[lined_data,peaks,locs] = findpeak(inputsignal,nf,span); %find peak
j=2;
peakindex(1)=locs(1);
for i=2:length(locs)
    if (locs(i)-locs(i-1))>peakdistance
    peakindex(j)=locs(i);
    j=j+1;
    end
end

for i=1:length(peakindex)-1
    dataIndex = (peakindex(i)+2000):(peakindex(i+1));
    datarange= inputsignal(dataIndex);
	datarange = datarange/max(abs(datarange));
% 	[b,a]=butter(6,[0.8526,0.8707],'bandpass');     % 18800hz~19200hz 19Khz 44.1Khz (f/fs)*2
% 	filterData=filter(b,a,datarange);
% 	Fir = fir1(5000,[18985/44100*2,19015/44100*2],'stop');
%     outdata = filter(Fir,1,filterData);
    %varStr=inputname(1);
    varStr = name;
    %newStr=[pathStr,varStr,'_',int2str(i),'.txt'];
	newStr=[pathStr,varStr,'.txt'];
    dlmwrite(newStr,datarange);
end
