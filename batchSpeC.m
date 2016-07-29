folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
speC_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\S_Centroid\';
fileList=dir(folderPath);
fileNum=length(fileList);
windowSize =8192;
step = 1024;
fs = 44100;
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	data = data/max(abs(data));
	%downS = downsample(data,40);
    SpectralCentroid_New(data,windowSize,step,fs,Name,speC_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end