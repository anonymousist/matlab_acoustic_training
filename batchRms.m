folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
%picFolder='F:\pic';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
rms_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\RMS\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	data = data/max(abs(data));
	downS = downsample(data,40);
    rmsEnvelope(downS,Name,rms_store_path);
    
end
