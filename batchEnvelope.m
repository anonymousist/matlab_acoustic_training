folderPath='F:\Matlab Data\2151128\*.txt';
picFolder='F:\pic';
pathStr='F:\Matlab Data\2151128\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=1:fileNum
    name=fileList(i).name;
    fileName=strcat(pathStr,name);
    data=dlmread(fileName);
	data = data/max(abs(data));
%     [b,a]=butter(3,[0.517,0.586]);
%     filterData=filter(b,a,data);
%     rmsEnv=rmsEnv(filterData);
%     fig=figure;
%     subplot(211),plot(filterData);
%     subplot(212),plot(rmsEnv);
     fig = figure;
     plot(data);
    % splitName=strsplit(name,'.');
    % picName=strcat(picFolder,splitName{1});
    % saveas(fig,picName,'png');
    
end