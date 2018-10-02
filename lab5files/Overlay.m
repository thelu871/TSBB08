% ###########
% Overlay tip
% ###########
function overlay = overlay(image) 
% Read a colour image
% ===================
im1 = double(imread('C9minpeps2.bmp'));
figure(50), imshow(im1/255);
image_double = logical(double(image));
% Get the three colour components RGB
% ===================================
im1r=im1(:,:,1); im1g=im1(:,:,2); im1b=im1(:,:,3);

% Produce a mask image with an overlay pattern
% ============================================
immask = zeros(1000,1000);
for i=1:1000
    for j=1:1000
        if(image_double(i,j) == 0)
            immask(i,j) = 1;
        else
            immask(i,j) = 0;
        end
    end
end
%immask(0:1000,0:1000) = M; 

% Put the overlay pattern in magenta on the color image
% =====================================================
im2 = zeros(1000,1000,3);
im2(:,:,1) = (immask==1) .* 255 + (immask==0) .* im1r;
im2(:,:,2) = (immask==1) .* 255 + (immask==0) .* im1g;
im2(:,:,3) = (immask==1) .* 0 + (immask==0) .* im1b;

figure(51), imshow(im2/255);
end
