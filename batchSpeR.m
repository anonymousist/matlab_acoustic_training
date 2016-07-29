folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
speR_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\S_Rolloff\';
fileList=dir(folderPath);
fileNum=length(fileList);
windowSize =8192;
step = 1024;
fs = 44100;
C = 0.8;
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	%downS = downsample(filterData,40);
    SpectralRollOff_New(data,windowSize,step,C,fs,Name,speR_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end