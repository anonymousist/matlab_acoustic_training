function [lined_data,peaks,locs] = findpeak(x,nf,span)

%Function used to get the peaks (local maxima) from the given data 
% [lined_data,peaks,locs] = findpeak(x,nf)
% lined_data => peaks in the locations 
% peaks => Just the peak values
% locs => location at which peaks are occuring
% x => data for which peaks have to be obtained
% nf => Noise Floor
% span => span of the moving average required


for j=1:length(x(:,1))
        if(x(j)>=(nf))
            x(j)=x(j);
        end 
        if(x(j)<(nf))                                                      %Taking the values above the noise floor
            x(j)=nf;                                                       %Assigning the minimum value as noise floor magnitude
        end
end



x_smoothed=smooth(x-min(x),span,'moving');                                   %smoothing the shifted current snapshot
%20 is decided based on the type of data that is taken. It is like a cutoff
%frequency for a LPF.This moving average actually helps the findpeaks()
%function defined in Matlab library to decide the peak more efficiently
%especially in the case of experimental results when there is randomness
%in the data obtained.

[peaks,locs]=findpeaks(x_smoothed);                                        %get the peaks from the data

lined_data=zeros(1,length(x));                                             %lined data will have peaks at locations
lined_data(locs)=peaks;                                                    
lined_data=lined_data+min(x);                                              %shifting it back to original values

peaks=peaks+min(x);                                                        %Shifting it back to its original values

end

