folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
%picFolder='F:\pic';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
fileList=dir(folderPath);
fileNum=length(fileList);
Fir = fir1(5000,[18985/44100*2,19015/44100*2],'stop');
for i=1:fileNum
    Name=fileList(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(pathStr,Name);
    data=dlmread(fileName);
    outdata = filter(Fir,1,data);
    newStr = [pathStr,Name];
    dlmwrite(newStr,outdata);
end