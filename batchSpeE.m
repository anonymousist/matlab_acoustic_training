folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
speE_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\S_Entropy\';
fileList=dir(folderPath);
fileNum=length(fileList);
windowSize =8192;
step = 1024;
fftlen = 8192;
numofbin = 8192;
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	data = data/max(abs(data));
	%downS = downsample(data,40);
    SpectralEntropy_New(data,windowSize,step,fftlen,numofbin,Name,speE_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end