folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
speE_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\MFCC\';
fileList=dir(folderPath);
fileNum=length(fileList);
windowSize =8192;
step = 1024;
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	%downS = downsample(data,40);
    SpectralEntropy(data,windowSize,step,fftlen,numofbin,Name,speE_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end