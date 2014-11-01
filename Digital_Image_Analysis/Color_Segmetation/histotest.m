%this is a matlab script, not a function
%Author:Mingjun Li

%%%%%%%%%%%%_Finding skin regions in test images_%%%%%%%%%%%%%%%%

    img_test=imread('pointer1.bmp');
    [rows, cols]=size(img_test(:,:,1));
    hsvt= rgb2hsv(img_test);    %color_space H-S
    h1=hsvt(:,:,1);
    s1=hsvt(:,:,2);
    v1=hsvt(:,:,3);
    
    for u=1:rows
        for v=1:cols
            if h1(u,v)==0
                h1(u,v)=1;  %Hue 0=360
            end
            if s1(u,v)<0.01
                s1(u,v)=0.01;   %s=0->error
            end
            
            H = round(h1(u,v)*360);
            S = round(s1(u,v)*100);
           
            %change this threshold, the performance is good
            if histo(H,S)<80    
                v1(u,v)=0;
            end
                
        end
    end
    
    hsvt(:,:,3)=v1;
    img_out=hsv2rgb(hsvt);
    figure(1)
    imshow(img_out);
    
    
    
