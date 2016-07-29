folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\original_data_wrz\*.wav';
%picFolder='F:\pic';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\original_data_wrz\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=audioread(fileName);
    splitdata(data,splitName{1});
   % splitName=strsplit(name,'.');
   % picName=strcat(picFolder,splitName{1});
   % saveas(fig,picName,'png');
    
end


