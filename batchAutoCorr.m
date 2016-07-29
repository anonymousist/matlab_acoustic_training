folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
%picFolder='F:\pic';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
AutoCorr_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\AutoCorr\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	data = data/max(abs(data));
	downS = downsample(data,40);
    auto_Corr(downS,Name,AutoCorr_store_path);
    
end
