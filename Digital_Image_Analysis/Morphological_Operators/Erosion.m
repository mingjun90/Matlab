function img_out = Erosion(img_in, SE)
%Erosion is used to shrink purticular part of an image
%you can use the same idea on color images
%Author:Mingjun Li
%img_in is one layer gray(logical 0&1) data
%SE is the structuring element, such as "9" , "+"
%   "9"      %    "+"
%   1 1 1    %   0 1 0
%   1 1 1    %   1 1 1
%   1 1 1    %   0 1 0

[rows cols]=size(img_in);
img_out=zeros(rows, cols);
[r c]=size(SE);

    for u = 1:rows
        for v = 1:cols
            if img_in(u,v)==1   %1 means white data
                k=0;
                
                for  seu= round(-(r-1)/2):round((r-1)/2);
                    for sev = round(-(c-1)/2):round((c-1)/2)
                        if (0<u+seu && u+seu<=rows  && 0<v+sev && v+sev<=cols && SE(seu+round(r/2),(sev+round(c/2)))<=img_in(u+seu,v+sev))
                            k=k+1;  %count the matching point of SE
                        end 
                    end
                end
                
                %if SE matches, keep the center point
                if k==r*c
                    img_out(u,v)=1;
                end
            end
        end
    end

end
