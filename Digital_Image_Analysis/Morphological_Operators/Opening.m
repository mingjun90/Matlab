function [img_out] = Opening(img_in, SE)
%Opening is used to
%smooth contour, break narrow isthmuses,
%eliminate thin protrusion
%
%img_in is one layer gray(logical 0&1) data
%SE is the structuring element, such as "9" , "+"

img_ero = Erosion(img_in,SE);

img_out = Dilation(img_ero,SE);

end
