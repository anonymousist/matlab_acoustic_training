folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
zcr_store_path = 'C:\Users\Administrator\Desktop\android acoustic\analysis\ZCR\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
	data = data/max(abs(data));
	%downS = downsample(data,10);
    zcr(data,Name,zcr_store_path);
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end