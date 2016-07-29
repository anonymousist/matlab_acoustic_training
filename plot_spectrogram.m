
function plot_spectrogram(file)

SplitName = strsplit(file,'.');
name = SplitName{1}(1:1);
disp(name);
data = audioread(file);
[b,a]=butter(6,[18800/44100*2,19200/44100*2],'bandpass');     % 18700hz~19300hz 19Khz 44.1Khz (f/fs)*2
 fdata = filter(b,a,data);
 
 Fir = fir1(5000,[18985/44100*2,19015/44100*2],'stop');
 outdata = filter(Fir,1,fdata);
 
 spectrogram(outdata,8192,7680, 8192, 44100, 'yaxis');
 ylim([18.80 19.20]);
set(gcf,'color','white');
 title(name);