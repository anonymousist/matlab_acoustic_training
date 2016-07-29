filePath='C:\Users\Administrator\Desktop\android acoustic\analysis\ATR\*.txt';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\ATR\'
fileList=dir(filePath);
fileNum=length(fileList);
for i=1:fileNum
    name=fileList(i).name;
    fileName=strcat(pathStr,name);
    data=dlmread(fileName);
    % [b,a]=butter(3,[0.897,0.916],'bandpass');     % 19800hz~20200hz 20Khz  44.1Khz (f/fs)*2
    % filterData=filter(b,a,data);
    %rmsEnv=rmsEnvelope_test(filterData);
    figure;
    plot(data);
	legend(name);
end