clear;
I = imread('image5_gray.png');
figure(1), imshow(I);
[N,M] = size(I);
Histo(1:256) = 0;
for n = 1 : N
    for m = 1 : M
        Histo(I(n,m) + 1) = Histo(I(n,m) + 1) + 1;
    end
end
figure(2), plot(Histo);
Histo1 = imhist(I);
figure(3), plot(Histo1);