im = imread('cells.tif');
histo = hist(im(:),[0:255]);

T_NEW = 40
T_NEW_mid = mid_way(histo, T_NEW)
imTmid_NEWT = im>T_NEW;

T = mean(mean(im))
Tmid = mid_way(histo, T)
imTmid = im>Tmid;

figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; colorbar
title('original image');

subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');

subplot(2,2,3), imagesc(imTmid, [0 1]);
axis image; colorbar
title('mid-way thresholded image');

subplot(2,2,4), imagesc(imTmid_NEWT, [0 1]);
axis image; colorbar
title('mid-way thresholded image NEW T');
%% least error
im = imread('cells.tif');
histo = hist(im(:),[0:255]);

T = mean(mean(im))
Tmid = least_error(histo, T)
imTmid = im>Tmid;

figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; colorbar
title('original image');

subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');

subplot(2,2,3), imagesc(imTmid, [0 1]);
axis image; colorbar
title('least_error thresholded image');
%% midway nuf0b
im = imread('nuf4b.tif');
histo = hist(im(:),[0:255]);

T = mean(mean(im))
Tmid = mid_way(histo, T)
imTmid = im>Tmid;

figure(1)
colormap(gray(256))
subplot(2,2,1), imagesc(im, [0 255]);
axis image; colorbar
title('original image');

subplot(2,2,2), plot(0:255, histo, '.-r');
axis tight; grid
title('histogram');

subplot(2,2,3), imagesc(imTmid, [0 1]);
axis image; colorbar
title('mid-way thresholded image');
