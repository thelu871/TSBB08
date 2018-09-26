load nuf4b.mat
bininvect=[0:1:255];
histo=hist(nuf4b(:), bininvect);
figure(2)
colormap(gray(256))
subplot(2,3,1),plot(bininvect,histo,'.-b');
subplot(2,3,2),imagesc(nuf4b); %plot(nuf4b);

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

ImS = bwmorph(new_Im,'skel',inf);
subplot(2,3,3),imagesc(ImS);
ImP = bwmorph(ImS,'shrink',4);
subplot(2,3,4),imagesc(ImP);


SE = [0 0 0; 1 1 0; 0 0 0];
ImE = imerode(ImP, SE).*imerode(~ImP, ~SE);
subplot(2,3,5),imagesc(ImE);
track10_val = track10(ImP,25,56)
atan_val = atan2(7,9)

subplot(2,3,6),imagesc(new_Im)
