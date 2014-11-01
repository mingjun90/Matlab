%this is a matlab script, not a function
%Author:Mingjun Li

%%%%%%%%%%%%%%_HIstogram-based Skin Color Detection_%%%%%%%%%%%%%%%%%%%%%%%
%Color based segmentation with application to flesh tone (skin color) detection

% 1.Collecting flesh tone training data. A couple of images are provided. It is very easy
% to find on the Web some color images contain skin color (people). You can crawl such
% images from the Web. Then, you should design a tool to collect skin pixels. Of course,
% a simple interface will do. E.g., you can use imcrop or ginput in Matlab. If you are
% using C++, you have to select pixels or small regions using a mouse.
%
% 2.Selecting a good color space. You'd better try a couple of color spaces, e.g., RGB,
% N-RGB, HSI, etc, before you make your decision.
%
% 3.Training a color histogram-based flesh tone detector. Basically, you just construct a 2D
% color histogram based on the color pixels you have collected, i.e., R-G, NR-NG, H-S,
% etc. Note: pay more attention to normalization.
%
% 4.Finding skin regions in test images. You apply your color detector to segment skin
% color regions in test images.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Before run this script, you should prepare flesh tone training
%data. Here are 7 different skin pictures.

%build the initial 2-D histogram data matrix, color_space H-S 
histo = zeros(360,100);     

%%%%%%%%%_Training a color histogram-based flesh tone detector_%%%%%%%%%
    img_in=imread('1.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in);   %color_space H-S 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);
   
    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     %if s0(u,v)==0 is not good
                s0(u,v)=0.01;
            end            
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    img_in=imread('2.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);
    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     
                s0(u,v)=0.01;
            end
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    img_in=imread('3.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);

    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01      
                s0(u,v)=0.01;
            end            
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    img_in=imread('4.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);

    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     
                s0(u,v)=0.01;
            end             
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    img_in=imread('5.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);

    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     
                s0(u,v)=0.01;
            end           
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    img_in=imread('6.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);

    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     
                s0(u,v)=0.01;
            end            
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    img_in=imread('7.jpg');
    [rows, cols]=size(img_in(:,:,1));
    hsv= rgb2hsv(img_in); 
    h0=hsv(:,:,1);
    s0=hsv(:,:,2);
    %v0=hsv(:,:,3);

    for u=1:rows
        for v=1:cols
            if h0(u,v)==0
                h0(u,v)=1;
            end
            if s0(u,v)<0.01     
                s0(u,v)=0.01;
            end             
            H = round(h0(u,v)*360);
            S = round(s0(u,v)*100);
            histo(H,S) = histo(H,S)+1;
        end
    end
    
%%%%%%%%%%%%%%%%_Consturct a 2D color histogram_%%%%%%%%%%%%%%%%%%%
    
    Hx = 1:360;
    Sy = 1:100;
    figure(10);
    surf(histo(Hx,Sy));     %output 2D-histogram(3D plot) 

%then use the histotest file to find skin regions


