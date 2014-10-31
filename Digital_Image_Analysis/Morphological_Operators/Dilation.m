function img_out = Dilation(img_in, SE)
%Dilation is used to expand purticular part of an image
%you can use the same idea on color images
%
%img_in is one layer gray(logical 0&1) data
%SE is the structuring element, such as "9" , "+"
%   "9"      %    "+"
%   1 1 1    %   0 1 0
%   1 1 1    %   1 1 1
%   1 1 1    %   0 1 0

[rows , cols]=size(img_in);
img_out=zeros(rows, cols);
[r , c]=size(SE);

    for u = 1:rows
        for v = 1:cols
            if img_in(u,v)==1   %detect the center point
                
                for  seu= round(-(r-1)/2):round((r-1)/2);
                    for sev = round(-(c-1)/2):round((c-1)/2)
                        if (SE(seu+round(r/2),(sev+round(c/2)))>0 && 0<u+seu && u+seu<=rows  && 0<v+sev && v+sev<=cols)
                            img_out(u+seu,v+sev)=1;     %according to SE, expand center point
                        end
                    end
                end
                 
            end
        end
    end

end
