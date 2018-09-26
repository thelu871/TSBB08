bininvect = [0:1:255];
load clic.mat
histo = hist(clic(:), bininvect);
figure(1)
colormap(gray(256))
subplot(2,1,1), imagesc(clic, [0 255]);
axis image; title('light image'); colorbar
subplot (2,1,2),plot(bininvect,histo,'.-b');
axis tight; title('histogram')

load blod256.mat
histo2 = hist(blod256(:), bininvect);
figure(2)
colormap(gray(256))
subplot(2,1,1), imagesc(blod256, [0 255]);
axis image; title('dark image'); colorbar
subplot (2,1,2),plot(bininvect,histo2,'.-b');
axis tight; title('histogram')


Im = double(imread('baboon.tif'));
histo3 = hist(Im(:), bininvect);
figure(3)
colormap(gray(256))
subplot(2,1,1), imagesc(Im, [0 255]);
axis image; title('baboon image'); colorbar
subplot (2,1,2),plot(bininvect,histo3,'.-b');
axis tight; title('histogram')

A=255/150;
B=A*50;
ImT = A * Im - B;
histo4 = hist(ImT(:), bininvect);
figure(4)
colormap(gray(256))
subplot(2,1,1), imagesc(ImT, [0 255]);
axis image; title('baboon image'); colorbar
subplot (2,1,2),plot(bininvect,histo4,'.-b');
axis tight; title('histogram')

