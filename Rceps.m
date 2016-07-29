function Rceps(inputsignal,windowSize,winStep,Name,speRCEPS_store_path)

inputsignal = inputsignal/max(abs(inputsignal));
[M,N]=size(inputSignal);
if M>N
    inputSignal=inputSignal';
    [M,N]=size(inputSignal);
end
curPos = 1;
numOfWins = floor((n-windowSize)/winStep) + 1;

for i = 1:numOfWins
	