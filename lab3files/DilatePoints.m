%% DilatePoint
Im = zeros(64,64);
Im(20,20) = 1; Im(50,30) = 1; Im(25,50) = 1;
SE4 = [0 1 0;
    1 1 1;
    0 1 0];
SE8 = [1 1 1;
    1 1 1;
    1 1 1];
Im_d4 = imdilate(Im, SE4);
Im_d8 = imdilate(Im,SE8);
Im_d4_10=Im;
for i =0:10
    Im_d4_10 = imdilate(Im_d4_10, SE4);
end
Im_d8_10=Im;
for i =0:10
    Im_d8_10 = imdilate(Im_d8_10, SE8);
end
Im_doct_5=Im;
for i =0:5
    Im_doct_5 = imdilate(Im_doct_5, SE4);
    Im_doct_5 = imdilate(Im_doct_5, SE8);
end
figure(1)
colormap(gray(256))
subplot(2,3,1), imagesc(Im);
axis image; title('Three points');
subplot(2,3,2), imagesc(Im_d4);
axis image; title('1 iter d4');
subplot(2,3,3), imagesc(Im_d8);
axis image; title('1 iter d8');
subplot(2,3,4), imagesc(Im_d4_10);
axis image; title('10 iter d4');
subplot(2,3,5), imagesc(Im_d8_10);
axis image; title('10 iter d8');
subplot(2,3,6), imagesc(Im_doct_5);
axis image; title('5 iter doct');
%% Dilate nuf4b
load nuf4b.mat
bininvect=[0:1:255];
histo=hist(nuf4b(:), bininvect);
figure(2)
colormap(gray(256))
subplot(1,3,1),plot(bininvect,histo,'.-b');
subplot(1,3,2),imagesc(nuf4b); %plot(nuf4b);

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

subplot(1,3,3),imagesc(new_Im);
%% demo b
load nuf5.mat
load nuf0a.mat

bininvect=[0:1:255];
histo_nuf5=hist(nuf5(:), bininvect);
histo_nuf0a=hist(nuf0a(:), bininvect);
figure(3)
colormap(gray(256));
subplot(1,2,1),plot(bininvect,histo_nuf5,'.-b');
subplot(1,2,2),plot(bininvect,histo_nuf0a,'.-b');

figure(4)
colormap(gray(256));

new_nuf5 = zeros(128,128);
new_nuf0a = zeros(128,128);
for i = 1:128
    for j = 1:128
        if nuf5(i,j) > 180
            new_nuf5(i,j) = 0;
        else
            new_nuf5(i,j) = 1;
        end
        if nuf0a(i,j) > 140
            new_nuf0a(i,j) = 0;
        else
            new_nuf0a(i,j) = 1;
        end
    end
end

new_nuf5_modified= imdilate(new_nuf5,SE8);
new_nuf5_modified= imerode(new_nuf5_modified,SE8);

new_nuf0a_modified=imerode(new_nuf0a,SE8);
new_nuf0a_modified=imerode(new_nuf0a_modified,SE8);
new_nuf0a_modified=imdilate(new_nuf0a_modified,SE8);
new_nuf0a_modified=imdilate(new_nuf0a_modified,SE8);
new_nuf0a_modified= imdilate(new_nuf0a_modified,SE8);
new_nuf0a_modified= imerode(new_nuf0a_modified,SE8);

subplot(2,2,1),imagesc(new_nuf5);
subplot(2,2,2),imagesc(new_nuf0a);
subplot(2,2,3),imagesc(new_nuf5_modified);
subplot(2,2,4),imagesc(new_nuf0a_modified);

