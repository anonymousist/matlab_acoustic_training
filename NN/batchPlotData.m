folderPath='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\*.txt';
picFolder='F:\pic';
pathStr='C:\Users\Administrator\Desktop\android acoustic\analysis\Splitdata\';
fileList=dir(folderPath);
fileNum=length(fileList);
for i=6500:7200
    name=fileList(i).name;
    fileName=strcat(pathStr,name);
    data=dlmread(fileName);
	%data = data/2;
	% [b,a]=butter(3,0.2526,'low');     % 18800hz~19200hz 19Khz 44.1Khz (f/fs)*2
	  % fdata = filter(b,a,data);
	  % nf = 0.02;
	  % span=20;
      % peakindex = [];
      % peakdistance = 30000;
      % [lined_data,peaks,locs] = findpeak(fdata,nf,span); %find peak
      % j=2;
      % peakindex(1)=locs(1);
      % for i=2:length(locs)
      % if (locs(i)-locs(i-1))>peakdistance
      % peakindex(j)=locs(i);
      % j=j+1;
      % end
     % end
      % data(peakindex)=0.7;
	  % wavwrite(data,fileName);
%     [b,a]=butter(3,[0.517,0.586]);
%     filterData=filter(b,a,data);
%     rmsEnv=rmsEnv(filterData);
%     fig=figure;
%     subplot(211),plot(filterData);
%     subplot(212),plot(rmsEnv);
      fig = figure;
      plot(data);
	  legend(name)
    % splitName=strsplit(name,'.');
    % picName=strcat(picFolder,splitName{1});
    % saveas(fig,picName,'png');
    
end