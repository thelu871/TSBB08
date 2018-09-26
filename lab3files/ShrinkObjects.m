ImC1 = imread('circles.tif');
ImC = imfill(ImC1, 'holes');
SE4 = [0 1 0;
1 1 1;
0 1 0];
SE8 = [1 1 1;
1 1 1;
1 1 1];
ImE = ImC;
for k=1:4
   ImE = imerode(ImE, SE4);
   ImE = imerode(ImE, SE8);
end
ImS = bwmorph(ImC,'shrink',Inf);
figure(1)
colormap(gray(256))
subplot(2,3,1), imagesc(ImC);
axis image; title('Circles');
subplot(2,3,2), imagesc(ImE);
axis image; title('ImE');
subplot(2,3,3), imagesc(ImS);
sum(sum(ImS))
axis image; title('ImS'); 