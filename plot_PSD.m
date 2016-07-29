FilePath ='C:\Users\Administrator\Desktop\android acoustic\analysis\original_data\*.wav';
PathStr ='C:\Users\Administrator\Desktop\android acoustic\analysis\original_data\';
fileList = dir(FilePath);
fileNum = length(fileList);
for i = 51:51
	Name = fileList(i).name;
	fileName = strcat(PathStr,Name);
	data = wavread(fileName);
	data = data/max(abs(data));
	[b,a]=butter(3,[0.8526,0.8707],'bandpass');     % 18800hz~19200hz 19Khz 44.1Khz (f/fs)*2
	filterData=filter(b,a,data);
	windowSize = 11025;
	%windowStep = 512;
	fftLen = 11025;
	fs = 44100;
	windowNum = floor(length(data)/windowSize)+1;
	
	% figure;
	% plot(data);
	for j = 0:windowNum-1
        if j == (windowNum-1)
			data_index=(windowNum*j+1):length(data);
			dataRange=data(data_index);
			%figure;
			%plot(dataRange);
			[pxx,f] = pwelch(dataRange,windowSize,[],fftLen,fs);
			figure;
			plot(f,10*log10(pxx));
            break;
		end
		data_index=(windowSize*j+1):(windowSize*j+windowSize);
		dataRange = data(data_index);
		%figure;
		%plot(dataRange);
		%sprintf('%f',data_index);
		%hold on;
		%plot(data_index);
		[pxx,f] = pwelch(dataRange,windowSize,[],fftLen,fs);
		figure;
		plot(f,10*log10(pxx));
		
	end
end