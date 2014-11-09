function [ img_linear, img_quadric ] = LightingCorrection( img_in )
%Lighting correction: correct the lighting by tilting the image
%Author:Mingjun Li
    [rows, cols] = size(img_in);
%%%%%%%%%%%%%%%%%%%%%%_linear_%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a=-0.15;b=0.15;
    c=256-b*cols;
    x=0:1:rows;
    y=0:1:cols;

    [x y]=meshgrid(x,y);
    z=a*x+b*y+c;
    figure(1);
    surf(x,y,z);	%3D-plot of linear plane 
    
    lcl=zeros(rows, cols);
    lcl_m=zeros(rows, cols);
    lcl_out=zeros(rows, cols);
    for u = 1:rows
        for v = 1:cols
           %build a matrix that store the height data
            lcl(u,v) = round(a*u+b*v+c);
        end
    end
    
%    figure(3);
%    imshow(lcl, [0 255]);
    
    for u = 1:rows
        for v = 1:cols
	    %use the 3D-plane to process the img_in
            lcl_m(u,v) = round(245-(a*u+b*v+c));
            lcl_out(u,v) = img_in(u,v) + lcl_m(u,v);
        end
    end
    
    figure(4);
    imshow(lcl_out, [0 255]);	%new image after linear process
    img_linear=lcl_out;
   
%%%%%%%%%%%%%%%%%%%%%%_quadratic_%%%%%%%%%%%%%%%%%%%%%%%%
   
   
    aq=0.1;
    z = @(x,y)4 + (0.05*y-6.4).^2 - aq*x+30;
    x = linspace(0,255,255);
    y = linspace(0,255,255);
    [x,y] = meshgrid(x,y);
%     figure(4);
%     surf(x,y,z(x,y),'FaceAlpha',0.5);		 %quadric surface
    figure(5);
    surf(x,y,55-z(x,y),'FaceAlpha',0.5);      %quadric surface'
    
    lcq_m=zeros(rows, cols);
    lcq_out=zeros(rows, cols);
    for u = 1:rows
        for v = 1:cols
	    %use the 3D-quadric surface to process the img_in
            lcq_m(u,v) = round(55-z(u,v));
            lcq_out(u,v) = img_in(u,v) + lcq_m(u,v);
        end
    end
    
   figure(6);
   imshow(lcq_out, [0 255]);	%new image after quadric process
   img_quadric=lcq_out;

end

