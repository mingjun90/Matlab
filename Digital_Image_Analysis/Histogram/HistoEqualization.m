function [ img_out ] = HistoEqualization( img_in )
%Histogram is a discrete representaton of the distribution 
%on the quantized pixel attributes
%

%%%%%%%%%%%%%%%%%%%%%%_histogram_%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [rows cols] = size(img_in);
    ht=zeros(1 , 256);     %array %pixel data 0-255 -> #=256
    
    for u = 1:rows
        for v = 1:cols
           %counting the frequency of 0-255
            ht(img_in(u,v)+1) = ht(img_in(u,v)+1) + 1;
        end
    end
    
    r = 0:255;
    h=zeros(1,256);
    h(r+1)=ht(r+1)/(rows*cols);     %/(rows*cols) pixel intensities
    figure(10);
    subplot(3,1,1);	
    plot(r,h(r+1));	%normal histogram
        
%%%%%%%%%%%%%%%%%%%%%%%_find a transformation_%%%%%%%%%%%%%%%%

    Tt=zeros(1, 256);
    Tt(1) = h(1);
    
    for k = 2:256     
            Tt(k)=Tt(k-1)+h(k);
    end
    
    subplot(3,1,2);	 
    T(r+1)=Tt(r+1)/Tt(256);
    plot(r,T(r+1));	%transformation

%%%%%%%%%%%%%%%%%%%%%%_equalizatoin_%%%%%%%%%%%%%%%%%%%%%%%%%%%


    L=256;
    for u = 1:rows
        for v = 1:cols
           %according to  transformation, calculate the new image data 
            img_out(u,v) = floor((L-1)*T(img_in(u,v)+1));
        end
    end
    
    het=zeros(1,256);
    for u = 1:rows
        for v = 1:cols
           
            het(img_out(u,v)+1) = het(img_out(u,v)+1) + 1;
        end
    end
    
    hE(r+1)=het(r+1)/(rows*cols);     %%/(rows*cols) pixel intensities
    
    subplot(3,1,3);
    plot(r,hE(r+1));	%histogram of new image
    
    figure(11);
    imshow(img_out,[0 255]);	%new image
   
end

