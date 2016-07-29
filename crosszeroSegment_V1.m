function Points=crosszeroSegment_V1(signal)

[M,N]=size(signal);
if M<=N
    signal=signal';
    [M,N]=size(signal);
end

windowsize=5;
windowGap=3;
Varthreshold=12;
Avrthreshold=15;
windowNum=floor((M+windowGap-windowsize)/windowGap);

windowIndx=0;
windowLabel=0;
windowProp=[];

disp(windowNum);
for i=1:windowNum
    Range=(windowGap*i+1-windowGap):(windowGap*i+windowsize-windowGap);
    windowY=signal(Range,2);
    windowVar=var(windowY);
    windowAvr=mean(windowY);
    windowIndx=windowIndx+1;  
    if windowVar<=Varthreshold
        windowLabel=0;
    else
        windowLabel=1;
    end
    windowProp=[windowProp;windowIndx,windowAvr,windowVar,windowLabel];
end

disp(windowProp);
average=0;
Points=[];
for i=1:windowNum       
    if abs(windowProp(i,2))>=Avrthreshold
        windowProp(i,4)=1;
    else
        if i>1 && i<windowNum-1 && windowProp(i-1,4)==1 && windowProp(i+1,4)==1
            windowProp(i,4)=1;
        end
    end
      
    if windowProp(i,4)==0
        average=(average*(i-1)*windowsize+sum(signal(windowGap*i+1-windowGap:windowGap*i+5-windowGap,2)))/(i*windowsize);
    elseif  windowProp(i,4)==1 && abs(windowProp(i,2))<Avrthreshold
        indxRange=(windowGap*i+1-windowGap):(windowGap*i+5-windowGap);
        yRange=signal(indxRange,2);
        posIndx=indxRange(find(min(abs(yRange-average))));
        posX=signal(posIndx,1);
        posY=signal(posIndx,2);
        Points=[Points;posIndx,posX,posY];
    elseif windowProp(i,4)==1 && abs(windowProp(i,2))>=Avrthreshold
        indxRange=(windowGap*i+1-windowGap):(windowGap*i+5-windowGap);
        yRange=signal(indxRange,2);
        if length(find(yRange>=average))>=1 && length(find(yRange<average))>=1
            posIndx=indxRange(find(min(abs(yRange-average))));
            posX=signal(posIndx,1);
            posY=signal(posIndx,2);
            Points=[Points;posIndx,posX,posY];
        end  
    end
end



%===================================================================================================
% Merge 
K=size(Points,1);
i=1;
while i<=K-1
    if (Points(i+1,1)-Points(i,1))<50
        indxRange=Points(i,1):Points(i+1,1);
        yRange=signal(indxRange,2);
        adjPosIndx=indxRange(find(min(abs(yRange-average))));
        adjPosX=signal(adjPosIndx,1);
        adjPosY=signal(adjPosIndx,2);
        Points(i,:)=[adjPosIndx adjPosX adjPosY];
        Points(i+1,:)=[];
        i=i-1;
        K=K-1;
    end
    i=i+1;
end

end