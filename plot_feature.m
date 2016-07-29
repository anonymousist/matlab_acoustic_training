% function cellList = formatdata()
folderPathstr='F:\Matlab Data\formatdata\';
rmsPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\RMS\';
atrPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\ATR\';
amrPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\AMR\';
zcrPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\ZCR\';
SpeCPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Centroid\';
SpeRPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Rolloff\';
SpeFPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Flux\';
SpeEPathstr='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Entropy\';
rmsPath='C:\Users\Administrator\Desktop\android acoustic\analysis\RMS\*.txt';
atrPath='C:\Users\Administrator\Desktop\android acoustic\analysis\ATR\*.txt';
amrPath='C:\Users\Administrator\Desktop\android acoustic\analysis\AMR\*.txt';
zcrPath='C:\Users\Administrator\Desktop\android acoustic\analysis\ZCR\*.txt';
SpeCPath='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Centroid\*.txt';
SpeRPath='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Rolloff\*.txt';
SpeFPath='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Flux\*.txt';
SpeEPath='C:\Users\Administrator\Desktop\android acoustic\analysis\S_Entropy\*.txt';
fileListrms=dir(rmsPath);
fileListatr=dir(atrPath);
fileListamr=dir(amrPath);
fileListzcr=dir(zcrPath);
fileListSpeC=dir(SpeCPath);
fileListSpeF=dir(SpeFPath);
fileListSpeE=dir(SpeEPath);
fileListSpeR=dir(SpeRPath);
fileNum=length(fileListrms);
step = 50;
arrange = 20;
formatdata={};
cellList={};
for i=0:9
	for j=(i*step+1):(i*step+arrange)
		Name=fileListrms(j).name;
		splitName=strsplit(Name,'.');
		fileName=strcat(rmsPathstr,Name);
		rmsdata=dlmread(fileName);
    
		Name=fileListatr(j).name;
		fileName=strcat(atrPathstr,Name);
		atrdata=dlmread(fileName);
    
		Name=fileListamr(j).name;
		fileName=strcat(amrPathstr,Name);
		amrdata=dlmread(fileName);
    
		Name=fileListzcr(j).name;
		fileName=strcat(zcrPathstr,Name);
		zcrdata=dlmread(fileName);
    
		Name=fileListSpeC(j).name;
		fileName=strcat(SpeCPathstr,Name);
		SpeCdata=dlmread(fileName);
		
		Name=fileListSpeF(j).name;
		fileName=strcat(SpeFPathstr,Name);
		SpeFdata=dlmread(fileName);
    
		Name=fileListSpeE(j).name;
		fileName=strcat(SpeEPathstr,Name);
		SpeEdata=dlmread(fileName);
    av
		Name=fileListSpeR(j).name;
		fileName=strcat(SpeRPathstr,Name);
		SpeRdata=dlmread(fileName);
		
		figure;
		subplot(811);plot(rmsdata);
		subplot(812);plot(atrdata);
		subplot(813);plot(amrdata);
		subplot(814);plot(zcrdata);
		subplot(815);plot(SpeCdata);
		subplot(816);plot(SpeFdata);
		subplot(817);plot(SpeEdata);
		subplot(818);plot(SpeRdata);

		end
    % labelS = splitName{1}(1:1);
	% %labelN = str2num(labelS);
    % %formatdata ={rmsdata,atrdata,amrdata,zcrdata,SpeCdata,SpeFdata,SpeEdata,SpeRdata,labelS};
	% formatdata ={atrdata,amrdata,SpeCdata,SpeFdata,SpeEdata,SpeRdata,labelS};
    % cellList=[cellList;formatdata];
end
