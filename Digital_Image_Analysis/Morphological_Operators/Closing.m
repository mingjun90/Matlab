function [img_out] = Closing(img_in, SE )
%Closing is used to
%smooth contour, fues narrow breaks and long thin gulfs,
%eliminate small holes, fill in gaps on contours
%
%img_in is one layer gray(logical 0&1) data
%SE is the structuring element, such as "9" , "+"

img_dil = Dilation(img_in,SE);

img_out = Erosion(img_dil,SE);

end
