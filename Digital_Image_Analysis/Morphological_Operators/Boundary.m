function [ img_out ] = Boundary( img_in, SE )
%Boundary is used to get the contour of purticular part of an image
%you can use the same idea on color images
%
%img_in is one layer gray(logical 0&1) data
%SE is the structuring element, such as "9" , "+"


[rows, cols]=size(img_in);

img_test = Erosion(img_in, SE);

for u = 1:rows
    for v = 1:cols
        img_in(u,v) = img_in(u,v) - img_test(u,v);
    end
end

img_out = img_in;

end
