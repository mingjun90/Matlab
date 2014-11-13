function img_smh = GaussSmoothing(img_in, hsize, sigma)
% GaussSmoothing Summary of this function goes here
% Detailed explanation goes here
% Author:Mingjun Li

% h = fspecial('gaussian', hsize, sigma) returns a rotationally 
% symmetric Gaussian lowpass filter of size hsize with standard 
% deviation sigma (positive). hsize can be a vector specifying 
% the number of rows and columns in h, or it can be a scalar, in 
% which case h is a square matrix. The default value for hsize 
% is [3 3]; the default value for sigma is 0.5.

% hsize =3;
% sigma = 3;

Gmask = fspecial('gaussian', [hsize,hsize], sigma);
% or use function GauSmoFilter which I made by myself

% figure(1);
% imshow(Gmask);
% figure(2);
% surf(Gmask);

img_in = double(img_in);    % to avoid the warning from next conv2()
img_smh = conv2(img_in, Gmask, 'same');

end
