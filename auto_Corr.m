function acf = auto_Corr(inputSignal,name,path)
inputSignal = inputSignal / max(abs(inputSignal));
[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end
acf = autocorr(inputSignal);
acf = acf / max(abs(acf));
acf = acf';
 varStr = name;
 pathStr=path;
 newStr=[pathStr,varStr];
 dlmwrite(newStr,acf);
