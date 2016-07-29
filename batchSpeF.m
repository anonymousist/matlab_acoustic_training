folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
speF_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\S_Flux\';
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
	%downS = downsample(filterData,40);
    SpectralFlux_New(data,windowSize,step,fs,Name,speF_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end