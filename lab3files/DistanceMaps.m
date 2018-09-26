Im = zeros(64,64);
Im(20,20) = 1;
Im(50,30) = 1;
Im(25,50) = 1;
Im_eq = bwdist(Im);
figure(1)
colormap(colorcube(51))

subplot(2,2,1), imagesc(Im);
axis image; title('Three points'); colorbar

Im_eq = bwdist(Im);
subplot(2,2,2), imagesc(Im_eq, [0 50]);
axis image; title('Euclidian'); colorbar

Im_cityblock = bwdist(Im, 'cityblock');
subplot(2,2,3), imagesc(Im_cityblock, [0 50]);
axis image; title('Im_cityblock'); colorbar

Im_chessboard = bwdist(Im, 'chessboard');
subplot(2,2,4), imagesc(Im_chessboard, [0 50]);
axis image; title('Im_chessboard'); colorbar

ImD = imread('distObject.tif');
Im_inside_dist = bwdist(~ImD);
figure(2)
colormap(colorcube(51))
subplot(2,2,1), imagesc(Im_inside_dist);
axis image; title('distObject'); colorbar