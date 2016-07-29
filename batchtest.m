function peakindex = batchtest(inputsignal)
pathStr='F:\Matlab Data\splitdata\';
nf = 650;
span =20;
peakdistance = 40000;
peakindex = [];
[lined_data,peaks,locs] = findpeak(inputsignal,nf,span);
j=2;
peakindex(1)=locs(1);
for i=2:length(locs)
    if (locs(i)-locs(i-1))>peakdistance
    peakindex(j)=locs(i);
    j=j+1;
    end
end

for i=1:length(peakindex)-1
    dataIndex = peakindex(i):peakindex(i+1);
    datarange= inputsignal(dataIndex);
    varStr=inputname(1);
    newStr=[pathStr,varStr,'_',int2str(i),'.txt'];
    dlmwrite(newStr,datarange);
end
