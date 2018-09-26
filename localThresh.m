% Read the image and cast it to double
% ====================================
nuf = double(imread('nuf4b.tif'));
% Extend the image
% ================
tmp = [nuf(:,64:-1:1) nuf nuf(:,128:-1:65)];
nufextend = [tmp(64:-1:1,:); tmp; tmp(128:-1:65,:)];
% Make a Gaussian filter
% ======================
sigma=10; %0.5
lpH=exp(-0.5*([-64:64]/sigma).^2);
lpH=lpH/sum(lpH); % Horizontal filter
lpV=lpH';         % Vertical filter
% Convolve in the horizontal and vertical direction
% =================================================
nufblur = conv2(nufextend, lpH, 'valid');
nufblur = conv2(nufblur, lpV, 'valid');
% Make a new image
% ================
nuf = nuf - nufblur + 128;
figure(1)
colormap(gray(256))

subplot(2,2,1),imagesc(nufextend, [0 255])
axis image; colorbar
title('extended image')

axis image; title('Gaussian kernel')
subplot(2,2,2), imagesc(nufblur, [0 255])
axis image; colorbar
title('blurred image image')

new_Im = zeros(128,128);
for i = 1:128
    for j = 1:128
        if nuf4b(i,j) > 135
            new_Im(i,j) = 0;
        else
            new_Im(i,j) = 1;
        end
    end
end

subplot(2,2,3),imagesc(new_Im, [0 255])
axis image; colorbar
title('new image thresh')
%plot(-64:64, lpH, '.-r')

subplot(2,2,4), imagesc(nuf, [0 255])
axis image; colorbar
title('new image')

%%--------HISTOPART--------------------
histo = hist(nuf(:),[0:255]);

figure(2)
bininvect=[0:1:255];
histo=hist(nuf4b(:), bininvect);
colormap(gray(256))
plot(bininvect,histo,'.-b');

T = mean(mean(nuf))
Tmid = least_error(histo, T)
imTmid = nuf>Tmid;

figure(3)
colormap(gray(256))
subplot(2,3,1), imagesc(imTmid, [0 1]);
axis image; colorbar
title('least_error thresholded image');

histo2 = hist(nuf(:),[0:255]);

T2 = mean(mean(nuf))
Tmid2 = mid_way(histo2, T)
imTmid2 = nuf>Tmid2;

subplot(2,3,2), imagesc(imTmid2, [0 1]);
axis image; colorbar
title('mid-way thresholded image');

imTmid_skel = bwmorph(imTmid,'skel',inf);
subplot(2,3,3), imagesc(imTmid_skel, [0 1]);
axis image; colorbar
title('least-error skel');

imTmid2_skel = bwmorph(imTmid2,'skel',inf);
subplot(2,3,4), imagesc(imTmid2_skel, [0 1]);
axis image; colorbar
title('mid-way skel');

subplot(2,3,5), imagesc(ocrdecide(imTmid_skel, 4), [0 1]);
axis image; colorbar
title('least-error orcdecide');

subplot(2,3,6), imagesc(ocrdecide(imTmid2_skel, 4), [0 1]);
axis image; colorbar
title('mid-way orcdecide');

