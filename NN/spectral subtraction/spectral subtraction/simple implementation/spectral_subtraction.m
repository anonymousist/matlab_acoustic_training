%[sig fs] = read_NIST_file(filename); % read the input file, assume filename is supplied
%[sig fs] = audioread('A_1.wav');
%sig = sig(10000:end);
fs = 44100;
sig = fdata;
% spectrogram(sig,8192,7680, 8192, 44100, 'yaxis');
%  ylim([18.80 19.20]);
%  figure
% [b,a]=butter(3,[18850/44100*2,19150/44100*2],'bandpass');     % 18700hz~19300hz 19Khz 44.1Khz (f/fs)*2
%  fdata = filter(b,a,sig);
% %  spectrogram(fdata,8192,7680, 8192, 44100, 'yaxis');
% %  ylim([18.80 19.20]);
% %  figure
%  Fir = fir1(5000,[18985/44100*2,19015/44100*2],'stop');
%  outdata = filter(Fir,1,fdata);
%  spectrogram(outdata,8192,7680, 8192, 44100, 'yaxis');
%  ylim([18.80 19.20]);
%  figure
NFFT = 8192;
WINLEN = 8192; %frame length in ms
WINSTEP = 64;
frames = frame_sig(sig, WINLEN, WINSTEP, @hamming);
cspec = fft(frames,NFFT,2); % complex spectrum
pspec = abs(cspec).^2; % power spectrum of noisy signal
phase = angle(cspec);
 
% do spectral subtraction, produce modified_pspec
noise_est = mean(pspec(1:2,:)); % noise_est is estimated from first three frames
clean_spec = pspec - repmat(noise_est, size(pspec,1),1); % subtract noise_est from pspec
clean_spec(clean_spec < 0) = 0; % negative power spectrum is not allowed
 
reconstructed_frames = ifft(sqrt(clean_spec).*exp(phase), NFFT,2);
reconstructed_frames = real(reconstructed_frames(:,1:WINLEN)); % sometimes small complex residuals stay behind
enhanced_signal = deframe_sig(reconstructed_frames, length(sig), WINLEN, WINSTEP, @hamming);
 
soundsc(enhanced_signal,fs); % listen to our enhanced signal
 spectrogram(enhanced_signal,8192,8192-1024, 8192, 44100, 'yaxis');
 ylim([18.80 19.20]);