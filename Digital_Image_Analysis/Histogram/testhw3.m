%%332 hw3 test file

    clear
    %close all

    img_in = rgb2gray(imread('moon.bmp','bmp'));
    figure(1); 
    imshow(img_in, [0 255]);

    img_he = HistoEqualization( img_in );

    [img_linear, img_quadric] = LightingCorrection( img_he );
