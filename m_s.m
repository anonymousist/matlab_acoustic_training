function cellList = formatdata()
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
fileNum=length(fileListSpeE);
formatdata={};
cellList={};
for i=1+50:fileNum-50
    Name=fileListrms(i).name;
    splitName=strsplit(Name,'.');
    fileName=strcat(rmsPathstr,Name);
    rmsdata=dlmread(fileName);
    
    Name=fileListatr(i).name;
    fileName=strcat(atrPathstr,Name);
    atrdata=dlmread(fileName);
    
    Name=fileListamr(i).name;
    fileName=strcat(amrPathstr,Name);
    amrdata=dlmread(fileName);
    
    Name=fileListzcr(i).name;
    fileName=strcat(zcrPathstr,Name);
    zcrdata=dlmread(fileName);
    
    Name=fileListSpeC(i).name;
    fileName=strcat(SpeCPathstr,Name);
    SpeCdata=dlmread(fileName);
    
    Name=fileListSpeF(i).name;
    fileName=strcat(SpeFPathstr,Name);
    SpeFdata=dlmread(fileName);
    
    Name=fileListSpeE(i).name;
    fileName=strcat(SpeEPathstr,Name);
    SpeEdata=dlmread(fileName);
    
    Name=fileListSpeR(i).name;
    fileName=strcat(SpeRPathstr,Name);
    SpeRdata=dlmread(fileName);
    
    labelS = splitName{1}(1:1);
	%labelN = str2num(labelS);
    %formatdata ={rmsdata,atrdata,amrdata,zcrdata,SpeCdata,SpeFdata,SpeEdata,SpeRdata,labelS};
	SEs = var(SpeEdata)
	formatdata ={SEs,labelS};
    cellList=[cellList;formatdata];
end
