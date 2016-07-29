function test(data)

data = data/max(abs(data));
	[b,a]=butter(3,[0.8526,0.8707],'bandpass');     % 18800hz~19200hz 19Khz 44.1Khz (f/fs)*2
	filterData=filter(b,a,data);
	windowSize = 4096;
	windowStep = 1024;
	fftLen = 4096;
	fs = 44100;
	windowNum = floor(length(filterData)/windowSize)+1;
	
	for j = 0:windowNum-1
		data_index=(windowNum*j+1):(windowNum*j+windowSize);
		dataRange = filterData(data_index);
		[pxx,f] = pwelch(dataRange,windowSize,[],fftLen,fs);
		figure;
		plot(f,10*log10(pxx));
		if j == windowNum-1
		data_index=(windowNum*j+1):length(filterData);
		dataRange=filterData(data_index);
		[pxx,f] = pwelch(dataRange,windowSize,[],fftLen,fs);
		figure;
		plot(f,10*log10(pxx));
		end
	 end